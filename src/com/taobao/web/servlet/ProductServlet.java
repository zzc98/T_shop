package com.taobao.web.servlet;

import com.google.gson.Gson;
import com.taobao.domain.*;
import com.taobao.service.ProductService;
import com.taobao.utils.CommonUtils;
import com.taobao.utils.DateUtil;
import com.taobao.utils.JedisPoolUtils;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

public class ProductServlet extends BaseServlet {

    /*	显示商品类别的功能*/     //利用redis数据库实现缓存技术
    public void categoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 没有要获取的数据，直接调用业务层方法
        ProductService service = new ProductService();

        //先从缓存中查询categoryList，如果有，则直接使用；如果没有则从数据库中查询后放到缓存中
        //1.获得jedis对象，连接redis数据库
        Jedis jedis = JedisPoolUtils.getJedis();
        String categoryListJson = jedis.get("categoryListJson");
        //2.判断categoryListJson是否为空
        if (categoryListJson == null) {
            System.out.println("缓存中没有数据，到数据库中查询");
            // 准备分类数据
            List<Category> categoryList = service.findAllCategory();
            Gson gson = new Gson();
            categoryListJson = gson.toJson(categoryList);
        jedis.set("categoryListJson", categoryListJson);
    }
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(categoryListJson);
}

    /*	最新商品与最热商品*/
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //没有要获取的数据，直接调用业务层方法
        ProductService service = new ProductService();

        //准备热门商品——List<Product>

        List<Product> hotProductList = service.findHotProductlist();
        request.setAttribute("hotProductList", hotProductList);

        //准备最新商品——List<Product>
        List<Product> newProductList = service.findNewProductlist();
        request.setAttribute("newProductList", newProductList);

        //备用，动态修改
        List<Product> oneProductList = service.findoneProductlist();
        request.setAttribute("oneProductList", oneProductList);

        //备用，动态修改
        List<Product> twoProductList = service.findtwoProductlist();
        request.setAttribute("twoProductList", twoProductList);

        //备用，动态修改
        List<Product> threeProductList = service.findthreeProductlist();
        request.setAttribute("threeProductList", threeProductList);

        //备用，动态修改
        List<Product> fourProductList = service.findfourProductlist();
        request.setAttribute("fourProductList", fourProductList);

        //备用，动态修改
        List<Product> fiveProductList = service.findfiveProductlist();
        request.setAttribute("fiveProductList", fiveProductList);

/*		//准备分类数据
		List<Category> categoryList = service.findAllCategory();
		request.setAttribute("categoryList", categoryList);*/

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    /*	显示商品详情功能*/
    public void productInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //获得商品类别cid、当前页currentPage
//        String cid = request.getParameter("cid");
//        String currentPage = request.getParameter("currentPage");

        //获得要查询商品的pid
        String pid = request.getParameter("pid");

        //调用业务层方法
        ProductService service = new ProductService();
        Product product = service.findProductByPid(pid);
        request.setAttribute("product", product);

        request.setAttribute("cid", product.getCid());
        request.setAttribute("currentPage", 1);

        //1.获得客户端携带的cookie--获得名字是pids的cookie
        String pids = pid;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("pids".equals(cookie.getName())) {
                    pids = cookie.getValue();//1-3-2,如本次访问的是8，则8-1-3-2
                    //将pids拆成一个数组
                    String[] split = pids.split("-");
                    List<String> asList = Arrays.asList(split);
                    LinkedList<String> list = new LinkedList<String>(asList);
                    //判断集合中是否存在当前pid
                    if (list.contains(pid)) {
                        list.remove(pid);
                    }
                    list.addFirst(pid);//每次新商品添加到队列头
                    //将集合[3,1,2]转成字符串3-1-2
                    StringBuffer sb = new StringBuffer();
                    for (int i = 0; i < list.size() && i < 7; i++) {
                        sb.append(list.get(i));
                        sb.append("-");//3-1-2-
                    }
                    //去掉3-1-2-后的-
                    pids = sb.substring(0, sb.length() - 1);
                }
            }
        }

        //2.转发之前，创建cookie存储pid
        Cookie cookie_pids = new Cookie("pids", pids);
        response.addCookie(cookie_pids);

        request.getRequestDispatcher("/product_info.jsp").forward(request, response);
    }

    /*	根据商品类别cid获得商品列表的功能*/
    public void productList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得cid

        String cid = request.getParameter("cid");//种类
        String currentPageStr = request.getParameter("currentPage");//当前页
        if (currentPageStr == null)
            currentPageStr = "1";

        int currentPage = Integer.parseInt(currentPageStr);
        int currentCount = 10;

        //封装一个pageBean
        ProductService service = new ProductService();
        PageBean<Product> pageBean = service.findProductListByCid(cid, currentPage, currentCount);

        request.setAttribute("pageBean", pageBean);
        request.setAttribute("cid", cid);

        //定义一个记录历史访问商品的集合
        List<Product> historyProductList = new ArrayList<Product>();
        //转发前获得客户端携带的，名为pids的cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("pids".equals(cookie.getName())) {
                    String pids = cookie.getValue();//3-2-1
                    String[] split = pids.split("-");
                    for (String pid : split) {
                        Product pro = service.findProductByPid(pid);
                        historyProductList.add(pro);
                    }
                }
            }
        }
        request.setAttribute("historyProductList", historyProductList);
        request.getRequestDispatcher("/product_list.jsp").forward(request, response);
    }

    /*	将商品添加到购物车功能*/
    public void addProductToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductService service = new ProductService();
        //获得新买商品的pid
        String pid = request.getParameter("pid");
        //获得新买商品数量buyNum
        int buyNum = Integer.parseInt(request.getParameter("buyNum"));
        //根据pid获得Product对象
        Product product = service.findProductByPid(pid);
        //计算新买商品小计
        double subtotal = product.getShop_price()*buyNum;

        //获得购物车对象-----先判断session中是否已存在购物车cart
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart==null){
            //session中没有，则new一个购物车对象cart
            cart = new Cart();
        }

        //获得购物项集合
        Map<String, CartItem> cartItems = cart.getCartItems();

        CartItem item = null;
        int oldbuyNum = 0;
        double oldsubtotal = 0.0;
        //先判断购物项集合中是否已包含该购物项（判断key是否已经存在）
        if(cartItems.containsKey(pid)){
            //车中包含该购物项对象，取出该购物项
            item = cartItems.get(pid);
            //获得原来购物项的商品数量
            oldbuyNum = item.getBuyNum();
            //获得原来购物项的商品小计
            oldsubtotal = item.getSubtotal();

        }else{
            //车中没有该购物项对象，则new一个购物项对象
            item = new CartItem();
        }

        //封装购物项   CartItem对象
        item.setBuyNum(buyNum + oldbuyNum);
        item.setProduct(product);
        item.setSubtotal(subtotal + oldsubtotal);

        //将购物项放入车中
        cart.getCartItems().put(product.getPid(), item);

        //计算购物车商品总计（只加新增商品小计即可，原有购物项小计已计入过总计）
        double total = cart.getTotal() + subtotal;

        //总计放入购物车对象
        cart.setTotal(total);

        //将车放到session域中
        session.setAttribute("cart", cart);

        //重定向到购物车页面
        response.sendRedirect(request.getContextPath()+"/cart.jsp");
    }

    /*	删除购物车中单一商品*/
    public void delProFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        //删除session域中cart对象的购物项map集合cartItems中的item
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart!=null){
            Map<String, CartItem> cartItems = cart.getCartItems();
            //先修改购物车cart总计，减去被删除购物项的小计
            cart.setTotal(cart.getTotal()-cartItems.get(pid).getSubtotal());
            //再删除购物项item
            cartItems.remove(pid);
            cart.setCartItems(cartItems);
        }
        //将购物车cart放回session域
        session.setAttribute("cart", cart);
        //跳转回cart.jsp
        response.sendRedirect(request.getContextPath()+"/cart.jsp");
    }

    /*	清空购物车*/
    public void clearCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //从session中移除购物车
        session.removeAttribute("cart");
        //跳转回cart.jsp
        response.sendRedirect(request.getContextPath()+"/cart.jsp");
    }

    /*	提交订单*/
    public void submitOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //校验用户是否登录
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // 用户没有登录
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        //目标：封装好一个Order对象传递给service层
        Order order = new Order();
        //1.获得订单号
        String oid = CommonUtils.getUUID();
        order.setOid(oid);
        //2.获得下单时间
        Date date = new Date();
        order.setOrdertime(DateUtil.getCurrentTime());
        //3.订单的总金额
        //获得session中的购物车
        Cart cart = (Cart) session.getAttribute("cart");
        double total = cart.getTotal();
        order.setTotal(total);
        //4.支付状态
        order.setState(0);
        //5.收货地址
        order.setAddress(null);
        //6.收货人
        order.setName(null);
        //7.收货人电话
        order.setTelephone(null);
        //8.订单属于哪个用户
        order.setUser(user);
        //9.该订单中有多少订单项List<OrderItem> orderItems = new ArrayList<OrderItem>();
        //获得购物车中购物项的集合
        Map<String, CartItem> cartItems = cart.getCartItems();
        for(Map.Entry<String, CartItem> entry : cartItems.entrySet()){
            //取出每一个购物项
            CartItem cartItem = entry.getValue();
            //创建新的订单项
            OrderItem orderItem = new OrderItem();

            orderItem.setItemid(CommonUtils.getUUID());
            orderItem.setCount(cartItem.getBuyNum());
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setOrder(order);

            //将该订单项添加到订单的订单项集合中
            order.getOrderItems().add(orderItem);
        }

        //Order对象封装完毕,传递到service层
        ProductService service = new ProductService();
        service.submitOrder(order);

        session.setAttribute("order", order);

        //页面跳转
        response.sendRedirect(request.getContextPath()+"/order_info.jsp");

    }

}

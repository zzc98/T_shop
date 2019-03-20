package com.taobao.web.servlet;

import com.taobao.Constant.Constant;
import com.taobao.domain.Car;
import com.taobao.domain.Order;
import com.taobao.domain.PageBean;
import com.taobao.domain.User;
import com.taobao.factory.ContextFactory;
import com.taobao.service.OrderService;
import com.taobao.utils.PaymentUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ResourceBundle;

/**
 * 处理订单模块的所有请求
 */
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 保存订单
	 * @param request
	 * @param response
	 * @return
	 */
	public void save(HttpServletRequest request, HttpServletResponse response){
		//保存订单其实就是从购物车中拿出数据，存放到订单中
		//1.获取car对象
		HttpSession session = request.getSession();
		Car car = (Car) session.getAttribute("car");

		//获取user对象
		User user = (User) session.getAttribute("user");

		//2.将car对象中的数据封装到Order对象中
		try {
			OrderService service = new OrderService();
			Order order = service.saveOrder(car,user);

			//订单保存好之后，一定要清空购物车
			car.clear();

			session.setAttribute("order", order);
			//跳转到order_info页面，并且显示order订单的详情
			response.sendRedirect(request.getContextPath()+"/order_info.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 分页展示订单的方法
	 * @param request
	 * @param response
	 * @return
	 */
	public void page(HttpServletRequest request, HttpServletResponse response){
		//获取当前用户的user对象
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		//1.获取curPage
		Integer curPage = Integer.parseInt(request.getParameter("curPage"));
		
		//2.调用业务层的方法获取当前分页的PageBean
		try {
			OrderService service = new OrderService();
			PageBean<Order> pageBean = service.findPageBean(curPage,user);
			
			//将PageBean存放到session中
			session.setAttribute("page", pageBean);
			//这个也是直接转的
			response.sendRedirect(request.getContextPath()+"/order_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 根据oid查找订单信息
	 * @param request
	 * @param response
	 * @return
	 */
	public void findByOid(HttpServletRequest request, HttpServletResponse response){
		//获取了oid
		String oid = request.getParameter("oid");
		//调用业务层的方法，根据oid获取订单信息
		try {
			OrderService service = new OrderService();
			Order order = service.findOrderByOid(oid);
			
			//将order存放到session中
			HttpSession session = request.getSession();
			session.setAttribute("order", order);
			
			//跳转到order_info.jsp页面展示
			response.sendRedirect(request.getContextPath()+"/order_info.jsp");
		} catch (Exception e) {
			e.printStackTrace();

		}

	}
	/**
	 * 处理支付请求
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//1.获取客户端传过来的请求参数
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String pd_FrpId = request.getParameter("pd_FrpId");
		
		String oid = request.getParameter("oid");
		//根据oid查找该订单的信息
		try {
			OrderService service = (OrderService) ContextFactory.getInstance("order_service");
			Order order = service.findOrderByOid(oid);
			//修改order的address、name、telephone
			order.setAddress(address);
			order.setName(name);
			order.setTelephone(telephone);
			
			service.updateOrder(order);
			
			//1.发送一个请求到第三方的某个地址------>重定向到第三方支付公司的服务器
			String url = PaymentUtil.buildUrl(pd_FrpId, oid, "order.getTotal()");
			//2.重定向到url地址
			response.sendRedirect(url);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 处理第三方公司发过来的支付结果
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public void callback(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");//支付的订单的oid
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String rb_BankId = request.getParameter("rb_BankId");
		String ro_BankOrderId = request.getParameter("ro_BankOrderId");
		String rp_PayDate = request.getParameter("rp_PayDate");
		String rq_CardNo = request.getParameter("rq_CardNo");
		String ru_Trxtime = request.getParameter("ru_Trxtime");
		// 身份校验 --- 判断是不是支付公司通知你
		String hmac = request.getParameter("hmac");//第三方支付公司的hmac
		String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
				"keyValue");

		// 自己对上面数据进行加密 --- 比较支付公司发过来hamc(为了验证第三方支付公司的身份)
		boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
				r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
				r8_MP, r9_BType, keyValue);
		if (isValid) {
			// 响应数据有效
			if (r9_BType.equals("1")) {
				// 浏览器重定向
				//说明第三方公司重定向过来了，那么我们就将结果告诉客户端就OK了
				request.setAttribute("msg", "您的订单号为:"+r6_Order+",金额为:"+r3_Amt+"已经支付成功,等待发货~~");
			} else if (r9_BType.equals("2")) {
				// 服务器点对点 --- 支付公司通知你
				System.out.println("付款成功！222");
				// 修改订单状态 为已付款
				// 回复支付公司
				response.getWriter().print("success");
			}
			
			//修改订单状态
			OrderService service;
			try {
				service = (OrderService) ContextFactory.getInstance("order_service");
				
				Order order = service.findOrderByOid(r6_Order);
				
				//修改订单的状态为"已支付"  1
				
				order.setState(Constant.PAYED);
				
				//到数据库更新订单
				service.updateOrder(order);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			// 数据无效
			System.out.println("数据被篡改！");
		}


		response.sendRedirect(request.getContextPath()+"/msg.jsp");
	}
	public void changestate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String oid=request.getParameter("oid");
		OrderService service=new OrderService();
		Order order= null;
		try {
			order = service.findOrderByOid(oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.changestate(order);
		try {
			request.getRequestDispatcher("/order_list.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
}

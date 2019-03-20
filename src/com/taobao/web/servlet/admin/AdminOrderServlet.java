package com.taobao.web.servlet.admin;

import com.taobao.Constant.Constant;
import com.taobao.domain.Order;
import com.taobao.domain.PageBean;
import com.taobao.service.admin.AdminOrderService;
import com.taobao.web.servlet.BaseServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 处理后台管理订单的所有请求
 */
public class AdminOrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 更新订单状态
	 * @param request
	 * @param response
	 * @return
	 */
	public void update(HttpServletRequest request, HttpServletResponse response){
		//1.获取客户端传入的oid
		String oid = request.getParameter("oid");
		//2.调用业务层的方法，将对应的oid的订单的state修改成已发货
		//2.1根据oid查找订单信息
		try {
			AdminOrderService service =new AdminOrderService();
			Order order = service.findOrderByOid(oid);
			
			order.setState(Constant.SEND);
			
			
			//2.2修改订单信息
			service.updateOrder(order);
			//更新完成之后，跳转到查询所有已发货订单
			response.sendRedirect(request.getContextPath()+"/adminOrder?methodStr=page&curPage=1&state=2");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 查询单个订单详情的方法
	 * @param request
	 * @param response
	 * @return
	 */
	public void detail(HttpServletRequest request, HttpServletResponse response){
		//1.获取oid
		String oid = request.getParameter("oid");
		
		//2.调用业务层的方法，根据oid查找到该订单对应的所有订单项的集合转换成的json字符串
		try {
			AdminOrderService service = new AdminOrderService();
			String json = service.findOrderItems(oid);
			
			//将json写出去
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 分页查看订单的方法
	 * @param request
	 * @param response
	 * @return
	 */
	public void page(HttpServletRequest request, HttpServletResponse response){
		//1.获取客户端传过来的请求参数
		Integer curPage = Integer.parseInt(request.getParameter("curPage"));
		String param = request.getParameter("state");
		Integer state = null;
		if (param != null && !param.equals("")) {
			state = Integer.parseInt(param);
		}
		//2.调用业务层的方法，获取分页的PageBean对象
		try {
			AdminOrderService service = new AdminOrderService();
			PageBean<Order> pageBean = service.findPageBean(curPage,state);
			
			//3.将PageBean存放到session中
			request.getSession().setAttribute("page", pageBean);
			
			//4.重定向跳转到"/admin/order/list.jsp"
			if (state != null && !param.equals("")) {
				response.sendRedirect(request.getContextPath()+"/admin/order/list.jsp?state="+state);
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/order/list.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

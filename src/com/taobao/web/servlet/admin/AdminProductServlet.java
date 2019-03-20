package com.taobao.web.servlet.admin;

import com.taobao.domain.PageBean;
import com.taobao.domain.Product;
import com.taobao.service.admin.AdminProductService;
import com.taobao.web.servlet.BaseServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 处理所有管理商品的请求的Servlet
 */
public class AdminProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	public void page(HttpServletRequest request, HttpServletResponse response){
		//1.获取当前页数
		Integer curPage = Integer.parseInt(request.getParameter("curPage"));
		//2.调用业务层的方法，获取PageBean对象
		try {
			AdminProductService service = new AdminProductService();
			PageBean<Product> pageBean = service.findPageBean(curPage);

			//3.将PageBean对象存放到域对象中
			request.getSession().setAttribute("page", pageBean);
			
			//4.跳转到"admin/product/list.jsp"
			response.sendRedirect(request.getContextPath()+"/admin/product/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

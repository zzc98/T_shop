package com.taobao.web.servlet.admin;

import com.taobao.dao.admin.AdminCategoryDao;
import com.taobao.domain.Category;
import com.taobao.service.admin.AdminCategoryService;
import com.taobao.utils.UUIDUtils;
import com.taobao.web.servlet.BaseServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 处理后台管理分类信息的Servlet
 */
public class AdminCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * 添加分类
	 * @param request
	 * @param response
	 * @return
	 */
	public void add(HttpServletRequest request, HttpServletResponse response){
		//获取请求参数cname
		String cname = request.getParameter("cname");
		//创建一个Category对象
		Category category = new Category();
		category.setCname(cname);
		category.setCid(UUIDUtils.getId());
		
		//2.调用业务层的方法，存储category
		try {
			AdminCategoryService service = new AdminCategoryService();
			service.saveCategory(category);
			
			//3.添加完之后，跳转到展示所有分类信息,刚好调用findall方法就行了
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * @param request
	 * @param response
	 * @return
	 */
	public void findAll(HttpServletRequest request, HttpServletResponse response){
		//调用AdminService的方法查找所有分类信息的集合
		try {
			AdminCategoryService service = new AdminCategoryService();
			List<Category> categories = service.findAll();
			
			//将集合存放到域对象中
			HttpSession session = request.getSession();
			session.setAttribute("cs", categories);
			
			//跳转"/admin/category/list.jsp"页面展示
			response.sendRedirect(request.getContextPath()+"/admin/category/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public void delete(HttpServletRequest request, HttpServletResponse response){

		String cname = request.getParameter("cname");
		try {
			AdminCategoryDao dao = new AdminCategoryDao();
			dao.delete(cname);
            response.sendRedirect(request.getContextPath()+"/admin/category/list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

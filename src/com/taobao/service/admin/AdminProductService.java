package com.taobao.service.admin;

import com.taobao.Constant.Constant;
import com.taobao.dao.admin.AdminProductDao;
import com.taobao.domain.PageBean;
import com.taobao.domain.Product;

import java.util.List;

public class AdminProductService {

	public PageBean<Product> findPageBean(Integer curPage) {
		PageBean<Product> pageBean = new PageBean<>();
		//设置curPage
		pageBean.setCurrentPage(curPage);
		Integer pageSize = Constant.PRODUCT_PAGE;
		//设置每页的商品条数
		pageBean.setCurrentCount(pageSize );
		//设置总数据条数
		try {
			AdminProductDao dao = new AdminProductDao();
			Long totalSize = dao.getCount();
			pageBean. setTotalCount(Math.toIntExact(totalSize));
			
			//设置totalPage
			Integer totalPage = (int) (totalSize/pageSize);
			if (totalSize % pageSize != 0) {
				totalPage ++;
			}
			pageBean.setTotalPage(totalPage);
			
			//设置每页的商品集合
			List<Product> products = dao.findPageProducts(curPage,pageSize);
			pageBean.setList(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageBean;
	}


	public void saveProduct(Product product) {
		//调用dao层的方法将product保存到数据库
		try {
			AdminProductDao dao = new AdminProductDao();
			dao.saveProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

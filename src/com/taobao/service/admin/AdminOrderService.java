package com.taobao.service.admin;

import com.taobao.Constant.Constant;
import com.taobao.dao.admin.AdminOrderDao;
import com.taobao.domain.Order;
import com.taobao.domain.OrderItem;
import com.taobao.domain.PageBean;
import com.taobao.utils.JsonUtil;

import java.util.List;

public class AdminOrderService {

	public PageBean<Order> findPageBean(Integer curPage, Integer state) {
		PageBean<Order> pageBean = new PageBean<>();
		//设置PageBean
		pageBean.setCurrentPage(curPage);
		
		Integer pageSize = Constant.ADMIN_ORDER_PAGE;
		pageBean.setCurrentCount(pageSize );
		
		//调用dao层的方法到数据库查询所有数据的条数
		try {
			AdminOrderDao dao = new AdminOrderDao();
			Long totalSize = dao.getCount(state);
			pageBean.setTotalCount(Math.toIntExact(totalSize));
			
			Integer totalPage = (int) (totalSize % pageSize == 0 ? (totalSize/pageSize) : ((totalSize/pageSize)+1));
			pageBean.setTotalPage(totalPage );
			
			//设置数据集合
			List<Order> orders = dao.findPageOrders(curPage,pageSize,state);
			pageBean.setList(orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageBean;
	}


	public String findOrderItems(String oid) {
		//1.调用dao层额方法获取oid对应的所有订单项的集合
		String json = null;
		try {
			AdminOrderDao dao = new AdminOrderDao();
			List<OrderItem> orderItems = dao.findOrderItemsByOid(oid);
			
			
			//2.将订单项的集合转换成json
			json = JsonUtil.list2json(orderItems);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}


	public Order findOrderByOid(String oid) {
		//调用dao层的方法查找订单
		Order order = null;
		try {
			AdminOrderDao dao = new AdminOrderDao();
			order = dao.findOrderByOid(oid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return order;
	}


	public void updateOrder(Order order) {
		try {
			AdminOrderDao dao =new AdminOrderDao();
			dao.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

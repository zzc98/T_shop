package com.taobao.service;

import com.taobao.Constant.Constant;
import com.taobao.dao.OrderDao;
import com.taobao.domain.*;
import com.taobao.utils.DateUtil;
import com.taobao.utils.TransactionManager;
import com.taobao.utils.UUIDUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class OrderService {

	public Order saveOrder(Car car, User user) {
		//1.将car中的数据保存到Order对象中
		Order order = new Order();
		//1.1设置oid
		order.setOid(UUIDUtils.getId());
		//1.2设置ordertime
		order.setOrdertime(DateUtil.getCurrentTime());
		//1.3name,address,telephone这三个暂时不需要设置
		//1.4设置state
		order.setState(Constant.UNPAY);
		//1.5设置total
		order.setTotal(car.getTotalPrice());
		//1.6设置orderItem的集合-------->购物车中的所有购物项
		Map<String, CarItem> items = car.getItems();
		//创建一个订单项的集合
		List<OrderItem> orderItems = new ArrayList<>();
		//只需要map的value
		Collection<CarItem> values = items.values();
		for (CarItem carItem : values) {
			//每一个CarItem对象对应一个OrderItem对象
			OrderItem orderItem = new OrderItem();
			//设置orderItem对象中的数据
			//1.设置itemid
			orderItem.setItemid(UUIDUtils.getId());
			//2.设置count
			orderItem.setCount(carItem.getCount());
			//3.设置subtotal
			orderItem.setSubtotal(carItem.getSubTotal());
			//4.设置product
			orderItem.setProduct(carItem.getProduct());
			
			orderItem.setOrder(order);
			
			//将orderItem对象添加到集合中去
			orderItems.add(orderItem);
		}
		order.setOrderItems(orderItems);
		
		//1.7设置user
		order.setUser(user);
		
		//2.将order对象中的信息保存到数据库中去
		//使用事务
		//开启事务
		try {
			TransactionManager.startTransaction();
			//2.1将order的信息保存到orders表
			OrderDao dao = new OrderDao();
			dao.saveOrder(order);
			
			//2.2将所有的orderItem的信息保存到orderitem表
			for (OrderItem orderItem : orderItems) {
				dao.saveOrderItem(orderItem);
			}
			
			//提交事务
			TransactionManager.commit();
		} catch (Exception e) {
			e.printStackTrace();
			//回滚事务
			try {
				TransactionManager.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				TransactionManager.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return order;
	}


	public PageBean<Order> findPageBean(Integer curPage, User user) {
		//1.创建PageBean对象
		PageBean<Order> pageBean = new PageBean<>();
		//2.设置pageBean
		pageBean.setCurrentPage(curPage);
		//2.设置pageSize
		Integer pageSize = Constant.ORDER_PAGE;
		pageBean.setCurrentCount(pageSize);
		//3.设置总数据条数
		try {
			OrderDao dao = new OrderDao();
			Long totalSize = dao.getCount(user);
			pageBean.setTotalCount(Math.toIntExact(totalSize));
			
			//4.设置totalPage
			int totalPage = (int) (totalSize/pageSize);
			if (totalSize % pageSize != 0) {
				totalPage ++;
			}
			pageBean.setTotalPage(totalPage);
			
			//5.设置当前分页的数据集合
			List<Order> orders = dao.findPageOrders(curPage,pageSize,user);
			//集合中的每一个订单，里面还没设置好订单项
			for (Order order : orders) {
				//给每一个订单设置订单项
				//获取该订单对应的订单项集合
				List<OrderItem> orderItems = dao.getOrderItems(order);
				order.setOrderItems(orderItems);
			}
			
			pageBean.setList(orders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageBean;
	}


	public Order findOrderByOid(String oid) throws Exception {
		//调用dao层的方法根据oid查找订单信息
		Order order = null;

			OrderDao dao = new OrderDao();
			order = dao.findOrderByOid(oid);
			
			//order中有没有orderItems
			List<OrderItem> orderItems = dao.getOrderItems(order);
			order.setOrderItems(orderItems);

		return order;
	}


	public void updateOrder(Order order) {
		//调用dao层的方法更新订单信息
		try {
			OrderDao dao = (OrderDao) com.taobao.factory.ContextFactory.getInstance("order_dao");
			dao.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void changestate(Order order) {
		OrderDao dao=new OrderDao();
		try {
			dao.setState(order);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

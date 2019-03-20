package com.taobao.dao.admin;

import com.taobao.domain.Order;
import com.taobao.domain.OrderItem;
import com.taobao.domain.Product;
import com.taobao.utils.C3P0Util;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AdminOrderDao {

	public Long getCount(Integer state) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select count(*) from orders";
		List<Object> params = new ArrayList<>();
		if (state != null) {
			sql += " where state=?";
			params.add(state);
		}
		Long count = (Long) runner.query(sql, new ScalarHandler(), params.toArray());
		return count;
	}


	public List<Order> findPageOrders(Integer curPage, Integer pageSize, Integer state) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orders ";
		List<Object> params = new ArrayList<>();
		if (state != null) {
			sql += "where state=? limit ?,?";
			params.add(state);
		}else {
			sql += "limit ?,?";
		}
		params.add((curPage - 1)*pageSize);
		params.add(pageSize);
		List<Order> list = runner.query(sql, new BeanListHandler<>(Order.class), params.toArray());
		return list;
	}


	public List<OrderItem> findOrderItemsByOid(String oid) throws Exception {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orderitem o left join product p on o.pid=p.pid where o.oid=?";
		List<Map<String, Object>> maps = runner.query(sql, new MapListHandler(), oid);
		//maps集合中，每一个map就对应一个订单项
		List<OrderItem> orderItems = new ArrayList<>();
		for (Map<String, Object> map : maps) {
			//每一个map中既包含orderItem的信息，又包含其对应的product的信息
			OrderItem orderItem = new OrderItem();
			BeanUtils.populate(orderItem, map);
			
			Product product = new Product();
			BeanUtils.populate(product, map);
			
			orderItem.setProduct(product);
			
			orderItems.add(orderItem);
		}
		return orderItems;
	}


	public Order findOrderByOid(String oid) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orders where oid=?";
		Order order = runner.query(sql, new BeanHandler<>(Order.class), oid);
		return order;
	}


	public void updateOrder(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "update orders set total=?,state=?,telephone=?,name=?,address=? where oid=?";
		runner.update(sql,order.getTotal(),order.getState(),order.getTelephone(),order.getName(),order.getAddress(),order.getOid());
	}

}

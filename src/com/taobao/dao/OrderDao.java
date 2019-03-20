package com.taobao.dao;

import com.taobao.domain.Order;
import com.taobao.domain.OrderItem;
import com.taobao.domain.Product;
import com.taobao.domain.User;
import com.taobao.utils.C3P0Util;
import com.taobao.utils.TransactionManager;
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

public class OrderDao {

	public void saveOrder(Order o) throws Exception {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into orders values (?,?,?,?,?,?,?,?)";
		runner.update(TransactionManager.getConnectionFromThreadLocal(), sql,
				o.getOid(),
				o.getOrdertime(),
				o.getTotal(),
				o.getState(),
				o.getAddress(),
				o.getName(),
				o.getTelephone(),
				o.getUser().getUid());
	}


	public void saveOrderItem(OrderItem item) throws Exception {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into orderitem values (?,?,?,?,?)";
		runner.update(TransactionManager.getConnectionFromThreadLocal(), sql,
				item.getItemid(),
				item.getCount(),
				item.getSubtotal(),
				item.getProduct().getPid(),
				item.getOrder().getOid());
	}


	public Long getCount(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select count(*) from orders where uid=?";
		Long count = (Long) runner.query(sql, new ScalarHandler(), user.getUid());
		return count;
	}


	public List<Order> findPageOrders(Integer curPage, Integer pageSize, User user) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from orders where uid=? limit ?,?";
		List<Order> list = runner.query(sql, new BeanListHandler<>(Order.class), user.getUid(), (curPage - 1) * pageSize, pageSize);
		return list;
	}


	public List<OrderItem> getOrderItems(Order order) throws Exception {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		//连接orderitem表和product表查询
		String sql = "select * from orderitem o,product p where o.pid=p.pid and o.oid=?";
		List<Map<String, Object>> maps = runner.query(sql, new MapListHandler(), order.getOid());

		List<OrderItem> orderItems = new ArrayList<>();
		//1.遍历maps
		for (Map<String, Object> map : maps) {
			//遍历出每一个map，一个map就对应一条数据----->orderItem对象
			//1.1将map中的数据封装到OrderItem对象中
			OrderItem orderItem = new OrderItem();
			BeanUtils.populate(orderItem, map);

			//1.2将map中的数据封装到product中
			Product product = new Product();
			BeanUtils.populate(product, map);

			//1.3将product封装到orderItem中,手动封装
			orderItem.setProduct(product);


			//1.4封装order对象到orderItem中
			orderItem.setOrder(order);

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
		String sql = "update orders set total=?,state=?,address=?,name=?,telephone=? where oid=?";
		runner.update(sql, order.getTotal(), order.getState(), order.getAddress(), order.getName(), order.getTelephone(), order.getOid());
	}

	public void setState(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "update orders set state=? where oid=?";
		runner.update(sql, 1, order.getOid());
	}
}

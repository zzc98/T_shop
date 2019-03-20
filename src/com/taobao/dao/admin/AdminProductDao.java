package com.taobao.dao.admin;

import com.taobao.domain.Product;
import com.taobao.utils.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class AdminProductDao {

	public Long getCount() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select count(*) from product";
		Long count = (Long) runner.query(sql, new ScalarHandler());
		return count;
	}


	public List<Product> findPageProducts(Integer curPage, Integer pageSize) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from product limit ?,?";
		List<Product> list = runner.query(sql, new BeanListHandler<>(Product.class),(curPage - 1)*pageSize,pageSize);
		return list;
	}


	public void saveProduct(Product p) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "insert into product values (?,?,?,?,?,?,?,?,?,?,?)";
		runner.update(sql,p.getPid(),
				p.getPname(),
				p.getMarket_price(),
				p.getShop_price(),
				p.getPimage(),
				p.getPdate(),
				p.getIs_hot(),
				p.getPdesc(),
				p.getPflag(),
				p.getCategory().getCid(),
				p.getTEL());
	}

}

package com.taobao.dao.admin;

import com.taobao.domain.Category;
import com.taobao.utils.C3P0Util;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class AdminCategoryDao {

	public List<Category> findAll() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "select * from category";
		List<Category> list = runner.query(sql, new BeanListHandler<>(Category.class));
		return list;
	}


	public void saveCategory(Category category) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "insert into category values (?,?)";
		runner.update(sql, category.getCid(),category.getCname());
	}
	public void delete(String cname) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Util.getDataSource());
		String sql = "DELETE FROM category WHERE cname = ? ";
		runner.update(sql, cname);

	}

}

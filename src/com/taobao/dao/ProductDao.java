package com.taobao.dao;

import com.taobao.domain.Category;
import com.taobao.domain.Order;
import com.taobao.domain.OrderItem;
import com.taobao.domain.Product;
import com.taobao.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class ProductDao {
    public List<Category> findAllCategory() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from category";
        return runner.query(sql, new BeanListHandler<Category>(Category.class));
    }
    //准备热门商品
    public List<Product> findHotProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where is_hot = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 1,0,4);
    }

    //准备最新商品
    public List<Product> findNewProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product order by pdate desc limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 0,4);
    }

    //家电数码
    public List<Product> findoneProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 1,0,10);
    }

    //男装女装
    public List<Product> findtwoProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 2,0,6);
    }

    //体育运动
    public List<Product> findthreeProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 3,0,6);
    }

    //教材资料
    public List<Product> findfourProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 4,0,4);
    }

    //生活用品
    public List<Product> findfiveProductlist() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid = ? limit ?,?";
        return runner.query(sql, new BeanListHandler<Product>(Product.class), 5,0,4);
    }

    public Product findProductByPid(String pid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where pid=? ";
        return runner.query(sql, new BeanHandler<Product>(Product.class), pid);
    }

    public int getcount(String cid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from product where cid=?";
        Long query = (Long) runner.query(sql, new ScalarHandler(),cid);
        return query.intValue();
    }

    //获得每页显示商品数据
    public List<Product> findProductListByCid(String cid, int index, int currentCount) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid=? limit ?,?";
        List<Product> list = runner.query(sql, new BeanListHandler<Product>(Product.class), cid,index,currentCount);
        return list;

    }

    //向orders表插入数据
    public void addOrders(Order order) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
        Connection conn = DataSourceUtils.getConnection();
        runner.update(conn, sql, order.getOid(),order.getOrdertime(),order.getTotal(),order.getState(),
                order.getAddress(),order.getName(),order.getTelephone(),order.getUser().getUid());
    }

    //向orderitem表插入数据
    public void addOrderItem(Order order) throws SQLException {
        QueryRunner runner = new QueryRunner();
        String sql = "insert into orderitem values(?,?,?,?,?)";
        Connection conn = DataSourceUtils.getConnection();
        List<OrderItem> orderItems = order.getOrderItems();
        for (OrderItem item : orderItems) {
            runner.update(conn, sql, item.getItemid(),item.getCount(),item.getSubtotal(),item.getProduct().getPid(),item.getOrder().getOid());
        }
    }

}

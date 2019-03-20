package com.taobao.service;

import com.taobao.dao.ProductDao;
import com.taobao.domain.Category;
import com.taobao.domain.Order;
import com.taobao.domain.PageBean;
import com.taobao.domain.Product;
import com.taobao.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    public  List<Category> findAllCategory(){
    ProductDao dao = new ProductDao();
    List<Category> categoryList = null;
		try {
                categoryList = dao.findAllCategory();
                } catch (SQLException e) {
                e.printStackTrace();
                }
                return categoryList;

    }

    //获得热门商品
    public List<Product> findHotProductlist() {

        ProductDao dao = new ProductDao();
        List<Product> hotProductList = null;
        try {
            hotProductList = dao.findHotProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return hotProductList;
    }

    //获得最新商品
    public List<Product> findNewProductlist() {
        ProductDao dao = new ProductDao();
        List<Product> newProductList = null;
        try {
            newProductList = dao.findNewProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newProductList;
    }

    //备用
    public List<Product> findoneProductlist() {
        ProductDao dao = new ProductDao();
        List<Product> oneProductList = null;
        try {
            oneProductList = dao.findoneProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return oneProductList;
    }

    //备用
    public List<Product> findtwoProductlist() {
        ProductDao dao = new ProductDao();
        List<Product> twoProductList = null;
        try {
           twoProductList = dao.findtwoProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return twoProductList;
    }

    //备用
    public List<Product> findthreeProductlist() {
        ProductDao dao = new ProductDao();
        List<Product>  threeProductList = null;
        try {
            threeProductList = dao.findthreeProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return threeProductList;
    }

    //备用
    public List<Product> findfourProductlist() {
        ProductDao dao = new ProductDao();
        List<Product> fourProductList = null;
        try {
            fourProductList = dao.findfourProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fourProductList;
    }

    //备用
    public List<Product> findfiveProductlist() {
        ProductDao dao = new ProductDao();
        List<Product> fiveProductList = null;
        try {
            fiveProductList = dao.findfiveProductlist();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fiveProductList;
    }

    //根据pid查询商品信息
    public Product findProductByPid(String pid) {
        ProductDao dao = new ProductDao();
        Product product = null;
        try {
            product = dao.findProductByPid(pid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    //根据cid获得分页数据
    public PageBean<Product> findProductListByCid(String cid, int currentPage, int currentCount) {
        ProductDao dao = new ProductDao();

        // 封装一个PageBean  返回web层
        PageBean<Product> pageBean = new PageBean<Product>();
        //1.封装当前页
        pageBean.setCurrentPage(currentPage);
        //2.封装每页显示条数
        pageBean.setCurrentCount(currentCount);
        //3.封装总条数
        int totalCount = 0;
        try {
            totalCount = dao.getcount(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        //4.封装总页数
        int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);
        //5.封装当前页显示的商品
        int index = (currentPage-1)*currentCount;
        List<Product> list = null;
        try {
            list = dao.findProductListByCid(cid,index,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setList(list);

        return pageBean;
    }

    //提交订单,将订单数据和订单项数据存储到数据库中
    public void submitOrder(Order order) {
        ProductDao dao = new ProductDao();
        try {
            //1.开启事务
            DataSourceUtils.startTransaction();
            //2.调用dao存储orders表数据的方法
            dao.addOrders(order);
            //3.调用dao存储orderitem表数据的方法
            dao.addOrderItem(order);

        } catch (SQLException e) {
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        }finally{
            try {
                DataSourceUtils.commitAndRelease();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}

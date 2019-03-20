package com.taobao.dao;

import com.taobao.domain.User;
import com.taobao.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {
    //注册
    public int regist(User user) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
        int update = runner.update(sql,user.getUid(),user.getUsername(),user.getPassword(),
                user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),
                user.getSex(),user.getState(),user.getCode(),user.getPasswordagain());
        return update;
    }
    //激活
    public  void active(String code) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update user set state = ? where code = ? ";
        runner.update(sql, 1, code);
    }
    //登录
    public User login(String username, String password) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username = ? and password = ?";
        User user = runner.query(sql, new BeanHandler<User>(User.class),username,password);
        return user;
    }
}

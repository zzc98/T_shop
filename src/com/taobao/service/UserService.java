package com.taobao.service;

import com.taobao.dao.UserDao;
import com.taobao.domain.User;

import java.sql.SQLException;

public class UserService {
    public boolean regist(User user) {
        UserDao dao = new UserDao();
        int row = 0;
        try {
            row = dao.regist(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row>0 ? true:false;
    }
    public void active(String code) {
        UserDao dao = new UserDao();
        try {
             dao.active(code);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User login(String username, String password) {
        UserDao dao = new UserDao();
        User user = null;
        try {
            user = dao.login(username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}

package com.taobao.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

public class BaseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings({ "rawtypes", "unchecked" })
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            //1.获得请求的method名称
            String methodName = req.getParameter("method");
            //2.获得当前被访问对象的字节码对象
            Class clazz = this.getClass();//ProductServlet.class--------UserServlet.class
            //3.获得当前字节码对象中的指定方法
            Method method = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
            //4.反射方式执行对应功能方法
            method.invoke(this,req,resp);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
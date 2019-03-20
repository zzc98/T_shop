package com.taobao.web.servlet;

import com.taobao.Constant.Constant;
import com.taobao.domain.User;
import com.taobao.service.UserService;
import com.taobao.utils.CommonUtils;
import com.taobao.utils.MailUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class UserServlet extends BaseServlet {
    public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> properties = request.getParameterMap();
        User user = new User();
        try {
            //自己指定一个类型转换器（将String转成Date）
            ConvertUtils.register(new Converter(){
                @SuppressWarnings("rawtypes")
                @Override
                public Object convert(Class clazz, Object value) {
                    //将String转成Date
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    Date parse = null;
                    try {
                        parse = format.parse(value.toString());
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return parse;
                }
            }, Date.class);
            //映射封装
            BeanUtils.populate(user, properties);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }

        //private String uid;
        user.setUid(CommonUtils.getUUID());
        //private String telephone;
        user.setTelephone(null);
        //private int state;//是否激活
        user.setState(Constant.UNACTIVE);
        //private String code;//激活码
        String activeCode = CommonUtils.getUUID();
        user.setCode(activeCode);

        //将user传递给service
        UserService service = new UserService();
        boolean isRegisterSuccess = service.regist(user);

        //是否注册成功
        if(isRegisterSuccess){
            //发送激活邮件
            String emailMsg = "恭喜您注册成功，请点击下面的链接激活账户"
                    + "<a href='http://localhost:8080/active?activeCode="+activeCode+"'>"
                    + "http://localhost:8080/active?activeCode="+activeCode+"</a>";
            try {
                MailUtils.sendMail(user.getEmail(), emailMsg);
            } catch (MessagingException e) {
                e.printStackTrace();
            }

            //跳转到注册成功页面
            response.sendRedirect(request.getContextPath()+"/RegisterSuccess.jsp");
        }else{
            //跳转到注册失败页面
            response.sendRedirect(request.getContextPath()+"/RegisterFail.jsp");
        }

    }

    public void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        //获得输入的用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //对密码进行加密
        //password = MD5Utils.md5(password);

        //将用户名和密码传递给service层
        UserService service = new UserService();
        User user = null;
        user = service.login(username,password);

        //判断用户是否登录成功 user是否是null
        if(user!=null){
            //登录成功
            //***************记住密码****************
            String savepwd = request.getParameter("savepwd");
            if("true".equals(request.getParameter("savepw"))){
                Cookie c =new Cookie("savePw",user.getPassword());
                c.setMaxAge(10*30);
                response.addCookie(c);
            }
            //***************************************************
            //***************记住用户名*****************
            if(Constant.SAVE_NAME.equals(request.getParameter("savename"))){
                Cookie c =new Cookie("saveName",user.getUsername());
                c.setMaxAge(10*30);
                response.addCookie(c);
            }

            //***************************************************
            //将user对象存到session中
            session.setAttribute("user", user);

            //重定向到首页
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else{
            request.getRequestDispatcher("/LoginFail.jsp").forward(request, response);

        }
    }
    //用户注销
    public void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //从session删除user
        session.removeAttribute("user");

        //将存储在cookie中的user信息删除(覆盖)
        Cookie cookie_username = new Cookie("cookie_username","");
        cookie_username.setMaxAge(0);
        //创建存储密码的cookie
        Cookie cookie_password = new Cookie("cookie_password","");
        cookie_password.setMaxAge(0);


        response.addCookie(cookie_username);
        response.addCookie(cookie_password);

        response.sendRedirect(request.getContextPath()+"/Login.jsp");
    }
}

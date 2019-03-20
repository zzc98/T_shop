<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册成功</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <style type="text/css ">
        #da{
            position:absolute;
            top:100px;
            left:500px;
            width:600px;
            height:200px;
        }
        #zuo{
            position:absolute;
            top:0px;
            left:0px;
            width:200px;
            height:200px;
        }
        #you{
            position:absolute;
            top:0px;
            left:200px;
        }
        a{
            text-decoration: none;
            font-size:15px;
            color:#1c94c4;
        }
         a:hover {
            color: #2314c4;
        }
    </style>
</head>

<body>
<div id="da">
    <div id="zuo">
        <img src="img/success.jpg" alt="成功" style="height:200px;width:200px;">
    </div>
    <div id="you">
        <h3>注册成功，</h3>
        <h3>请尽快前往注册邮箱激活您的账户</h3>
        <div>
            <span><a href="http://mail.163.com">网易163邮箱&nbsp;</a></span>
            <span><a href="http://mail.126.com">网易126邮箱&nbsp;</a></span>
            <span><a href="https://mail.qq.com/cgi-bin/loginpage">腾讯QQ邮箱&nbsp;</a></span>
            <br>
            <span>(注：邮件可能被识别至垃圾箱，请检验)</span>
        </div>
    </div>
</div>

</body>
</html>

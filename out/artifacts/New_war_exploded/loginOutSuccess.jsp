<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>退出</title>
    <meta http-equiv="refresh" content='5; url=Login.jsp'>
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
        <h3>退出成功，</h3>
        <h3>期待您的下次光临</h3>
        <span style="color: grey; font-size: 14px">5秒后将自动跳转到登录页面。</span>
    </div>
</div>

</body>
</html>

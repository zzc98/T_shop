<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册失败</title>
    <meta http-equiv="refresh" content='5; url=Register.jsp'>
    <script type="text/javascript">
        var time =5;
        function  aaa()
        {
            window.setTimeout('aaa()', 1000);
            time--;
            if(time>=0)
                document.getElementById("bb").innerHTML=time;
        }
    </script>
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
            left:220px;
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

<body onload="aaa()">
<div id="da">
    <div id="zuo">
        <img src="img/fail.png" alt="失败" style="height:200px;width:200px;">
    </div>
    <div id="you">
        <h3>注册失败，</h3>
        <span id="bb" style="color:red;">time</span>秒后将自动跳转到注册页面。
    </div>
</div>
</body>
</html>
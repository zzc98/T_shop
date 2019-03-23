<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        html {
            overflow-x: hidden;
            overflow-y: auto;
        }

        #kuang {
            position: relative;
            top: 50px;
            left: 850px;
            background-color: white;
            width: 450px;
            height: 500px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.5)
        }

        #re {
            position: absolute;
            top: 20px;
            left: 100px;
            font-size: xx-large;
            font-family: 微软雅黑;
        }

        #re1 {
            position: absolute;
            top: 40px;
            left: 235px;
            font-family: 微软雅黑;
        }

        #username {
            position: absolute;
            top: 85px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #psw {
            position: absolute;
            top: 140px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #psw1 {
            position: absolute;
            top: 190px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #add {
            position: absolute;
            top: 240px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #name {
            position: absolute;
            top: 290px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #chioce {
            position: absolute;
            top: 335px;
            left: 100px;
            font-size: small;
        }

        #date {
            position: absolute;
            top: 362px;
            left: 100px;
            width: 270px;
            height: 30px;
        }

        #check {
            position: absolute;
            top: 409px;
            left: 100px;
            width: 135px;
            height: 30px;
        }

        #submit {
            position: absolute;
            top: 450px;
            left: 95px;
            width: 270px;
            height: 30px;
            border-radius: 10px;
            background-color: #0a6cd6;
        }

        #yan {
            position: absolute;
            top: 409px;
            left: 250px;
        }

        #sameornot {
            position: absolute;
            top: 170px;
            left: 100px;
            width: 270px;
            height: 30px;
            color: red;
            display: none;
        }

        #namealreadyexist {
            position: absolute;
            top: 120px;
            left: 100px;
            width: 270px;
            height: 30px;
            color: red;
            display: none;
        }
    </style>
    <script type="text/javascript">
        function a(obj) {
            obj.style.border = "2px solid blue";
        }

        function b(obj) {
            obj.style.border = "1px solid black";
        }

        function samepasssword(obj) {
            obj.style.border = "1px solid black";
            var p1 = $("#psw").val();
            var p2 = $("#psw1").val();
            if (p1 == p2) {
                $("#sameornot").hide();
            }
            else {
                $("#sameornot").show();
            }
        }

        function existname(obj) {
            obj.style.border = "1px solid black";
            var use_name = $("#username").val();
            $.post(
                "${pageContext.request.contextPath}/checkUsername",
                {"username": use_name},
                function (data) {
                    var isExist = data.isExist;
                    if (isExist) {
                        $("#namealreadyexist").hide();
                    }
                    else {
                        $("#namealreadyexist").show();
                    }
                },
                "json"
            )
        }
    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div style="position: relative;top:-10px; background-color: #D5FDFF;width:100%;height: 600px;background-size:cover;background:url('img/b2.jpg') no-repeat center center;">
    <div id="kuang">
        <span id="re">会员注册</span>
        <span id="re1">USER REGISTER</span>
        <form method="post" action="${pageContext.request.contextPath}/user">
            <input type="hidden" name="method" value="regist">
            <%--<span class="glyphicon glyphicon-user" style="position: relative;top:95px;left:80px;"></span>--%>
            <input id="username" type="text" name="username" placeholder="请输入用户名" required onfocus="a(this)"
                   onblur="existname(this)">
            <br>
            <div id="namealreadyexist">该用户名已存在！</div>
            <%--<span class="glyphicon glyphicon-lock" style="position: relative;top:135px;left:80px;"></span>--%>
            <input id="psw" type="password" name="password" placeholder="请输入密码" required onfocus="a(this)"
                   onblur="b(this)">
            <br>
            <span class="glyphicon glyphicon-lock" style="position: relative;top:170px;left:80px;"></span>
            <input id="psw1" type="password" name="passwordagain" placeholder="请再次输入密码" required onfocus="a(this)"
                   onblur="samepasssword(this)">
            <div id="sameornot">两次密码输入不一致！</div>
            <span class="glyphicon glyphicon-envelope" style="position: relative;top:215px;left:60px;"></span>
            <input id="add" type="email" name="email" placeholder="请输入邮箱地址" required onfocus="a(this)" onblur="b(this)">
            <br>
            <%--<span class="glyphicon glyphicon-user" style="position: relative;top:250px;left:80px;"></span>--%>
            <input id="name" type="text" name="name" placeholder="请输入姓名" style="width: 270px;height:30px" required
                   onfocus="a(this)" onblur="b(this)">
            <br>
            <span id="chioce">性别：
                    <input type="radio" name="sex" value="female" checked>女&emsp;
                    <input type="radio" name="sex" value="male">男
                    <br>
                </span>
            <%--<span class="glyphicon glyphicon-calendar" style="position: relative;top:310px;left:50px;"></span>--%>
            <div>
                <input id=date type="date" name="date" placeholder="请输入生日 格式为年-月-日" required onfocus="a(this)"
                       onblur="b(this)">
                <br>
            </div>
            <%--<span class="glyphicon glyphicon-pencil" style="position: relative;top:320px;left:80px;"></span>--%>
            <%--<div>--%>
            <%--&lt;%&ndash;<input id="check" type="text" name="check" placeholder="请输入验证码" required onfocus="a(this)" onblur="b(this)">&ndash;%&gt;--%>
            <%--<img src="动态生成验证码.jsp" id="yan">--%>
            <%--</div>--%>
            <div>
                <input id="submit" type="submit" value="提交">
            </div>
        </form>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>

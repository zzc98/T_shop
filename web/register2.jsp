<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<div class="header">
    <div class="container">
        <div class="row">
            <div class="logo span4">
                <h1>用户注册</h1>
            </div>
            <div class="links span8">
                <a class="home" href="index.jsp" rel="tooltip" data-placement="bottom" data-original-title="首页"></a>
                <a class="blog" href="Login.jsp" rel="tooltip" data-placement="bottom" data-original-title="登录"></a>
            </div>
        </div>
    </div>
</div>
<%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>--%>

<div class="register-container container">
    <div class="row">
        <%--<div class="iphone span5">--%>
            <%--<img src="assets/img/iphone.png" alt="">--%>
        <%--</div>--%>
        <div class="register span6" style="margin: 0 auto;">
            <form method="post" action="${pageContext.request.contextPath}/user">
                <input type="hidden" name="method" value="regist">
                <h2>注册 <span class="red"><strong>二手交易平台</strong></span></h2>
                <label for="username">用户名</label>
                <input type="text" id="username" name="username" placeholder="请输入用户名...">
                <label for="password">密码</label>
                <input type="password" id="password" name="password" placeholder="请输入密码...">
                <label for="name">姓名</label>
                <input type="text" id="name" name="name" placeholder="请输入姓名...">
                <label for="email">电子邮箱</label>
                <input type="email" id="email" name="email" placeholder="请输入电子邮箱...">

                <%--<input type="password" name="passwordagain" style="display: none;" value="123456">--%>
                <%--<input type="radio" name="male" value="male" checked style="display: none;">--%>
                <button type="submit">注册</button>
            </form>
        </div>
    </div>
</div>

<!-- Javascript -->
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.backstretch.min.js"></script>
<script src="assets/js/scripts.js"></script>

</body>

</html>


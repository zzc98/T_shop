<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>登录</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" type="text/css" href="css/bgstretcher.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/bgstretcher.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
</head>

<body>
<div id="login_div1">
    <img src="img/login.jpg" style="width: 200px;height:100px;">
    <div id="login_div2">二 手 交 易 平 台</div>
</div>

<div id="kuang">
    <div id="k">
        <lable id="l1">会员登录</lable>
        <lable id="l2">USER LOGIN</lable>
        <form action="${pageContext.request.contextPath}/user" method="post" name="form" id="form">
            <input type="hidden" name="method" value="login">
            <div class="form_name">
                <span class="user-icon" id="con_name">u</span>
                <input type="text" name="username" id="name" placeholder="用户名" value="${cookie.saveName.value}"
                       onblur="nameout()" required/>
            </div>
            <div class="form_b">
                <input type="checkbox" name="savename" id="rem" value="true"/><span id="r1">记住用户名</span>
            </div>
            <div class="form_b">
                <input type="checkbox" name="savepwd" id="rem2" value="ok"/><span id="r2">记住密码</span>
            </div>
            <div class="form_password">
                <span class="user-icon" id="con_pwd">p</span>
                <input type="password" name="password" id="pw" placeholder="密码" value="${cookie.savepw.value}"
                       onblur="pwout()" required/>
            </div>
            <div class="form_submit">

            </div>
            <div class="form_re">
                <span class="user-icon" id="con_yz">c</span>
                <input type="text" name="yanzhengma" id="re" placeholder="请输入验证码" onblur="reout()"/>
                <input type="button" id="yan" onclick="createCode()"/>
            </div>
        </form>
        <button name="submit" id="sm" onclick="validate()">登录</button>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //  Initialize Backgound Stretcher
        $('BODY').bgStretcher({
            images: ['images/login_bg1.jpg', 'images/login_bg2.jpg', 'images/login_bg3.jpg', 'images/login_bg4.jpg', 'images/login_bg5.jpg', 'images/login_bg6.jpg'],
            imageWidth: 1024,
            imageHeight: 768,
            slideDirection: 'N',
            slideShowSpeed: 1000,
            transitionEffect: 'fade',
            sequenceMode: 'normal',
            buttonPrev: '#prev',
            buttonNext: '#next',
            pagination: '#nav',
            anchoring: 'left center',
            anchoringImg: 'left center'
        });
        createCode()
    });
</script>
</body>
</html>
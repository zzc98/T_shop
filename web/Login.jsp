
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>登录</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <link rel="stylesheet" type="text/css" href="css/bgstretcher.css" />
    <script type="text/javascript" src="jquery-1.5.2.min.js"></script>
    <script type="text/javascript" src="js/bgstretcher.js"></script>
    <style type="text/css">
        #kuang{
            position: relative;
            top: 30px;
            left:65%;
            width:350px;
            height:350px;
            border-radius:5px;
            filter:alpha(opacity=50);
            -moz-opacity:0.5;
            -khtml-opacity: 0.5;
            background: rgba(255, 255, 255, 0.7)
        }
        #k{
            position:relative;
            top:3%;
            left:3%;
            width:100%;
            height:100%;
        }
        #l1{
            font-size: 30px;
        }
        #l2{
            font-size: 18px;
            color: #000000;
        }
        #name{
            position:absolute;
            top:25%;
            left: 20%;
            width:60%;
            height:8%;
            background: none;
            border-radius:10px;
            border:1px solid #000;
            opacity: 1;
        }
        #con_name{
            position:absolute;
            top:25%;
            left:10%;
            width:30px;
            height:30px;
            border-radius:10px;
            opacity: 0.3;
        }
        #pw{
            position:absolute;
            top:40%;
            left: 20%;
            width:60%;
            height:8%;
            background: none;
            border-radius:10px;
            border:1px solid #000;
            opacity: 1;
        }
        #con_pwd{
            position:absolute;
            top:40%;
            left:10%;
            width:30px;
            height:30px;
            border-radius:10px;
            opacity: 0.3;
        }
        #re{
            position:absolute;
            top:60%;
            left: 20%;
            width:27%;
            height:8%;
            background: none;
            border-radius:10px;
            border:1px solid #000;
            opacity: 1;
        }
        #yan{
            position:absolute;
            top:60%;
            left:50%;
            width:100px;
            height:30px;
            opacity: 1;
            font-family: Arial;
            font-size: large;
            font-style: italic;
            font-weight: bold;
            border: 0;
            letter-spacing: 2px;
            color: blue;
        }
        #con_yz{
            position:absolute;
            top:60%;
            left:10%;
            width:30px;
            height:30px;
            border-radius:10px;
            opacity: 0.3;
        }
        #rem{
            position:absolute;
            top:70%;
            left:20%;
            width:10%;
            height:2%;
            opacity: 1;
        }
        #rem2{
            position:absolute;
            top:70%;
            left:50%;
            width:10%;
            height:2%;
            opacity: 1;
        }
        #r1{
            position:absolute;
            top:70%;
            left:30%;
        }
        #r2{
            position:absolute;
            top:70%;
            left:60%;
        }
        #sm{
            position:absolute;
            top:80%;
            left: 20%;
            width:60%;
            height:8%;
            background-color: #0086e6;
            border-radius:30px;
            opacity: 1;
        }
        .user-icon{
            display:inline-block;
            font-family:loginform-icon;
            font-size:15px;
            text-align:center;
            line-height:28px;
            color:rgb(153,153,153);
            position:absolute;
            left:1px;
            top:1px;
            background-color:rgb(255,255,255);
            border:none;
            border-right:1px solid rgb(229,229,232);
            width:30px;
            height:28px;
            transition: all 300ms linear;
        }
        @font-face {
            font-family: 'loginform-icon';
            src: url("font/loginform-icon.eot");
            src: url("font/loginform-icon.eot?#iefix") format('embedded-opentype'),
            url("font/loginform-icon.woff") format('woff'),
            url("font/loginform-icon.ttf") format('truetype'),
            url("font/loginform-icon.svg#loginform-icon") format('svg');
            font-weight: normal;
            font-style: normal;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            //  Initialize Backgound Stretcher
            $('BODY').bgStretcher({
                images: ['images/QQ20180907000141.jpg', 'images/QQ20180907000213.jpg', 'images/QQ20180907000208.jpg', 'images/QQ20180907000243.jpg', 'images/QQ20180907000204.jpg', '../images/QQ20180907000146.jpg'],
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
        var code; //在全局定义验证码
        function createCode() {
            code = "";
            var codeLength = 4; //验证码的长度
            var checkCode = document.getElementById("yan");
            var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I','J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数
            for(var i = 0; i < codeLength; i++) { //循环操作
                var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35）
                code += random[index]; //根据索引取得随机数加到code上
            }
            checkCode.value = code; //把code值赋给验证码
        }
        //校验验证码
        function validate() {
            var inputCode = document.getElementById("re").value.toUpperCase();
            var name = document.getElementById("name").value;
            var pw = document.getElementById("pw").value;
            if(name.length==0){
                document.getElementById("name").style.border="2px solid red";
                return;
            }
            if(pw.length==0){
                document.getElementById("pw").style.border="2px solid red";
                return ;
            }
            if(inputCode.length <= 0) { //若输入的验证码长度为0
                document.getElementById("re").style.border="2px solid red";
                return ;
            }
           if(inputCode != code) { //若输入的验证码与产生的验证码不一致时
                alert("验证码输入错误!"); //则弹出验证码输入错误
                createCode(); //刷新验证码
                document.getElementById("re").value = "";//清空文本框
            }
           else
                // //输入正确时
                // alert("正在登陆"); //弹出
            document.form.submit();
        }
        function nameout() {
            var name = document.getElementById("name").value;
            if(name.length==0){
                document.getElementById("name").style.border="2px solid red";
            }
            else
                document.getElementById("name").style.border="1px solid black";
        }
        function pwout() {
            var name = document.getElementById("pw").value;
            if(name.length==0){
                document.getElementById("pw").style.border="2px solid red";
            }
            else
                document.getElementById("pw").style.border="1px solid black";
        }
        function reout() {
            var name = document.getElementById("re").value;
            if(name.length==0){
                document.getElementById("re").style.border="2px solid red";
            }
            else
                document.getElementById("re").style.border="1px solid black";
        }

    </script>
    <script type="text/javascript" src="js/main.js"></script>
<body>

<div style="width:300px;height:100px;;z-index: 1000;position: relative; top:50px;left:100px;">
    <img src="img/logo.png" style="width: 200px;height:100px;">
    <div style="color:white;font-size: 30px;position: relative;bottom :80px;left:250px;border-left:1px solid  white">你 的 专 属 商 城</div>
</div>

<div id="kuang" style="z-index: 1000">
    <div id="k">
        <lable id="l1">会员登录</lable>
        <lable id="l2">USER LOGIN</lable>
        <form action="${pageContext.request.contextPath}/user" method="post" name="form" id="form">
            <input type="hidden" name="method" value="login">
            <div class="form_name">
                <span class="user-icon" id="con_name">u</span>
                <input type="text" name="username" id="name" placeholder="用户名"  value="${cookie.saveName.value}" onblur="nameout()" required/>
            </div>
            <div class="form_b">
                <input type="checkbox" name="savename"  id="rem"  value="true"  /><span id="r1">记住用户名</span>
            </div>
            <div class="form_b">
                <input type="checkbox" name="savepwd"  id="rem2"  value="ok" /><span id="r2">记住密码</span>
            </div>
            <div class="form_password">
                <span class="user-icon" id="con_pwd">p</span>
                <input type="password" name="password" id="pw" placeholder="密码" value="${cookie.savepw.value}" onblur="pwout()" required/>
            </div>
            <div class="form_submit">

            </div>
            <div class="form_re">
                <span class="user-icon" id="con_yz">c</span>
                <input type="text" name="yanzhengma"  id="re" placeholder="请输入验证码" onblur="reout()" />
                <%--<img src="动态生成验证码.jsp" id="yan">--%>
                <input type="button" id="yan" onclick="createCode()" />
                <!--时间：2017-01-11 描述：验证按钮 -->
                <%--<input type="button" value="验证" onclick="validate()" />--%>
            </div>
        </form>
        <button name="submit" id="sm" onclick="validate()">按钮</button>
        <%--<input type="submit" name="submit"  id="sm" value="登 录" onclick="validate()"/>--%>
    </div>
</div>
</body>
</html>
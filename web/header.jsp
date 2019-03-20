<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link rel="stylesheet" type="text/css" href="../css/header.css">--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<style type="text/css">
    ul li{
        padding: 10px 20px;
        display: inline-block;
        white-space:nowrap;
    }
    #search{
        width:200px;
        height:30px;
        border-radius:3px;
        border:1px solid #99a6ff;
        font-family: 微软雅黑;
        font-size: 14px;
    }
    #b1{
        width:60px;
        height:30px;
        border-radius:3px;
        background-color: #0086e6;
        color: white;
        font-family: 微软雅黑;
        font-size: 14px;
    }
    a{
        text-decoration:none;
    }
    #bar{
        background-color: #0086e6;
        position: relative;
        top:0%;
        left:0%;
        width:100%;
        height:40px;
    }
    .shou{
        background-color: #0086e6;
        width:10%;
        height:100%;
        font-family: 微软雅黑;
        color: white;
        font-size: 16px;
        text-align:center;
        line-height:40px;
        border-right: 5px solid green;
        float:left;
    }
</style>
<%--整个头部--%>
<div style="width:100%;height:130px;position:relative;left:0%;">
    <%--logo部分--%>
    <div>
        <img id="logo" src="img/logo.png.png">
    </div>
        <%--用户信息条--%>
    <div>
        <ul style="display:inline; white-space: nowrap; position:absolute; top:0; right:30%;">
            <c:if test="${empty user}">
                <li>
                    <a href="Login.jsp" style="color:#000000;">登录</a>
                </li>
                <li>
                    <a href="Register.jsp" style="color:#000000;">注册</a>
                </li>
                <li>
                    <a style="color:#000000;" onclick="alert('请先登录')">我的订单</a>
                </li>
                <li>
                    <a style="color:#000000;" onclick="alert('请先登录')">购物车</a>
                </li>
                <li>
                    <a style="color:#000000;" onclick="alert('请先登录')">添加商品</a>
                </li>
            </c:if>
            <c:if test="${not empty user}">
                <li style="color:red">
                    欢迎您，${user.username }
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/user?method=logout">退出</a>
                </li>
                <li>
                    <a  href="${pageContext.request.contextPath}/order?method=page&curPage=1" style="color:#000000;">我的订单</a>
                </li>
                <li>
                    <a   href="cart.jsp" style="color:#000000;">购物车</a>
                </li>
                <li>
                    <a  href="manage.jsp" style="color:#000000;" >我的出售</a>
                </li>
            </c:if>
        </ul>
        <%--搜索框和按钮--%>
        <div id="r" style="position: absolute;top:20px;left:1200px;width:300px">
            <input type="text" placeholder="输入关键词" id="search" onkeyup="searchWord(this)">
            <div id="showdiv" style="display: none;position: absolute;z-index: 1000; background: #fff;width:200px;border:1px solid #ccc;">
            </div>
            <button id="b1">search</button>
        </div>
    </div>
        <%--导航部分--%>
    <div id="bar">
        <%--<div class="shou">--%>
            <%--<a href="shouye.jsp" style="color: white">首 页</a>--%>
        <%--</div>--%>
        <%--<div class="shou" data-spy="scroll" data-target="#suoyoushangpin">--%>
            <%--<a href="shouye.jsp#ashouyoushangpin" style="color: white">所有商品</a>--%>
        <%--</div>--%>
        <%--<div class="shou" data-spy="scroll" data-target="#jiadianshuma">--%>
            <%--<a href="shouye.jsp#ajiadianshuma" style="color: white">家电数码</a>--%>
        <%--</div>--%>
        <%--<div class="shou" data-spy="scroll" data-target="#nanzhuangnvzhuang">--%>
            <%--<a href="shouye.jsp#ananzhuangnvzhuang" style="color: white">男装女装</a>--%>
        <%--</div>--%>
        <%--<div class="shou" data-spy="scroll" data-target="#tiyuyundong">--%>
            <%--<a href="shouye.jsp#atiyuyundong" style="color: white">体育运动</a>--%>
        <%--</div>--%>
        <%--<div class="shou" data-spy="scroll" data-target="#jiaocaiziliao">--%>
            <%--<a href="shouye.jsp#ajiaocaiziliao" style="color: white">教材资料</a>--%>
        <%--</div>--%>
        <%--<div class="shou">--%>
            <%--<a href="info.jsp" target="_blank" style="color: white">关于我们</a>--%>
        <%--</div>--%>
    </div>
        <div style="width:100px;height:40px;color:white;position: relative;bottom:30px;left:1420px"><a href="index.jsp" style="color: white">回到首页</a></div>
</div>

<script type="text/javascript">
    //header.jsp加载完毕后 去服务器端获得所有的category数据
    $(function(){
        var content = "";
        $.post(
            "${pageContext.request.contextPath}/product?method=categoryList",
                function(data){
                //[{"cid":"xxx","cname":"xxxx"},{},{}]
                //动态创建<li><a href="#">${category.cname }</a><>
                for(var i=0;i<data.length;i++){
                    content+="<div class=\"shou\"><a href='${pageContext.request.contextPath}/product?method=productList&cid="+data[i].cid+"' style='color:white'>"+data[i].cname+"</a></div>";
                }
                //将拼接好的li放置到ul中
                $("#bar").html(content);
                $("#bar").css("color","white");
            },
            "json"
        );
    });
</script>

<script type="text/javascript">



    function overFn( obj ) {
        $(obj).css("background","#DBEAF9");
    }
    function outFn( obj ) {
        $(obj).css("background","#fff");
    }
    function clickFn( obj ) {
        $("#search").val($(obj).html());
        $("#showdiv").css("display","none");
    }
    function searchWord( obj){
        var word=$(this).val;
        var content="";
        $.post(
            "${pageContext.request.contextPath}/searchWord",
            {"word":word},
            function(data){
                if(data.length>0){
                    for(var i=0;i<data.length;i++){
                        content+="<div style='padding:5px' onmouseover='overFn(this)' onmouseout='outFn(this)' onclick='clickFn(this)'>+data[i].pname+</div>";
                    }
                }
                $("#showdiv").html(content);
            },
            "json"
        )
    }
</script>
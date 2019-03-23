<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link href="css/header.css" rel="stylesheet" type="text/css" media="all"/>
<script src="js/header.js"></script>
<%--整个头部--%>
<div id="header_div_1">
    <%--logo部分--%>
    <div>
        <img id="logo" src="img/logo.jpg">
    </div>
    <%--用户信息条--%>
    <div>
        <ul id="header_ul_1">
            <c:if test="${empty user}">
                <li>
                    <a href="Login.jsp" class="header_a_1">登录</a>
                </li>
                <li>
                    <a href="register2.jsp" class="header_a_1">注册</a>
                </li>
                <li>
                    <a class="header_a_1" onclick="alert('请先登录')">我的订单</a>
                </li>
                <li>
                    <a class="header_a_1" onclick="alert('请先登录')">购物车</a>
                </li>
                <li>
                    <a class="header_a_1" onclick="alert('请先登录')">添加商品</a>
                </li>
            </c:if>
            <c:if test="${not empty user}">
                <li id="header_li_1">
                    欢迎您，${user.username }
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/user?method=logout">退出</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/order?method=page&curPage=1"
                       class="header_a_1">我的订单</a>
                </li>
                <li>
                    <a href="cart.jsp" class="header_a_1">购物车</a>
                </li>
                <li>
                    <a href="manage.jsp" class="header_a_1">我的出售</a>
                </li>
            </c:if>
        </ul>
        <%--搜索框和按钮--%>
        <div id="r">
            <input type="text" placeholder="输入关键词" id="search" onkeyup="searchWord()">
            <div id="showdiv">
            </div>
            <button id="b1">搜索</button>
        </div>
    </div>
    <%--导航部分--%>
    <div id="bar">
    </div>
    <div id="header_div_2">
        <a href="index.jsp" id="header_a_1">回到首页</a>
    </div>
</div>

<script type="text/javascript">
    //header.jsp加载完毕后 去服务器端获得所有的category数据
    $(function () {
        var content = "";
        $.post(
            "${pageContext.request.contextPath}/product?method=categoryList",
            function (data) {
                //[{"cid":"xxx","cname":"xxxx"},{},{}]
                //动态创建<li><a href="#">${category.cname }</a><>
                for (var i = 0; i < data.length; i++) {
                    content += "<div class=\"shou\"><a href='${pageContext.request.contextPath}/product?method=productList&cid=" + data[i].cid + "' style='color:white;text-decoration: none'>" + data[i].cname + "</a></div>";
                }
                //将拼接好的li放置到ul中
                var bar = $("#bar");
                bar.html(content);
                bar.css("color", "white");
            },
            "json"
        );
    });
</script>
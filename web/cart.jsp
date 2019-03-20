<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page errorPage="error.jsp" %>--%>
<html>
<head>
    <title>购物车</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            var names = document.getElementsByName("checkbox");
            document.getElementById("quan").innerText=names.length;
        }
        function delProFromCart(pid){
            if(confirm("您是否确定删除该项？")){
                location.href="${pageContext.request.contextPath }/product?method=delProFromCart&pid="+pid;
            }
        }
        function clearCart(){
            if(confirm("您是否确定清空购物车？")){
                location.href="${pageContext.request.contextPath }/product?method=clearCart";
            }
        }
        function buy() {
            // alert("买了");
        }
        function quanxuan(obj){
            var names = document.getElementsByName("checkbox");
            if(obj.checked){
                for(var i=0; i<names.length; i++) {
                    names[i].checked=true;
                }
                document.getElementById("quan").innerText=names.length;
                document.getElementById("xuan").innerText=names.length;
            }
            else{
                for(var i=0; i<names.length; i++) {
                    names[i].checked=false;
                }
                document.getElementById("quan").innerText=names.length;
                document.getElementById("xuan").innerText=0;
            }
        }
        function xuan() {
            var names = document.getElementsByName("checkbox");
            var count=0;
            for(var i=0; i<names.length; i++) {
                if(names[i].checked){
                    count=count+1;
                }
                else{
                    document.getElementById("quanxuan").checked=false;
                }
            }
            document.getElementById("quan").innerText=names.length;
            document.getElementById("xuan").innerText=count;
        }
    </script>
    <%--<link rel="stylesheet" href="../css/product_info.css" type="text/css" />--%>
</head>
<body>
    <%@ include file="header.jsp"%>
    <%--购物车里啥都没有--%>
    <c:if test="${empty cart.cartItems}">
        <div id="kong" style="position: absolute;top:150px;width: 100%;height:500px;background-color: #F2F2F2;">
            <div style="position: absolute;top:50px;left:400px;width:800px;height:250px">
                <div style="width:50%;float:left;">
                    <img alt="图片暂时无法显示" src="img/cart/u137.png">
                </div>
                <div style="width:50%;position: absolute;top:0;left:400px;">
                    <p style="color: #B4B4B4;font-family: Arial;font-size: 36px;position: relative;top:-30px;">您的购物车还是空的！</p>
                    <p style="color: #B4B4B4;font-family: Arial;font-size: 24px;position: relative;top:-50px;">赶紧行动吧，您可以：</p>
                    <a href="index.jsp">
                        <button id="fanhuishouye">返回首页</button>
                    </a>
                    <a href="index.jsp">
                        <button id="mashangqugouwu" >马上去购物</button>
                    </a>
                </div>
            </div>
        </div>
    <%@ include file="footer.jsp"%>
        <style type="text/css">
            #fanhuishouye{
                width:170px;
                height:50px;
                background-color: #3498DB;
                font-family: 微软雅黑;
                color: #FFFFFF;
                font-size: 14px;
                border: none;
                position: relative;
                top:-50px;
            }
            #mashangqugouwu{
                width:170px;
                height:50px;
                background-color:white;
                font-family: 微软雅黑;
                color: #FFFFFF;
                font-size: 14px;
                border:1px solid #3498DB;
                color:#3498DB;
                position: relative;
                top:-50px;
                left:30px;
            }
            #footer{
                position:relative;
                top:500px;
                left:2%;
                height:80px;
                width:96%;
            }
        </style>
    </c:if>
    <%--购物车里有商品--%>
    <c:if test="${!empty cart.cartItems }">
    <div style="background-color: #F2F2F2;">
        <div style="position: relative;left:250px;width: 1000px;">
            <table border="1" style="font-size: 14px;color: #333333" rules=rows>
                <tr style="background-color: white;text-align: center;height:80px">
                    <td width="80px">
                        <input type="checkbox" id="quanxuan" onclick="quanxuan(this)">全选
                    </td>
                    <td width="600px">商品名称</td>
                    <td width="150px">单价</td>
                    <td width="150px">数量</td>
                    <td width="200px">小计</td>
                    <td width="200px">操作</td>
                </tr>
                <c:forEach items="${cart.cartItems }" var="entry">
                    <%--<input type="hidden" name="id" value="22">--%>
                    <tr style="background-color: white;height:80px;font-size: 16px;color:#333333">
                        <td width="80px">
                            <input type="checkbox" name="checkbox" onclick="xuan()">
                        </td>
                        <td width="600px" height="160px">
                            <div style="float: left">
                                <img src="${pageContext.request.contextPath }/${entry.value.product.pimage}" style="width: 120px;height:120px;position: relative;top:20px;left:20px" >
                            </div>
                            <div style="width:300px;height:140px;float: left;position: relative;left:30px;text-align: center;margin-top: 10px">
                                    ${entry.value.product.pname}
                            </div>
                        </td>
                        <td width="150px" style="text-align: center">
                            ￥${entry.value.product.shop_price}
                        </td>
                        <td width="150px" style="text-align: center">
                            ${entry.value.buyNum}
                        </td>
                        <td width="200px" style="text-align: center;color: #FF0000">
                            小计 ￥${entry.value.subtotal}
                        </td>
                        <td width="200px" style="text-align: center">
                            <p onclick="buy()">立即购买</p>
                            <p onclick="delProFromCart('${entry.value.product.pid}')">删除</p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div style="width:1000px;height:70px;background-color:white">
                <span style="position: relative;top:8px;left: 10px">
                    一共<span style="color: #1c94c4" id="quan">?
                </span>个商品，共选中<span style="color: #1c94c4" id="xuan">0</span>个商品
                </span>
                <span style="position: relative;top:30px;left:300px;background-color: #cc7363;border-radius: 10px;color:white;" onclick="clearCart()">清空购物车</span>
                <span style="position: relative;top:30px;left:320px;">总计：${cart.total}元</span>
                <a href="${pageContext.request.contextPath }/product?method=submitOrder">
                <button style="background-color: #0a6cd6;float: right;height: 50px;width:200px;
                border-radius:5px;text-align: center;background-color:#3498DB;font-family: 微软雅黑;color: white" >提交订单</button>
                </a>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
    </c:if>
</body>
</html>

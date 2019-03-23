<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>购物车</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/cart.js"></script>
    <link href="css/cart.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body>

<%@ include file="header.jsp" %>

<%--购物车里啥都没有--%>
<c:if test="${empty cart.cartItems}">
    <div id="kong">
        <div id="div_1">
            <div id="div_2">
                <img alt="图片暂时无法显示" src="img/cart/u137.png">
            </div>
            <div id="div_3">
                <p id="p_1">
                    您的购物车还是空的！</p>
                <p id="p_2">
                    赶紧行动吧，您可以：</p>
                <a href="index.jsp">
                    <button id="fanhuishouye">返回首页</button>
                </a>
                <a href="index.jsp">
                    <button id="mashangqugouwu">马上去购物</button>
                </a>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
    <style type="text/css">
        #fanhuishouye {
            width: 170px;
            height: 50px;
            background-color: #3498DB;
            font-family: 微软雅黑;
            color: #FFFFFF;
            font-size: 14px;
            border: none;
            position: relative;
            top: -50px;
        }

        #mashangqugouwu {
            width: 170px;
            height: 50px;
            background-color: white;
            font-family: 微软雅黑;
            color: #FFFFFF;
            font-size: 14px;
            border: 1px solid #3498DB;
            color: #3498DB;
            position: relative;
            top: -50px;
            left: 30px;
        }

        #footer {
            position: relative;
            top: 500px;
            left: 2%;
            height: 80px;
            width: 96%;
        }
    </style>
</c:if>

<%--购物车里有商品--%>
<c:if test="${!empty cart.cartItems }">
    <div id="div_4">
        <div id="div_5">
            <table id="table_1" border="1" rules=rows>
                <tr id="tr_1">
                    <td width="80px">
                        <input type="checkbox" id="quanxuan" onclick="quanxuan(this)" placeholder="">全选
                    </td>
                    <td width="600px">商品名称</td>
                    <td width="150px">单价</td>
                    <td width="150px">数量</td>
                    <td width="200px">小计</td>
                    <td width="200px">操作</td>
                </tr>
                <c:forEach items="${cart.cartItems }" var="entry">
                    <%--<input type="hidden" name="id" value="22">--%>
                    <tr class="tr_1">
                        <td width="80px">
                            <input type="checkbox" name="checkbox" onclick="xuan()" placeholder="">
                        </td>
                        <td width="600px" height="160px">
                            <div id="div_8">
                                <img class="img_2"
                                     src="${pageContext.request.contextPath }/${entry.value.product.pimage}">
                            </div>
                            <div class="div_9">
                                    ${entry.value.product.pname}
                            </div>
                        </td>
                        <td width="150px" class="td_1">
                            ￥${entry.value.product.shop_price}
                        </td>
                        <td width="150px" class="td_1">
                                ${entry.value.buyNum}
                        </td>
                        <td width="200px" class="td_1">
                            小计 ￥${entry.value.subtotal}
                        </td>
                        <td width="200px" class="td_1">
                            <p onclick="buy()">立即购买</p>
                            <p onclick="delProFromCart('${entry.value.product.pid}')">删除</p>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div id="div_6">
                <span id="span_1">
                    一共<span id="quan">?
                </span>个商品，共选中<span id="xuan">0</span>个商品
                </span>
                <span id="span_2" onclick="clearCart()"> &nbsp清空购物车 </span>
                <span id="total_yuan">总计：${cart.total}元</span>
                <a href="${pageContext.request.contextPath }/product?method=submitOrder">
                    <button id="btn_1">提交订单</button>
                </a>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</c:if>
</body>


<script>
    $(function () {
        var x = 0;
        x =${cart.total};
        x = Math.round(x * 100) / 100;
        $("#total_yuan").html("总计：" + x + "元");
    });
</script>
</html>

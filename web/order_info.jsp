<%--<%@ page import="com.taobao.dao.OrderDao" %>--%>
<%--<%@ page import="com.taobao.domain.Order" %>--%>
<%--<%@ page import="com.taobao.dao.*" %>--%>
<%--<%@ page import="com.taobao.domain.Product" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>填写订单</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="css/order_info.css" type="text/css"/>
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"/>
<div style="background-color:#F2F2F2;">
    <br> <br>
    <form action="${pageContext.request.contextPath }/product" method="post" id="tijiaodingdanbiaodan"></form>
    <div style="background-color: white;width:1280px;margin: 0 auto;position: relative;">
        <%--收货信息--%>
        <div style="background-color: white;height:250px;margin: 0 auto;position: relative;padding-left: 10px;">
            <p style="font-family: 微软雅黑;font-size: 32px;color: #666666">填写订单信息</p>
            <p style="font-family: 微软雅黑;font-size: 14px;color: #666666">收获地址
                <input type="text" class="dingdan" name="address" onfocus="shuru(this)" onblur="shuruwan(this)"
                       form="tijiaodingdanbiaodan">
            </p>
            <p style="font-family: 微软雅黑;font-size: 14px;color: #666666">联系方式
                <input type="text" class="dingdan" name="telephone" onfocus="shuru(this)" onblur="shuruwan(this)"
                       form="tijiaodingdanbiaodan">
            </p>
            <p style="font-family: 微软雅黑;font-size: 14px;color: #666666">联系人&nbsp&nbsp&nbsp
                <input type="text" class="dingdan" name="name" onfocus="shuru(this)" onblur="shuruwan(this)"
                       form="tijiaodingdanbiaodan">
            </p>
            <hr style="width: 1200px;margin: 0 auto">
        </div>
        <%--订单详情--%>
        <br>

        订单编号:${order.oid}
        <br>
        <c:forEach items="${order.orderItems}" var="item">
            <div style="height: 150px;margin: 0 auto;background-color: white">
                <img src="${pageContext.request.contextPath}/${item.product.pimage}" width="120" height="120"
                     style="position: relative;top:30px;left:130px">
                <div class="shangpinxinxi">${item.product.pname } </div>
                <div class="jiageheshumu">${item.product.shop_price } * ${item.count }</div>
                <div class="yixiangqian">${item.subtotal }</div>
            </div>
            <br>
            <hr style="width: 1200px;margin: 0 auto">
        </c:forEach>
        <%--支付方式--%>
        <div style="margin: 0 auto;background-color: white;padding-left: 10px;">
            <p style="font-family: 微软雅黑;font-size: 32px;color: #666666">选择支付方式</p>
            <%--选择银行--%>
            <div style="position: relative;left:100px;">
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" form="tijiaodingdanbiaodan"/>支付宝
                <img src="img/bank_img/zhifubao.jpg" style="width:153px;height:43px" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" disabled form="tijiaodingdanbiaodan"/>工商银行
                <img src="img/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="BOC-NET-B2C" disabled form="tijiaodingdanbiaodan"/>中国银行
                <img src="img/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <br><br>
                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C" disabled form="tijiaodingdanbiaodan"/>农业银行
                <img src="img/bank_img/abc.bmp" align="middle"/>
                <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C" disabled form="tijiaodingdanbiaodan"/>交通银行
                <img src="img/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="PINGANBANK-NET" disabled form="tijiaodingdanbiaodan"/>平安银行
                <img src="img/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <br/> <br/>
                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" disabled form="tijiaodingdanbiaodan"/>建设银行
                <img src="img/bank_img/ccb.bmp" align="middle"/>
                <input type="radio" name="pd_FrpId" value="CEB-NET-B2C" disabled form="tijiaodingdanbiaodan"/>光大银行
                <img src="img/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C" disabled form="tijiaodingdanbiaodan"/>招商银行
                <img src="img/bank_img/cmb.bmp" align="middle"/>
            </div>
            <%--银行结束--%>
        </div>
        <%--应付总额--%>
        <div style="height:80px;position: relative;top:-30px">
            <p style="position: relative;left: 1000px">
                <span style="font-size: 14px;color: #333333">应付总额：</span>
                <span style="font-size: 36px;color: #EA4242" id="yingfuzonge">${order.getTotal()}</span>
            </p>
        </div>
        <%--去结算--%>
        <div style="position: relative;top: -50px;">
            <button id="qujiesuan" onmouseover="shubiaoxuanting(this)" onclick="successpay()">去结算</button>
        </div>
    </div>
    <%--隐藏表单数据--%>
    <%--<form action="order/alipay" method="post" id="alipay" target="_blank">--%>
    <%--<input type="hidden" name="out_trade_no" value="${order.oid}">--%>
    <%--<input type="hidden" name="subject" value="my_order">--%>
    <%--<input type="hidden" name="total_amout" value="${order.total}">--%>
    <%--<input type="hidden" name="body" value="my_product">--%>
    <%--</form>--%>
    <br>
</div>
<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"/>

<script type="text/javascript">
    function confirmOrder() {
        //提交表单
        $("#orderForm").submit();
    }

    function shuru(obj) {
        obj.style.border = "1px solid #3498DB"
    }

    function shuruwan(obj) {
        obj.style.border = "1px solid #333333"
    }

    function shubiaoxuanting(obj) {
        obj.style.backgroundColor = "#0077B2";
    }

    function shubiaodianji(obj) {
        obj.style.backgroundColor = "#3498DB";
        $("#tijiaodingdanbiaodan").submit();
    }

    function alipayform() {
        $("#alipay").submit();
    }

    function successpay() {
        var r = confirm("付款成功");
        if (r == true) {
            <%--&lt;%&ndash;%>
            <%--OrderDao dao=new OrderDao();--%>
            <%--dao.setState((Order) session.getAttribute("order"));--%>
            <%--%>--%>
            <%--${order.setState(1)}--%>
            location.href = "${pageContext.request.contextPath}/order?method=changestate&oid=${order.oid}";
        }
        else {
            location.href = "${pageContext.request.contextPath}/order?method=changestate&oid=${order.oid}";
        }
    }
</script>
</body>
<script>
    $(function () {
        var x =${order.getTotal()};
        x = Math.round(x * 100) / 100;
        $("#yingfuzonge").html(x);
    })

</script>

</html>

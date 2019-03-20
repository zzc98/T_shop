<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page errorPage="error.jsp" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>我的订单</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style>
        .footer{
            position: relative;
            top:300px;
        }
        body {
            margin-top: 20px;
            margin: 0 auto;
        }
        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }
        #dingdan{
            position:relative;
            top:15px;
            left:2%;
            width:96%;
            height:500px;
        }
        #fenye{
            position:relative;
            top:10px;
            left:2%;
            width:380px;
            height:50px;
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript">
        function tiaozhuan() {
            alert();
            location.herf='${pageContext.request.contextPath}/order?method=findByOid&oid=${order.oid}';
        }
    </script>
</head>
<body>
<!-- 引入header.jsp -->
<jsp:include page="header.jsp"/>
<div class="container" style="height: 800px">
    <div class="row">
        <div style="margin: 0 auto; margin-top: 10px; width: 950px;">
            <strong>我的订单</strong>
            <%--订单展示--%>
            <div id="dingdan">
                <table class="table table-bordered">
                    <c:forEach items="${page.list}" var="order">
                        <tbody>
                        <tbody>
                        <tr class="success">
                            <th colspan="5">订单编号:${order.oid }&nbsp;&nbsp;
                                <c:if test="${order.state==0}">
                                    <a href='${pageContext.request.contextPath }/order?method=findByOid&oid=${order.oid}'>未付款(若已付款，请耐心等待，有延迟)</a>
                                </c:if>
                                <c:if test="${order.state==1}">
                                    <a>已付款</a>
                                </c:if>
                        </tr>
                        <tr class="warning">
                            <th>图片</th>
                            <th>商品</th>
                            <th>价格</th>
                            <th>数量</th>
                            <th>小计</th>
                        </tr>
                        <c:forEach items="${order.orderItems }" var="orderItem">

                            <tr class="active">
                                <input type="hidden" name="id" value="22">
                                <td width="60" width="40%">
                                    <img src="${pageContext.request.contextPath }/${orderItem.product.pimage}" width="70" height="60">
                                </td>
                                <td width="30%"><a target="_blank">${orderItem.product.pname}</a></td>
                                <td width="20%">￥${orderItem.product.shop_price}元</td>
                                <td width="10%">${orderItem.count}</td>
                                <td width="15%"><span class="subtotal">￥${orderItem.subtotal}元</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <!--分页符 -->
    <div id="fenye" style="position: relative;top:150px">
        <ul class="pagination" style="text-align: center; margin-top: 2px;position: relative;top:-15px;left:50px">
            <li></li>
            <!-- 上一页 -->
            <%--判断是否是第一页--%>
            <c:if test="${page.currentPage==1}">
                <li class="disabled">
                    <a href="javascript:void(0);" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <%--不是第一页--%>
            <c:if test="${page.currentPage!=1 }">
                <li>
                    <a href="${pageContext.request.contextPath}/order?method=page&curPage=${page.currentPage-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <!-- 展示所有页码 -->
            <c:forEach begin="1" end="${page.totalPage }" var="n">
                <!-- 判断是否是当前页，当前页链接不允许点击 -->
                <c:if test="${n==page.currentPage }">
                    <li class="active"><a href="javascript:void(0);">${n}</a></li>
                </c:if>
                <c:if test="${n!=page.currentPage}">
                    <li><a href="${pageContext.request.contextPath}/order?method=page&curPage=${n }">${n}</a></li>
                </c:if>
            </c:forEach>
            <!-- 下一页 -->
            <%--判断是否是做后一页--%>
            <c:if test="${page.currentPage==page.totalPage }">
                <li class="disabled">
                    <a href="javascript:void(0);" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
            <%--不是最后一页--%>
            <c:if test="${page.currentPage!=page.totalPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/order?method=page&curPage=${page.currentPage+1 }" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>
    <!-- 分页结束 -->
</div>
<!-- 引入footer.jsp -->
<jsp:include page="footer.jsp"/>
</body>
</html>
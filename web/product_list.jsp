<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有商品</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <%--使用标签库--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--导入JQuery、Bootstrap--%>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        #daohang {
            position: absolute;
            top: 110px;
            left: 2%;
            width: 96%;
        }

        #showshangpin {
            position: relative;
            top: 30px;
            left: 120px;
            width: 1320px;
            height: 800px;
        }

        #fenye {
            position: relative;
            top: 350px;
            left: 2%;
            width: 380px;
            height: 50px;
            margin: 0 auto;
            background-color: #0a6cd6;
        }

        .shangpin {
            width: 240px;
            height: 400px;
            float: left;
            background-color: white;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 50px;
            transition: all ease 0.4s;
            box-shadow: 2px 2px 1px #888888;

        }

        .shangpin:hover {
            box-shadow: 10px 10px 5px #888888;
        }

    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<%--商品展示--%>
<div style="position:relative;background-color: #F2F2F2;height:1000px;">
    <div id="showshangpin">
        <c:forEach items="${pageBean.list }" var="pro">
            <div class="shangpin">
                <a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid }&cid=${cid }&currentPage=${pageBean.currentPage }">
                    <img src="${pageContext.request.contextPath }/${pro.pimage }" width="100%" height="250">
                </a>
                <p>
                    <a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid }&cid=${cid }&currentPage=${pageBean.currentPage }"
                       style='color: green'>${pro.pname }</a>
                </p>
                <p>
                <p style='color:#FF0000'>商城价：&yen;${pro.shop_price }</p>
                </p>
            </div>
        </c:forEach>
    </div>
    <!--分页 -->
    <div style="width: 380px;height:20px; margin: 0 auto; margin-top: 50px;">
        <ul class="pagination" style="text-align: center; margin-top: 10px;">
            <!-- 上一页 -->
            <c:if test="${pageBean.currentPage==1 }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </c:if>
                <c:if test="${pageBean.currentPage!=1 }">
            <li>
                <a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${pageBean.currentPage-1 }"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </c:if>
                <!-- 显示每一页 -->
                <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
                <!-- 判断是否是当前页，当前页链接不允许点击 -->
                <c:if test="${page==pageBean.currentPage }">
            <li class="active"><a href="javascript:void(0);" style="color: red">${page }</a>
                </c:if>
                <c:if test="${page!=pageBean.currentPage }">
            <li>
                <a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${page }">${page }</a>
                </c:if>
                </c:forEach>
                <!-- 下一页 -->
                <c:if test="${pageBean.currentPage==pageBean.totalPage }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Previous">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </c:if>
                <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
            <li>
                <a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${pageBean.currentPage+1 }"
                   aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            </c:if>
        </ul>
    </div>
    <%-- 分页结束 --%>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
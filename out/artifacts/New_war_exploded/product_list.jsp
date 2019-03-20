<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有商品</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <%--使用字体图标--%>
    <%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
          <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--使用标签库--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--导入JQuery、Bootstrap--%>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        /*#footer{*/
            /*position:absolute;*/
            /*top:400px;*/
            /*left:2%;*/
            /*height:80px;*/
            /*width:96%;*/
        /*}*/
        #daohang{
            position:absolute;
            top:110px;
            left:2%;
            width: 96%;
        }
        #showshangpin{
            position:relative;
            top:30px;
            left:120px;
            width:1320px;
            height:800px;
        }
        #fenye{
            position:relative;
            top:350px;
            left:2%;
            width:380px;
            height:50px;
            margin: 0 auto;
            background-color: #0a6cd6;
        }
        .shangpin{
            width:240px;
            height: 400px;
            float: left;
            background-color: white;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 50px
        }
    </style>
    <script type="text/javascript">
        function enterchange(obj) {
            obj.style.backgroundColor="#F2F2F2"
        }
        function outchange(obj) {
            obj.style.backgroundColor="white"
        }
    </script>
</head>
<body>
<%@ include file="header.jsp"%>
<%--商品展示--%>
<div style="position:relative;background-color: #F2F2F2;height:1000px;">
    <div id="showshangpin">
        <c:forEach items="${pageBean.list }" var="pro">
            <div class="shangpin" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                <a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid }&cid=${cid }&currentPage=${pageBean.currentPage }">
                    <img src="${pageContext.request.contextPath }/${pro.pimage }" width="100%" height="250">
                </a>
                <p>
                    <a href="${pageContext.request.contextPath }/product?method=productInfo&pid=${pro.pid }&cid=${cid }&currentPage=${pageBean.currentPage }" style='color: green'>${pro.pname }</a>
                </p>
                <p>
                    <font color="#FF0000">商城价：&yen;${pro.shop_price }</font>
                </p>
            </div>
        </c:forEach>
    </div>
            <%--<!--分页符 -->--%>
            <%--&lt;%&ndash;<div id="fenye">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<ul class="pagination" style="text-align: center; margin-top: 2px;position: relative;top:-15px;left:50px">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li></li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<!-- 上一页 -->&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;判断是否是第一页&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<c:if test="${pb.pageNumber==1}">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<li class="disabled">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="javascript:void(0);" aria-label="Previous">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span aria-hidden="true">&laquo;</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;不是第一页&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<c:if test="${pb.pageNumber!=1 }">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/product?method=findByPage&pageNumber=${pb.pageNumber-1}&cid=${param.cid}" aria-label="Previous">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span aria-hidden="true">&laquo;</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<!-- 展示所有页码 -->&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<c:forEach begin="1" end="${pb.totalPage }" var="n">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<!-- 判断是否是当前页，当前页链接不允许点击 -->&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<c:if test="${n==pb.pageNumber }">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li class="active"><a href="javascript:void(0);">${n}</a></li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<c:if test="${n!=pb.pageNumber }">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="${pageContext.request.contextPath}/product?method=findByPage&cid=${cid }&currentPage=${n }">${n}</a></li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<!-- 下一页 -->&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;判断是否是做后一页&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<c:if test="${pb.pageNumber==pb.totalPage }">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<li class="disabled">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="javascript:void(0);" aria-label="Next">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span aria-hidden="true">&raquo;</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;&lt;%&ndash;不是最后一页&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<c:if test="${pb.pageNumber!=pb.totalPage }">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<a href="${pageContext.request.contextPath}/product?method=findByPage&cid=${param.cid }&pageNumber=${pb.pageNumber+1 }" aria-label="Next">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span aria-hidden="true">&raquo;</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<!-- 分页结束 -->--%>


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
                    <a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${pageBean.currentPage-1 }" aria-label="Previous">
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
                <li><a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${page }">${page }</a>
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
                    <a href="${pageContext.request.contextPath}/product?method=productList&cid=${cid }&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
            </li>
                    </c:if>
            </ul>
        </div>
        <%--<!-- 分页结束 -->--%>

        <%--<!--商品浏览记录-->--%>
        <%--<div style="position: relative;top:150px;width: 1210px;margin: 0 auto; padding:9px; border: 1px solid #ddd; border-top: 2px solid #999; height: 300px;">--%>

            <%--<h4 style="position: relative;left:30px">浏览记录</h4>--%>
            <%--<div style="width: 50%; float: right; text-align: right;">--%>
                <%--<a href="">more</a>--%>
            <%--</div>--%>
            <%--<div style="clear: both;"></div>--%>

            <%--<div style="overflow: hidden;">--%>

                <%--&lt;%&ndash;<ul style="list-style: none;">&ndash;%&gt;--%>
                    <%--<c:forEach items="${historyProductList }" var="historyPro">--%>
                    <%--<div style="width: 150px; height: 216px; float: left; margin: 0 8px 0 0; padding: 0 18px 15px; text-align: center;border:1px solid red">--%>
                        <%--<img src="${pageContext.request.contextPath}/${historyPro.pimage }" width="130px" height="130px" />--%>
                        <%--<br>--%>
                        <%--&lt;%&ndash;<div style="width: 120px;word-break: break-all;word-wrap: break-word;">&ndash;%&gt;--%>
                                <%--${historyPro.pname }--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--</div>--%>
                        <%--</c:forEach>--%>
                <%--</ul>--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
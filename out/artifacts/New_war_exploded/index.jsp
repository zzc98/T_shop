<%@ page import="com.taobao.dao.ProductDao" %>
<%@ page import="com.taobao.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>商城</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/index.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<%--轮播图--%>
<div class="container-fluid" id="index_div_1">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- 轮播图的中的小点 -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>
        <!-- 轮播图的轮播图片 -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="img/index/u131.png" id="index_img_1">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/index/u133.jpg" id="index_img_2">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/index/u135.jpg" id="index_img_3">
                <div class="carousel-caption"></div>
            </div>
            <div class="item">
                <img src="img/index/u137.jpg" id="index_img_4">
                <div class="carousel-caption"></div>
            </div>
        </div>
        <!-- 上一张 下一张按钮 -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<%--所有商品（最新、最热）--%>
<div id="suoyoushangpin">
    <a name="asuoyoushangpin"></a>
    <ul id="myTab" class="nav nav-tabs">
        <li class="active"><a href="#zuireshangpin" data-toggle="tab">最热商品</a></li>
        <li><a href="#zuixinshangpin" data-toggle="tab">最新商品</a></li>
    </ul>
    <div id="MyTabContent" class="tab-content">
        <%--最热商品--%>
        <div class="tab-pane active" id="zuireshangpin">
            <%--<c:forEach items="${hotProductList}" var="hotPro">--%>
            <%
                ProductDao productDao = new ProductDao();
                List<Product> hotProductList = productDao.findHotProductlist();
            %>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath}/<%=hotProductList.get(0).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=hotProductList.get(0).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=hotProductList.get(0).getShop_price()%>
                </p>
            </div>

            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(1).getPid()%>">
                    <img src="${pageContext.request.contextPath}/<%=hotProductList.get(1).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=hotProductList.get(1).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=hotProductList.get(1).getShop_price()%>
                </p>
            </div>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(2).getPid()%>">
                    <img src="${pageContext.request.contextPath}/<%=hotProductList.get(2).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=hotProductList.get(2).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=hotProductList.get(2).getShop_price()%>
                </p>
            </div>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(3).getPid()%>">
                    <img src="${pageContext.request.contextPath}/<%=hotProductList.get(3).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=hotProductList.get(3).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=hotProductList.get(3).getShop_price()%>
                </p>
            </div>
        </div>
        <%--最热商品--%>
        <div class="tab-pane" id="zuixinshangpin">
            <%
                List<Product> newProductList = productDao.findNewProductlist();
            %>
            <%--<c:forEach items="${newProductList }" var="newPro">--%>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=newProductList.get(0).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=newProductList.get(0).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=newProductList.get(0).getShop_price()%>
                </p>
            </div>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(1).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=newProductList.get(1).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=newProductList.get(1).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=newProductList.get(1).getShop_price()%>
                </p>
            </div>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(2).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=newProductList.get(2).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=newProductList.get(2).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=newProductList.get(2).getShop_price()%>
                </p>
            </div>
            <div class="col-md-2 group1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(3).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=newProductList.get(3).getPimage()%>" width="130"
                         height="130">
                </a>
                <p>
                    <a href="product_info.jsp"><%=newProductList.get(3).getPname()%>
                    </a>
                </p>
                <p>&yen;<%=newProductList.get(3).getShop_price()%>
                </p>
            </div>
            <%--</c:forEach>--%>
        </div>
        <%--</c:forEach>--%>
    </div>

</div>

<%--以下是家电数码--%>
<div id="jiadianshuma">
    <a name="ajiadianshuma"></a>
    <span id="goods_title1">家电数码</span>
    <div class="tab-content">
        <%--综合--%>
        <div class="tab-pane active" id="zonghe">
            <%
                List<Product> oneProductList = productDao.findoneProductlist();
            %>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(0).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(0).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(0).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(1).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(1).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(1).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(1).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(2).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(2).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(2).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(2).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(3).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(3).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(3).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(3).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(4).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(4).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(4).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(4).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(5).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(5).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(5).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(5).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(6).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(6).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(6).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(6).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(7).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(7).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(7).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(7).getShop_price()%></span>
                </p>
            </div>
            <div class="shangpin">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(8).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(8).getPimage()%>" width="160"
                         height="200">
                </a>
                <p><%=oneProductList.get(8).getPname()%>
                </p>
                <p><span>&yen;<%=oneProductList.get(8).getShop_price()%></span>
                </p>
            </div>
            <%--</c:if>--%>
            <%--<c:if test="${status.count}==10">--%>
            <%--最后一个--%>
            <div style="width:170px; height:170px; padding: 10px; margin: 10px; float:left; background-color: white;">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(9).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=oneProductList.get(9).getPimage()%>" width="150"
                         height="150">
                </a>
            </div>
            <%--</c:if>--%>
            <%--//            </c:forEach>--%>
            <div style=" position:relative; width:200px; height:50px; padding-left: 30px; margin: 10px; float:left;">
                <a style="font-size: 18px;color: #333333"
                   href="${pageContext.request.contextPath}/product?method=productList&cid=1">浏览更多<img
                        src="img/index/u1098_selected.png"></a>
            </div>
        </div>
        <%--电视机--%>
    </div>
</div>
<%--以下是男装女装--%>
<div id="nanzhuangnvzhuang">
    <a name="ananzhuangnvzhuang"></a>
    <span class="goods_title2">男装女装</span>
    <div class="tab-content">
        <div class="tab-pane active" id="nanzhuang">
            <img src="img/index/u654.jpg" id="yifuimg1" width="250" height="500">
            <%
                List<Product> twoProductList = productDao.findtwoProductlist();
            %>
            <div class="shadowdiv" id="sd0">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(0).getPimage()%>" width="200"
                         height="150">
                </a>
                <div class="shadowsdiv_sub1">
                    <p id="index_p1"><%=twoProductList.get(0).getPname()%>
                    </p>
                    <p><span>&yen;<%=twoProductList.get(0).getShop_price()%></span>
                    </p>
                </div>
            </div>
            <div class="shadowdiv" id="sd1">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(1).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(1).getPimage()%>" width="200"
                         height="150">
                </a>
                <div class="shadowsdiv_sub1">
                    <p id="index_p2"><%=twoProductList.get(1).getPname()%>
                    </p>
                    <p><span>&yen;<%=twoProductList.get(1).getShop_price()%></span>
                    </p>
                </div>
            </div>
            <div class="shadowdiv" id="sd2">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(2).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(2).getPimage()%>" width="150"
                         height="150">
                </a>
                <br>
                <p id="index_p3"><%=twoProductList.get(2).getPname()%>
                </p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(2).getShop_price()%></span>
                </p>
            </div>
            <div class="shadowdiv" id="sd3">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(3).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(3).getPimage()%>" width="150"
                         height="150">
                </a>
                <br>
                <p id="index_p4"><%=twoProductList.get(3).getPname()%>
                </p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(3).getShop_price()%></span>
                </p>
            </div>
            <div class="shadowdiv" id="sd4">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(4).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(4).getPimage()%>" width="150"
                         height="150">
                </a>
                <br>
                <p id="index_p5"><%=twoProductList.get(4).getPname()%>
                </p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(4).getShop_price()%></span>
                </p>
            </div>
            <div id="sd19" class="zhiyoutupianmeiyoumianshudeduochulaide">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(5).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(5).getPimage()%>" width="150"
                         height="150">
                </a>
                <br>
            </div>
            <div id="sd20">
                <a class="lookmore" href="${pageContext.request.contextPath}/product?method=productList&cid=2">浏览更多
                    <img src="img/index/u1098_selected.png">
                </a>
            </div>
        </div>

    </div>
</div>
<%--以下是体育运动--%>
<div id="tiyuyundong">
    <a name="atiyuyundong"></a>
    <span class="goods_title2">体育运动</span>
    <span class="goods_title2_sub">
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=3" class="lookmore"
           onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
    <div>
        <img src="img/index/u951.jpg" style="position:relative;top:30px;left:20px" width="250" height="500">
        <%
            List<Product> threeProductList = productDao.findthreeProductlist();
        %>
        <div class="shadowdiv" id="sd13">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(0).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(0).getPimage() %>" width="150"
                     height="150">
            </a>
            <div id="subdiv1">
                <p><%=threeProductList.get(0).getPname()%>
                </p>
                <p><span>&yen;<%=threeProductList.get(0).getShop_price() %></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd14">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(1).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(1).getPimage() %>" width="150"
                     height="150">
            </a>
            <div id="subdiv2">
                <p><%=threeProductList.get(1).getPname() %>
                </p>
                <p><span>&yen;<%=threeProductList.get(1).getShop_price() %></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd15">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(2).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(2).getPimage() %>" width="150"
                     height="150">
            </a>
            <br>
            <p><%=threeProductList.get(2).getPname() %>
            </p>
            <p><span>&yen;<%=threeProductList.get(2).getShop_price() %></span></p>
        </div>
        <div class="shadowdiv" id="sd16">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(3).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(3).getPimage() %>" width="150"
                     height="150">
            </a>
            <br>
            <p><%=threeProductList.get(3).getPname() %>
            </p>
            <p><span>&yen;<%=threeProductList.get(3).getShop_price() %></span></p>
        </div>
        <div class="shadowdiv" id="sd17">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(4).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(4).getPimage() %>" width="150"
                     height="150">
            </a>
            <br>
            <p><%=threeProductList.get(4).getPname() %>
            </p>
            <p><span>&yen;<%=threeProductList.get(4).getShop_price() %></span></p>
        </div>
        <div class="shadowdiv" id="sd18">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(5).getPid() %>">
                <img src="${pageContext.request.contextPath }/<%=threeProductList.get(5).getPimage() %>" width="150"
                     height="150">
            </a>
            <br>
            <p><%=threeProductList.get(5).getPname() %>
            </p>
            <p><span>&yen;<%=threeProductList.get(5).getShop_price() %></span></p>
        </div>
    </div>
</div>
<%--以下是教材资料--%>
<div id="jiaocaiziliao">
    <a name="ajiaocaiziliao"></a>
    <span class="goods_title2">教材资料</span>
    <span class="goods_title2_sub">
        <%--href="${pageContext.request.contextPath}/product?method=productList&cid=1"--%>
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=4" class="lookmore"
           onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
    <div>
        <img src="img/index/u1103.jpg" width="250" height="500" style="position: absolute;">
        <%
            List<Product> fourProductList = productDao.findfourProductlist();
        %>
        <div class="shadowdiv" id="sd9">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(0).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(0).getPimage()%>" width="150"
                     height="150">
            </a>
            <div id="subdiv3">
                <p><%=fourProductList.get(0).getPname()%>
                </p>
                <p><span>&yen;<%=fourProductList.get(0).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd10">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(1).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(1).getPimage()%>" width="150"
                     height="150">
            </a>
            <div id="subdiv4">
                <p><%=fourProductList.get(1).getPname()%>
                </p>
                <p><span>&yen;<%=fourProductList.get(1).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd11">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(2).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(2).getPimage()%>" width="150"
                     height="150">
            </a>
            <div id="subdiv5">
                <p><%=fourProductList.get(2).getPname()%>
                </p>
                <p><span>&yen;<%=fourProductList.get(2).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd12">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(3).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(3).getPimage()%>" width="150"
                     height="150">
            </a>
            <div id="subdiv6">
                <p><%=fourProductList.get(3).getPname()%>
                </p>
                <p><span>&yen;<%=fourProductList.get(3).getShop_price()%></span>
                </p>
            </div>
        </div>
    </div>
</div>
<%--生活用品--%>
<div id="shenghuoyongpin">
    <a name="ashenghuoyongpin"></a>
    <span class="goods_title2">生活用品</span>
    <span class="goods_title2_sub">
        <%--"${pageContext.request.contextPath}/product?method=productList&cid=1"--%>
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=1" class="lookmore"
           onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
    <div>
        <img src="img/index/u1103.jpg" width="250" height="500" style="position: absolute;">
        <%
            List<Product> fiveProductList = productDao.findfiveProductlist();
        %>
        <div class="shadowdiv" id="sd5">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(0).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(0).getPimage()%>" width="200"
                     height="200">
            </a>
            <div id="subdiv7">
                <p><%=fiveProductList.get(0).getPname()%>
                </p>
                <p><span>&yen;<%=fiveProductList.get(0).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd6">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(1).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(1).getPimage()%>" width="200"
                     height="200">
            </a>
            <div id="subdiv8">
                <p><%=fiveProductList.get(1).getPname()%>
                </p>
                <p><span>&yen;<%=fiveProductList.get(1).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd7">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(2).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(2).getPimage()%>" width="200"
                     height="200">
            </a>
            <div id="subdiv9">
                <p><%=fiveProductList.get(2).getPname()%>
                </p>
                <p><span>&yen;<%=fiveProductList.get(2).getShop_price()%></span>
                </p>
            </div>
        </div>
        <div class="shadowdiv" id="sd8">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(3).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(3).getPimage()%>" width="200"
                     height="200">
            </a>
            <div id="subdiv10">
                <p><%=fiveProductList.get(3).getPname()%>
                </p>
                <p><span>&yen;<%=fiveProductList.get(3).getShop_price()%></span>
                </p>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer2.jsp" %>
<style type="text/css">
    #footer2 {
        position: relative;
        top: 4100px;
    }

</style>
</body>
</html>
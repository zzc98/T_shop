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
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        html { overflow-x: hidden; overflow-y: auto; }
        *{
            font-family: 微软雅黑;
        }
        .carousel-control.left {
            background-image:none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
        }
        .carousel-control.right {
            left: auto;
            right: 0;
            background-image:none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
        }
        #suoyoushangpin{
            position:relative;
            top:430px;
            left:200px;
        }
        #jiadianshuma{
            position:absolute;
            top:875px;
            left:200px;
            width:1100px;
            height:700px;
            padding:10px;
            background-color: #F2F2F2;
        }
        #nanzhuangnvzhuang{
            position:absolute;
            top:1550px;
            left:200px;
            width:1100px;
            height:700px;
            padding:10px;
            background-color: #F2F2F2;
        }
        #tiyuyundong{
            position:absolute;
            top:2250px;
            left:200px;
            width:1100px;
            height:700px;
            padding:10px;
            background-color: #F2F2F2;
        }
        #jiaocaiziliao{
            position:absolute;
            top:2950px;
            left:200px;
            width:1100px;
            height:700px;
            padding:10px;
            background-color: #F2F2F2;
        }
        #shenghuoyongpin{
            position:absolute;
            top:3650px;
            left:200px;
            width:1100px;
            height:700px;
            padding:10px;
            background-color: #F2F2F2;
        }
        #myTab{
            position:relative;
            top:-20px;
            left:20px;
        }
        #MyTabContent{
            position:relative;
            left:-30px;
        }
        .shangpin{
            width:190px;
            height:300px;
            padding: 10px;
            margin: 0px;
            margin-bottom: 10px;
            float:left;
            background-color: white;
        }
        .shadowdiv:hover{
            box-shadow: 2px 4px 6px #888888;
        }
        .zhiyoutupianmeiyoumianshudeduochulaide:hover{
            box-shadow: 2px 4px 6px #888888;
        }
    </style>
    <script type="text/javascript">
        function enterchange(obj) {
            obj.style.border="2px solid blue";
        }
        function outchange(obj) {
            obj.style.border="none";
        }
        function morechange(obj) {
            obj.style.color="blue";
            obj.firstElementChild.src="../img/首页（new）/u1098_selected.png";
        }
        function lesschange(obj) {
            obj.style.color="#333333";
            obj.firstElementChild.src="../img/首页（new）/u1098.png";
        }
    </script>
</head>
<body>
<%--建立锚点--%>
<%--<a name="backtotop"></a>--%>
<%--<div style="background-color: #F2F2F2;width:45px;height:45px;font-size: 40px;position:fixed;top:600px;left:1400px">--%>
    <%--<a href="#backtotop"> <span class="glyphicon glyphicon-chevron-up" style="position: relative;left:4px"></span></a>--%>
<%--</div>--%>
<%@ include file="header.jsp"%>
<%--轮播图--%>
<div class="container-fluid" style="position: absolute;top:120px;left:120px;width:1280px; height:520px;">
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
                <img src="img/index/u131.png" style="position: relative;left:50px">
                <div class="carousel-caption">
                    <!-- 轮播图上的文字 -->
                </div>
            </div>
            <div class="item">
                <img src="img/index/u133.jpg" style="position: relative;left:100px">
                <div class="carousel-caption">
                    <!-- 轮播图上的文字 -->
                </div>
            </div>
            <div class="item">
                <img src="img/index/u135.jpg" style="position: relative;left:70px">
                <div class="carousel-caption">
                    <!-- 轮播图上的文字 -->
                </div>
            </div>
            <div class="item">
                <img src="img/index/u137.jpg" style="position: relative;left:100px">
                <div class="carousel-caption">
                    <!-- 轮播图上的文字 -->
                </div>
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
<div  id="suoyoushangpin" >
    <a name="asuoyoushangpin"></a>
    <ul id="myTab" class="nav nav-tabs" style="border:1px solid white;">
        <li class="active"><a href="#zuireshangpin" data-toggle="tab">最热商品</a></li>
        <li><a href="#zuixinshangpin" data-toggle="tab">最新商品</a></li>
    </ul>
    <div id="MyTabContent" class="tab-content">
        <%--最热商品--%>
        <div class="tab-pane active" id="zuireshangpin" >
            <%--<c:forEach items="${hotProductList}" var="hotPro">--%>
                <%
                    ProductDao productDao =new ProductDao();
                    List<Product> hotProductList=productDao.findHotProductlist();
                %>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath}/<%=hotProductList.get(0).getPimage()%>" width="130" height="130" style="display: inline-block;">
                </a>
                <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=hotProductList.get(0).getPname()%></a></p>
                <p style="color:#CC0000;font-size:18px">&yen;<%=hotProductList.get(0).getShop_price()%></p>
            </div>

                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(1).getPid()%>">
                        <img src="${pageContext.request.contextPath}/<%=hotProductList.get(1).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=hotProductList.get(1).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=hotProductList.get(1).getShop_price()%></p>
                </div>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(2).getPid()%>">
                        <img src="${pageContext.request.contextPath}/<%=hotProductList.get(2).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=hotProductList.get(2).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=hotProductList.get(2).getShop_price()%></p>
                </div>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=hotProductList.get(3).getPid()%>">
                        <img src="${pageContext.request.contextPath}/<%=hotProductList.get(3).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=hotProductList.get(3).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=hotProductList.get(3).getShop_price()%></p>
                </div>
                </div>
            <%--最热商品--%>
            <div class="tab-pane" id="zuixinshangpin">
                <%
                    List<Product> newProductList=productDao.findNewProductlist();
                %>
                <%--<c:forEach items="${newProductList }" var="newPro">--%>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(0).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=newProductList.get(0).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=newProductList.get(0).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=newProductList.get(0).getShop_price()%></p>
                </div>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(1).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=newProductList.get(1).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=newProductList.get(1).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=newProductList.get(1).getShop_price()%></p>
                </div>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(2).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=newProductList.get(2).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=newProductList.get(2).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=newProductList.get(2).getShop_price()%></p>
                </div>
                <div class="col-md-2" style="text-align:center;height:250px;padding:10px 0px;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=newProductList.get(3).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=newProductList.get(3).getPimage()%>" width="130" height="130" style="display: inline-block;">
                    </a>
                    <p><a href="product_info.jsp" style='color:#333333;font-size: 14px'><%=newProductList.get(3).getPname()%></a></p>
                    <p style="color:#CC0000;font-size:18px">&yen;<%=newProductList.get(3).getShop_price()%></p>
                </div>
                <%--</c:forEach>--%>
            </div>
            <%--</c:forEach>--%>
        </div>

    </div>

<%--*******************************************************************************************--%>
<%--以下是家电数码--%>
<div id="jiadianshuma">
    <a name="ajiadianshuma"></a>
    <span style="font-size: 28px;color:#797979">家电数码</span>
    <%--<ul  class="nav nav-tabs" style="position: absolute;top:0px;left:450px; width: 500px;background-color: #F2F2F2;">--%>
        <%--<li class="active"><a href="#zonghe" data-toggle="tab" style="font-size: 18px">综合</a></li>--%>
        <%--<li><a href="#dianshiji" data-toggle="tab" style="font-size: 18px">电视机</a></li>--%>
        <%--<li><a href="#shouji" data-toggle="tab" style="font-size: 18px">手机</a></li>--%>
        <%--<li><a href="#diannao" data-toggle="tab" style="font-size: 18px">电脑</a></li>--%>
    <%--</ul>--%>
    <div  class="tab-content">
        <%--综合--%>
        <div class="tab-pane active" id="zonghe">
            <%--<c:forEach items="${oneProductList}" var="pro">--%>
                <%--<c:if test="${status.count}<10">--%>
                <%
                    List<Product> oneProductList=productDao.findoneProductlist();
                %>
                    <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                        <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(0).getPid()%>">
                            <img src="${pageContext.request.contextPath }/<%=oneProductList.get(0).getPimage()%>" width="160" height="200">
                        </a>
                        <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(0).getPname()%>}</p>
                        <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(0).getShop_price()%></span></p>
                    </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(1).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(1).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(1).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(1).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(2).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(2).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(2).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(2).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(3).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(3).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(3).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(3).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(4).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(4).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(4).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(4).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(5).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(5).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(5).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(5).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(6).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(6).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(6).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(6).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(7).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(7).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(7).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(7).getShop_price()%></span></p>
                </div>
                <div class="shangpin"  onmouseover="enterchange(this)" onmouseout="outchange(this)">
                    <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(8).getPid()%>">
                        <img src="${pageContext.request.contextPath }/<%=oneProductList.get(8).getPimage()%>" width="160" height="200">
                    </a>
                    <p style="font-size: 16px;color: #333333;"><%=oneProductList.get(8).getPname()%>}</p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=oneProductList.get(8).getShop_price()%></span></p>
                </div>
                <%--</c:if>--%>
                <%--<c:if test="${status.count}==10">--%>
                <%--最后一个--%>
                    <div style="width:170px; height:170px; padding: 10px; margin: 10px; float:left; background-color: white;" onmouseover="enterchange(this)" onmouseout="outchange(this)">
                        <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=oneProductList.get(9).getPid()%>">
                            <img src="${pageContext.request.contextPath }/<%=oneProductList.get(9).getPimage()%>" width="150" height="150">
                        </a>
                    </div>
                <%--</c:if>--%>
<%--//            </c:forEach>--%>
            <div style=" position:relative; width:200px; height:50px; padding-left: 30px; margin: 10px; float:left;">
                <a style="font-size: 18px;color: #333333" href="${pageContext.request.contextPath}/product?method=productList&cid=1">浏览更多<img src="img/index/u1098_selected.png" ></a>
            </div>
        </div>
        <%--电视机--%>
    </div>
</div>
<%--*******************************************************************************************--%>
<%--以下是男装女装--%>
<div id="nanzhuangnvzhuang">
    <a name="ananzhuangnvzhuang"></a>
    <span style="font-size: 25px;">男装女装</span>
    <%--<ul  class="nav nav-tabs" style="position: absolute;top:0px;left:450px; width: 500px">--%>
        <%--<li class="active"><a href="#nanzhuang" data-toggle="tab" style="font-size: 18px">男装</a></li>--%>
        <%--<li><a href="#nvzhuang" data-toggle="tab" style="font-size: 18px"> 女装</a></li>--%>
    <%--</ul>--%>
    <div class="tab-content">
        <div class="tab-pane active" id="nanzhuang">
            <img src="img/index/u654.jpg" style="position:relative;top:30px;left:20px" width="250" height="500">
            <%
                List<Product> twoProductList=productDao.findtwoProductlist();
            %>
            <div class="shadowdiv" style="position:absolute;top:80px;left:300px;width:350px;height:200px;background-color: white;padding: 10px;">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(0).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(0).getPimage()%>" width="200" height="150">
                </a>
                <div style="position: absolute;left:220px;top:20px;height:200px;width:120px;">
                    <p style="font-size: 16px;color: #333333;"><%=twoProductList.get(0).getPname()%></p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(0).getShop_price()%></span></p>
                </div>
            </div>
            <div class="shadowdiv" style="position:absolute;top:80px;left:652px;width:350px;height:200px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(1).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(1).getPimage()%>" width="200" height="150">
                </a>
                <div style="position: absolute;left:220px;top:20px;height:200px;width:120px;">
                    <p style="font-size: 16px;color: #333333;"><%=twoProductList.get(1).getPname()%></p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(1).getShop_price()%></span></p>
                </div>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:280px;width:170px;height:280px;background-color: white;padding: 10px;">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(2).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(2).getPimage()%>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=twoProductList.get(2).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(2).getShop_price()%></span></p>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:460px;width:170px;height:280px;background-color: white;padding: 10px;">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(3).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(3).getPimage()%>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=twoProductList.get(3).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(3).getShop_price()%></span></p>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:640px;width:170px;height:280px;background-color: white;padding: 10px;">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(4).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(4).getPimage()%>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=twoProductList.get(4).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=twoProductList.get(4).getShop_price()%></span></p>
            </div>
            <div style="width:170px;height:150px;position: relative;left:810px;bottom: 220px;background-color: white" class="zhiyoutupianmeiyoumianshudeduochulaide">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=twoProductList.get(5).getPid()%>">
                    <img src="${pageContext.request.contextPath }/<%=twoProductList.get(5).getPimage()%>" width="150" height="150">
                </a>
                <br>
            </div>
            <div style="position:relative;bottom: 180px;left:810px;width:250px;height:100px;" class="">
                <a style="font-size: 18px;color: #333333" href="${pageContext.request.contextPath}/product?method=productList&cid=2">浏览更多<img src="img/index/u1098_selected.png" ></a>
            </div>
        </div>

    </div>
</div>
<%--*******************************************************************************************--%>
<%--以下是体育运动--%>
<div id="tiyuyundong">
    <a name="atiyuyundong"></a>
    <span style="font-size: 25px;">体育运动</span>
    <span style="position: relative;left:700px">
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=3" style="font-size: 18px;color: #333333" onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
        <div>
            <img src="img/index/u951.jpg" style="position:relative;top:30px;left:20px" width="250" height="500">
            <%
                List<Product> threeProductList=productDao.findthreeProductlist();
            %>
            <div class="shadowdiv" style="position:absolute;top:80px;left:300px;width:370px;height:200px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(0).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(0).getPimage() %>" width="150" height="150">
                </a>
                <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                    <p style="font-size: 16px;color: #333333;"><%=threeProductList.get(0).getPname()%></p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(0).getShop_price() %></span></p>
                </div>
            </div>
            <div class="shadowdiv"style="position:absolute;top:80px;left:680px;width:370px;height:200px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(1).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(1).getPimage() %>" width="150" height="150">
                </a>
                <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                    <p style="font-size: 16px;color: #333333;"><%=threeProductList.get(1).getPname() %></p>
                    <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(1).getShop_price() %></span></p>
                </div>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:300px;width:170px;height:270px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(2).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(2).getPimage() %>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=threeProductList.get(2).getPname() %></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(2).getShop_price() %></span></p>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:480px;width:170px;height:270px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(3).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(3).getPimage() %>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=threeProductList.get(3).getPname() %></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(3).getShop_price() %></span></p>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:660px;width:170px;height:270px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(4).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(4).getPimage() %>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=threeProductList.get(4).getPname() %></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(4).getShop_price() %></span></p>
            </div>
            <div class="shadowdiv" style="position:absolute;top:320px;left:840px;width:170px;height:270px;background-color: white;padding: 10px">
                <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=threeProductList.get(5).getPid() %>">
                    <img src="${pageContext.request.contextPath }/<%=threeProductList.get(5).getPimage() %>" width="150" height="150">
                </a>
                <br><p style="font-size: 16px;color: #333333;"><%=threeProductList.get(5).getPname() %></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=threeProductList.get(5).getShop_price() %></span></p>
            </div>
        </div>
</div>
<%--以下是教材资料--%>
<div id="jiaocaiziliao">
    <a name="ajiaocaiziliao"></a>
    <span style="font-size: 25px;">教材资料</span>
    <span style="position: relative;left:700px">
        <%--href="${pageContext.request.contextPath}/product?method=productList&cid=1"--%>
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=4" style="font-size: 18px;color: #333333" onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
    <div>
        <img src="img/index/u1103.jpg" width="250" height="500" style="position: absolute;">
        <%
            List<Product> fourProductList=productDao.findfourProductlist();
        %>
        <div class="shadowdiv" style="position: absolute;top:50px;left:300px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(0).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(0).getPimage()%>" width="150" height="150">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;"><%=fourProductList.get(0).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fourProductList.get(0).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:50px;left:720px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(1).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(1).getPimage()%>" width="150" height="150">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;"><%=fourProductList.get(1).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fourProductList.get(1).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:350px;left:300px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(2).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(2).getPimage()%>" width="150" height="150">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;"><%=fourProductList.get(2).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fourProductList.get(2).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:350px;left:720px;;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fourProductList.get(3).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fourProductList.get(3).getPimage()%>" width="150" height="150">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;"><%=fourProductList.get(3).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fourProductList.get(3).getShop_price()%></span></p>
            </div>
        </div>
    </div>
</div>
<%--生活用品--%>
<div id="shenghuoyongpin">
    <a name="ashenghuoyongpin"></a>
    <span style="font-size: 25px;">生活用品</span>
    <span style="position: relative;left:700px">
        <%--"${pageContext.request.contextPath}/product?method=productList&cid=1"--%>
        <a href="${pageContext.request.contextPath}/product?method=productList&cid=1" style="font-size: 18px;color: #333333" onmouseover="morechange(this)" onmouseout="lesschange(this)">查看更多
            <img src="img/index/u1098.png">
        </a>
    </span>
    <div>
        <img src="img/index/u1103.jpg" width="250" height="500" style="position: absolute;">
        <%
            List<Product> fiveProductList=productDao.findfiveProductlist();
        %>
        <div class="shadowdiv" style="position: absolute;top:50px;left:300px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(0).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(0).getPimage()%>" width="200" height="200">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;">$<%=fiveProductList.get(0).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fiveProductList.get(0).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:50px;left:720px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(1).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(1).getPimage()%>" width="200" height="200">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;">$<%=fiveProductList.get(1).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fiveProductList.get(1).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:350px;left:300px;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(2).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(2).getPimage()%>" width="200" height="200">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;">$<%=fiveProductList.get(2).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fiveProductList.get(2).getShop_price()%></span></p>
            </div>
        </div>
        <div class="shadowdiv" style="position: absolute;top:350px;left:720px;;width:370px;height:250px;padding: 10px;background-color: white">
            <a href="${pageContext.request.contextPath}/product?method=productInfo&pid=<%=fiveProductList.get(3).getPid()%>">
                <img src="${pageContext.request.contextPath }/<%=fiveProductList.get(3).getPimage()%>" width="200" height="200">
            </a>
            <div style="position: absolute;left:220px;top:20px;height:200px;width:150px;">
                <p style="font-size: 16px;color: #333333;">$<%=fiveProductList.get(3).getPname()%></p>
                <p><span style="color:#FF0000;font-size: 14px">&yen;<%=fiveProductList.get(3).getShop_price()%></span></p>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
<style type="text/css">
    #footer{
        position: relative;
        top:4100px;
    }
    .dfu{
        position: relative;
        bottom:150px;
    }
</style>
</body>
</html>
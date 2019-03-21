<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品信息</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <%--使用字体图标--%>
    <%--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
    <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--使用标签库--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--导入JQuery、Bootstrap--%>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>
    <style type="text/css">
        #footer {
            position: relative;
            top: 450px;
            /*left:2%;*/
        }

        .carousel-control.left {
            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
        }

        .carousel-control.right {
            left: auto;
            right: 0;
            background-image: none;
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
        }

        #jiarugouwuche {
            background-image: url('img/items_info/u175.png');
            height: 40px;
            width: 250px;
            color: white;
            text-align: center;
            position: relative;
            right: 7px;
            border: none;
        }

        #jiarugouwuche:hover {
            opacity: 0.8;
        }

        #jiarugouwuche:active {
            opacity: 1;
        }

        .shangxia {
            position: relative;
            top: 150px;
            width: 40px;
            height: 60px;
        }

        .erweima {
            z-index: 100;
            width: 100px;
            height: 100px;
            position: absolute;
            top: 300px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".carousel").carousel({
                interval: false
            });
            $("#weixinzhifu").mouseover(function () {
                $("#weixinzhifuerweima").fadeIn(500);
            });
            $("#weixinzhifu").mouseout(function () {
                $("#weixinzhifuerweima").fadeOut(500);
            });
            $("#zhifubaozhifu").mouseover(function () {
                $("#zhifubaozhifuerweima").fadeIn(500);
            });
            $("#zhifubaozhifu").mouseout(function () {
                $("#zhifubaozhifuerweima").fadeOut(500);
            });
            $(".shangxia").mouseover(function () {
                $(this).css("backgroundColor", "#434343");
            });
            $(".shangxia").mouseout(function () {
                $(this).css("backgroundColor", "white");
            })
            // 加入到购物车
            $("#jiarugouwuche").click(function () {
                var buyNum = $("#buyNum").val();
                if (buyNum == 0) {
                    alert("请输入购买数量！");
                    return;
                }
                location.href = "${pageContext.request.contextPath}/product?method=addProductToCart&pid=${product.pid }&buyNum=" + buyNum;

            })
        })
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="position:absolute;top:120px;left:200px;width:1100px;height:450px;">
    <%--<div style="width: 50px;height: 400px;position: absolute;top:0;left:0;" >--%>
    <%--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">--%>
    <%--<img src="../img/商品信息详情/u137.png" class="shangxia" style="left:5px;">--%>
    <%--</a>--%>
    <%--</div>--%>
    <div style="width:500px;height: 400px;position: absolute;top:0;left:50px;" class="container-fluid">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- 轮播图的中的小点 -->
            <%--<ol class="carousel-indicators" >--%>
            <%--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>--%>
            <%--<li data-target="#carousel-example-generic" data-slide-to="1"></li>--%>
            <%--<li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
            <%--</ol>--%>
            <!-- 轮播图的轮播图片 -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <%--商品照片--%>
                    <img src="${pageContext.request.contextPath}/${product.pimage}"
                         style="width: 400px;height: 400px;position: relative;left: 30px;top:20px">
                    <div class="carousel-caption">
                        <!-- 轮播图上的文字 -->
                    </div>
                </div>
                <%--<div class="item">--%>
                <%--&lt;%&ndash;第一个二维码&ndash;%&gt;--%>
                <%--<img src="../img/商品信息详情/u147.png" style="width: 400px;height: 400px;position: relative;left: 30px">--%>
                <%--<div class="carousel-caption">--%>
                <%--<!-- 轮播图上的文字 -->--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="item">--%>
                <%--&lt;%&ndash;第二个二维码&ndash;%&gt;--%>
                <%--<img src="../img/商品信息详情/u147.png" style="width: 400px;height: 400px;position: relative;left: 30px">--%>
                <%--<div class="carousel-caption">--%>
                <%--<!-- 轮播图上的文字 -->--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>
            <!-- 上一张 下一张按钮 -->
        </div>
    </div>
    <%--<div style="width:50px;height: 400px;position: absolute;top:0;left:550px;">--%>
    <%--<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">--%>
    <%--<img src="../img/商品信息详情/u142.png" style="right:50px;"class="shangxia">--%>
    <%--</a>--%>
    <%--</div>--%>
    <div style="width:500px;height:400px;position: absolute;top: 0;left: 600px;margin:5px;">
        <div style="height: 15%;width: 100%;color:#333333;font-size: 20px;position: relative;top:20px">
            ${product.pname}
        </div>
        <hr>
        <div style="height: 20%;width: 100%;">
            <span style="font-size: 13px;color: #333333">市场价：</span><span
                style="font-size: 14px;color: #333333">¥${product.market_price}</span><br>
            <span style="font-size: 14px;color: #333333">商城价：</span><span
                style="font-size:36px;color: red">¥${product.shop_price}</span>
        </div>
        <div style="height: 20%;width: 100%;background-color: #F2F2F2;font-size: 14px;border: 1px solid #b9bac3">
            <span style="position: relative;top:10px;left:20px;">分类：</span><br>
            <span style="position: relative;top:10px;left:20px;">商家联系方式</span><br>
            <span style="position: relative;top:10px;left:20px;">商品编号：${product.pid}</span>
        </div>
        <div style="height: 45%;width: 100%;">
            <%--<span style="font-size: 14px;color: #333333">等不及？立即购买：--%>
            <%--<img src="../img/商品信息详情/u171.png" style="width: 30px;height: 30px" id="weixinzhifu">--%>
            <%--<img src="../img/商品信息详情/u147.png" class="erweima" hidden id="weixinzhifuerweima" style="left: 30px">--%>
            <%--<img src="../img/商品信息详情/u173.JPEG" style="width: 40px;height: 30px" id="zhifubaozhifu">--%>
            <%--<img src="../img/商品信息详情/u147.png" class="erweima" style="left: 150px" hidden id="zhifubaozhifuerweima">--%>
            </span>
            <p>购买数量：<input type="number" min="1" id="buyNum"></p>
            <button id="jiarugouwuche">
                <span> 加入购物车</span>
            </button>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
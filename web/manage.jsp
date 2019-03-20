<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的商品</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <%--使用字体图标--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <%--使用标签库--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%--导入JQuery、Bootstrap--%>
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <style type="text/css">
        html { overflow-x: hidden; overflow-y: auto; }
        /*#b1wodeshangpin{*/
            /*border:1px solid #0079FE;*/
            /*font-family: 微软雅黑;*/
            /*border-radius: 60px;*/
            /*font-size: 13px;*/
            /*color:#0079FE;*/
            /*position: relative;*/
            /*top:50px;*/
            /*left:200px;*/
        /*}*/
        #b2shangjiashangpin{
            border:1px solid #0079FE;
            font-family: 微软雅黑;
            border-radius: 60px;
            font-size: 13px;
            color:#0079FE;
            position: relative;
            top:50px;
            left:220px;
        }
        #wodeshangpinguanli{
            width:1300px;
            height:800px;
            position: relative;
            top:80px;
            left:150px;
            background-color: white;
            border: 0px ;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            $("#b1wodeshangpin").click(function () {
                $(this).css("border","1px solid #0079FE");
                $(this).css("color","#0079FE");
                $("#b2shangjiashangpin").css("border","1px solid #F2F2F2");
                $("#b2shangjiashangpin").css("color","#999999");
                $("iframe").attr('src','myItem.jsp');
            });
            $("#b2shangjiashangpin").click(function () {
                $(this).css("border","1px solid #0079FE");
                $(this).css("color","#0079FE");
                $("#b1wodeshangpin").css("border","1px solid #F2F2F2");
                $("#b1wodeshangpin").css("color","#999999");
                $("iframe").attr('src','addMyItem.jsp');
            });
        })
    </script>
</head>
<body>
<%@ include file="header.jsp"%>
<div style="position:relative;;background-color:#F2F2F2;height:700px;width:100%">
    <div style="position: relative;bottom:50px;left:230px">
        <%@ include file="addMyItem.jsp"%>
    </div>
</div>

<%--<div style="position:relative;;background-color:#F2F2F2;height:1000px;width:100%">--%>
    <%--<div>--%>
        <%--&lt;%&ndash;<button id="b1wodeshangpin">我的商品</button>&ndash;%&gt;--%>
        <%--<button id="b2shangjiashangpin">上架商品</button>--%>
    <%--</div>--%>
    <%--<div id="wodeshangpinguanli" style="overflow-x: hidden; overflow-y:hidden;" >--%>
        <%--<iframe src="addMyItem.jsp" width="1300" height="800" frameborder=0 id="myiframe"  scrolling="no"></iframe>--%>
    <%--</div>--%>
<%--</div>--%>
<%@ include file="footer.jsp"%>
</body>
</html>

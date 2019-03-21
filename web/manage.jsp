<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的商品</title>
    <link rel="icon" type="image/x-icon" href="img/IMG_20180912_161428.ico">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" type="text/css" href="css/manage.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/manage.js"></script>

</head>
<body>
<%@ include file="header.jsp"%>
<div id="manage_div1">
    <div id="manage_div2">
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

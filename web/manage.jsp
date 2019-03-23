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

</head>
<body>
<%@ include file="header.jsp" %>
<div id="manage_div1">
    <div id="manage_div2">
        <%@ include file="addMyItem.jsp" %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>
<html>
<head>
    <title>正在验证...</title>
</head>
<body>
<%
    String yzm = request.getParameter("yanzhengma");
    String temp = (String)session.getAttribute("rand");
    if(temp.equals(yzm)){
%>
<form action="${pageContext.request.contextPath}/user" method="post" name="form">
    <input type="hidden" name="method" value="login">
    <input type="hidden" name="username" value=<%= request.getParameter("username")%> >
    <input type="hidden" name="password" value=<%=request.getParameter("password")%> >
    <input type="hidden" name="savename" value=<%= request.getParameter("savename")%> >
    <input type="hidden" name="savepwd" value=<%=request.getParameter("savepwd")%> >
</form>
<script type="text/javascript">
    document.form.submit();
</script>
<%
    }
    else{
        String site = new String("LoginFail.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
</body>
</html>
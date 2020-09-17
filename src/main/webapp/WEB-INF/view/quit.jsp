<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ANA
  Date: 2020/9/17
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
</head>
<body>
<%
    if(session.getAttribute("teacher") != null){
        session.removeAttribute("teacher");
    }else if (session.getAttribute("manager") != null){
        session.removeAttribute("manager");
    }
    session.removeAttribute("loginUser");
    //销毁session
    session.invalidate();
%>
<c:redirect url="login"></c:redirect>
</body>
</html>

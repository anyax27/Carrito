<%-- 
    Document   : cerrarsesion
    Created on : 07-jun-2020, 16:54:31
    Author     : users
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%HttpSession objsesion = request.getSession(true);%>

<!DOCTYPE html>
<html>
    <head>
        <script src="js/proteger.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:forward page="index.jsp"/>
    </body>
</html>

<%-- 
    Document   : logout
    Created on : Jul 15, 2014, 2:37:33 PM
    Author     : Jainendra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="img/favicon.ico">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         session.invalidate();
         
          String site = new String("login.jsp");
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", site); 
         
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Expires","0");
        response.setDateHeader("Expires",-1);
         
         
      
 %>
    </body>
</html>

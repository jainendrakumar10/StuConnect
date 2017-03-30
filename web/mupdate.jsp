<%-- 
    Document   : mupdate
    Created on : Jul 17, 2014, 11:21:24 AM
    Author     : Jainendra
--%>

<%@page import="java.sql.*;" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
         String s2=request.getParameter("t2");
         String s3=request.getParameter("t3");
         String s1=(String)session.getAttribute("username");
          try
          {
             Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
            PreparedStatement ps=con.prepareStatement("insert into inbox (uname,sub,message,date) values(?,?,?,NOW())");
            ps.setString(1,s1.trim());
            ps.setString(2,s2.trim());
            ps.setString(3,s3.trim());
            int i=ps.executeUpdate();
             if(i>0)
              {
                
                   String site = new String("About.jsp");
                   response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
             }
           }
          catch(Exception ex)
            {
              ex.printStackTrace();
            }
          finally
        {
            out.close();
        }
        
        %>
        
    </body>
</html>

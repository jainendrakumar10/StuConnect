<%-- 
    Document   : registerupdate
    Created on : Jul 6, 2014, 4:11:46 PM
    Author     : Jainendra
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
         String s1=request.getParameter("t3");
        String s2=request.getParameter("t4");
        String s3=request.getParameter("t5");
        String s4=request.getParameter("t6");
        String s5=request.getParameter("t7");
        String s6=request.getParameter("t8");
        String s7=request.getParameter("t9");
        String s8=request.getParameter("t10");
        try
                               {
             Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
            PreparedStatement ps=con.prepareStatement("insert into user (Name,EnrollmentNo,Email,Age,Address,Username,Paassword,RePassword,joined) values(?,?,?,?,?,?,?,?,NOW())");
            ps.setString(1,s1.trim());
            ps.setString(2,s2.trim());
            ps.setString(3,s3.trim());
            ps.setString(4,s4.trim());
            ps.setString(5,s5.trim());
            ps.setString(6,s6.trim());
            ps.setString(7,s7.trim());
            ps.setString(8,s8.trim());
            int i=ps.executeUpdate();
            if(i>0 && (s7.compareTo(s8)==0))
            {
                
                
                
                 String site = new String("login.jsp");
                 response.setStatus(response.SC_MOVED_TEMPORARILY);
                 response.setHeader("Location", site); %>
                 <script>alert("Registration done,Login to continue");</script>
                
           <%     
            }
            else
            {
                out.println("<h3>Registration not done</h3>");
            }
        }
        catch(Exception ex)
        {
            out.println(ex.toString());
        }
        finally
        {
            out.close();
        }
        
        %>
    </body>
</html>

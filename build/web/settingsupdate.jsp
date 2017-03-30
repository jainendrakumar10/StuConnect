<%-- 
    Document   : settingsupdate
    Created on : Jul 31, 2014, 12:18:10 PM
    Author     : Jainendra
--%>
<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String s8=(String)session.getAttribute("ub");
        out.println(s8);
        
        
         String s1=request.getParameter("t1");
        String s2=request.getParameter("t2");
        String s3=request.getParameter("t3");
        String s4=request.getParameter("t4");
        String s5=request.getParameter("t5");
        String s6=request.getParameter("t6");
        String s7=request.getParameter("t7");
         
        
         
         try {
              Class.forName("com.mysql.jdbc.Driver");
              Connection con=DriverManager.getConnection("jdbc:mysql://localhost/forumproject","root","sys");
              PreparedStatement ps=con.prepareStatement("update user set Name=?,EnrollmentNo=?, Email=?, Age=?, Address=?,Paassword=?,RePassword=? where Username=?");
              ps.setString(1,s1.trim());
              ps.setString(2,s2.trim());
            
              ps.setString(3,s3.trim());
              ps.setInt(4,Integer.valueOf(s4));
              ps.setString(5,s5.trim());
              ps.setString(6,s6.trim());
              ps.setString(7,s7.trim());
               ps.setString(8,s8.trim());
               
               out.println("hello1");
              int i=ps.executeUpdate();
              out.println("hello");
              
             
              if(i>0)
              {
                  
                  String site = new String("Profile.jsp?u="+s8.trim()+"");
                  response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
                  
                  
              }
             
            }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
       
        
        %>
    </body>
</html>

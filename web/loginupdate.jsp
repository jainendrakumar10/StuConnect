<%-- 
    Document   : loginupdate
    Created on : Jul 6, 2014, 4:38:24 PM
    Author     : Jainendra
--%>

<%@page import="java.sql.*,java.io.*,java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String s1=request.getParameter("t1");
        String s2=request.getParameter("t2");
        try 
        {
         
           Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
           System.out.println("Successful Connection");
           
           PreparedStatement ps;
           ps=con.prepareStatement("Select Paassword from user where Username=?");
           ps.setString(1, s1.trim());
           ResultSet res=ps.executeQuery();
           if(res.next())
           {
               String s3=res.getString(1);
               s2=s2.trim();
               s3=s3.trim();
               if(s3.equals(s2)&& (!s1.equals("admin")))
               {
                   
                   String site = new String("home.jsp");
                   session.setAttribute("username",s1);

                   response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
               }
               else if(s3.equals(s2)&& (s1.equals("admin")))
                 { 
                    String site = new String("home2.jsp");
                   session.setAttribute("username",s1);

                   response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
                 }
               
               
               else
               {
                   out.println("<h3>Invalid Password</h3>");
               }
           }
           else
           {
               out.println("<h3>Invalid User ID</h3>");
           }
           con.close();
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

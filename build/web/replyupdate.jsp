<%-- 
    Document   : replyupdate
    Created on : Jul 11, 2014, 10:34:45 PM
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
        <h1></h1>
        <% String reply=request.getParameter("textarea");
        String s3=(String)session.getAttribute("username");
        String s4=(String)session.getAttribute("rid");
         
       
        
                   
                   
                   try
                       {
                    
             Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
                      
          PreparedStatement ps2=con.prepareStatement("insert into reply (textid,answer,uname,dt) values(?,?,?,NOW())");
           ps2.setInt(1,Integer.valueOf(s4));
            ps2.setString(2,reply);
            ps2.setString(3,s3.trim());
            int i=ps2.executeUpdate();
            if(i>0)
            {
                 String site = new String("replythreads.jsp?t="+s4+"");
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

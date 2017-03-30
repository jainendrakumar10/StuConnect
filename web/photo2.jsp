<%-- 
    Document   : ret
    Created on : Jul 30, 2014, 11:23:57 AM
    Author     : Jainendra
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.awt.Toolkit"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.*;" import="java.io.*;" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Image</h1>
        <%
       
        String s3=request.getParameter("u");
         String imgLen = "";
         
        
         Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps1;
       ps1=con.prepareStatement("Select dp from user where Username=?");
       ps1.setString(1,s3.trim());
       ResultSet res2=ps1.executeQuery();
       if(res2.next())
         {
                    imgLen = res2.getString(1);  
                    System.out.println(imgLen.length());  
                    int len = imgLen.length();  
                    byte[] rb = new byte[len];  
                    InputStream readImg = res2.getBinaryStream(1);  
                    int index = readImg.read(rb, 0, len);  
                    System.out.println("Index.........." + index);  
  
                    response.reset();  
                    response.setContentType("image/jpg"); 
                    out.println("<tr>");
                    out.println("<td>");
                    response.getOutputStream().write(rb, 0, len);  
                    response.getOutputStream().flush(); 
                    
                      out.println("</td>");
                    out.println("</tr>");

               
               }
              out.println("</table>");
       %>
    </body>
</html>

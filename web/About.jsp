<%--
    Document   : Register Update
    Created on : Jul 8, 2014, 8:44:05 PM
    Author     : Shourya Raizada
--%>

<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        .right {
    
    float: right;
}
    </style>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
     
    <%
    String s3=(String)session.getAttribute("username");
   Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps1;
       ps1=con.prepareStatement("Select Name from user where Username=?");
       ps1.setString(1,s3.trim());
       ResultSet res2=ps1.executeQuery();
   %>
<div id="page_wrapper">
  <div id="header_wrapper">
    <div id="header">
      <h1>Stu<font color="#FFDF8C">Connect</font></h1><br>
      <h2><div style="color:white">A complete web forum for <font color="#FFDF8C">students</font></h2>
      <a class="right" href="logout.jsp"><font color=#FFFFFF>Logout</font></a>
       <%       if(res2.next())
        {
           out.println("<a class=right><font color=#FFFFFF>Welcome "+res2.getString(1)+"&nbsp;&nbsp;|&nbsp;</font></a>");
        } %>
    </div>
    <div id="navcontainer">
      <ul id="navlist">
        <% if(!s3.equals("admin"))
               { %>
                <li><a href="home.jsp">Home</a></li>
               <% }
             else
                { %>  
                  <li><a href="home2.jsp">Home</a></li>
               <% } %>  
        <li id="active"><a href="About.jsp" id="current">About Us</a></li>
        <li><a href="index.jsp">Topics</a></li>
        <li><a href="members.jsp">Members</a></li>
        <li><a href="Profile.jsp?u=<%=s3%>">Profile</a></li>
               

      </ul>
    </div>
  </div>
  <div id="content">
      <h1 style="color:fuchsia">Welcome To The Student Forum</h1>
        <p>
        The <b>Student Forum</b> is a dynamic website made solely by, <strong>Mr.Jainendra Kumar</strong>.The idea behind this forum is to come up with a website that provides students and faculty a platform to communicate,Interact,perform Voting.</p>
        <HR>
            <div style="text-align:left">
        <h3>Contact Us</h3><BR>
        <form action="mupdate.jsp">
        
        <p>
            
            <b>Mobile</b>&nbsp;:&nbsp;9818025654<BR>
            <b>Email</b>&nbsp;:&nbsp;jainendrakumar10@yahoo.com<BR>
            <p>
                <b>Subject</b>&nbsp;:&nbsp;<br><input type="text" name="t2" value="" size="39" /><BR><br>
                <b>Message</b>&nbsp;(You may use these HTML tags and attributes:)<BR>
            <textarea name="t3" rows="5" cols="38">
            </textarea>
            <input type="submit" value="Send"/>
            </p>

            
          
        </p>
       </form>
  </div>
  </div>
      <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>  
  </body>
    </html>
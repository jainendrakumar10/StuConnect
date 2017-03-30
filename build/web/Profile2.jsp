<%-- 
    Document   : Profile
    Created on : Jul 6, 2014, 10:50:28 PM
    Author     : Jainendra
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
          String s4=(String)session.getAttribute("username");
            String s3=request.getParameter("u");
   
     Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps2;
       ps2=con.prepareStatement("Select Name from user where Username=?");
       ps2.setString(1,s4.trim());
       ResultSet res2=ps2.executeQuery();
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
        <li><a href="About.jsp">About Us</a></li>
        <li ><a href="index.jsp">Topics</a></li>
        <li><a href="members.jsp">Members</a></li>
       <li><a href="Profile.jsp?u=<%=s4%>">Profile</a></li> 
      
      </ul>
    </div>
  </div>
  
  <div id="right_side">
        <form action="searchupdate.jsp">
      
   <input type="text" name="t1" value="" /><input type="submit" value="Search" />
    </form> 
    <h3><img src="img/news-icon.gif" width="20" height="20" alt="news-icon"/>&nbsp;&nbsp;News</h3>
    <p><a href="http://mashable.com/2014/07/02/world-cup-day-20-roundup-recap/" target="_blank">-What matters more than winning World Cup</a> </p>
    <p><a href="http://mashable.com/2014/07/01/united-states-internet-speed-lags/" target="_blank">-Internet Connection Speeds Are Up Globally, Lag in the U.S.</a>
    <p><a href="http://mashable.com/2014/07/01/oculus-rift-hack/" target="_blank">-Oculus Rift Hack Lets You Live Real Life Like a Video Game</a></p>
    <p><a href="http://mashable.com/2014/07/01/nasa-robot-astronaut/" target="_blank">-NASA's Human-like Space Robot Pays Dividends on Earth</a></p>
    <p><a href="http://in.reuters.com/article/2014/07/01/us-google-songza-idINKBN0F65M620140701" target="_blank">-Google buys music streaming service Songza</a></p>
   
   
   
    
   
  </div>
       
       
         <div id="content">
        <% 
        byte[ ] imgData = null ;
        
        
               
        try
                               {
            
           PreparedStatement ps;
           ps=con.prepareStatement("Select Name,EnrollmentNo,Email,Age,Address,Username,dp from user where Username=?");
           ps.setString(1, s3.trim());
           ResultSet res=ps.executeQuery();
           if(res.next())
                             {  %>
               <h3><%=res.getString(1)%>'s profile </h3><br>
         <% 
               out.println("<img src='" +"photo2.jsp?u="+s3+""+"' style='width:90px; height:90px;'/>");
                 out.println("<table cellspacing=20 cellpadding=20>");
           
           out.println("<tbody>");
            out.println("<tr>");
           out.println("<td><b>Username</b></td>");
           out.println("<td>"+res.getString(6)+"</td>"); 
           out.println("</tr>");  
           out.println("<tr>");
           out.println("<td><b>Name</b></td>");
           out.println("<td>"+res.getString(1)+"</td>");
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Enrollment Number</b></td>");
           out.println("<td>"+res.getString(2)+"</td>"); 
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Email</b></td>");
           out.println("<td>"+res.getString(3)+"</td>"); 
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Age</b></td>");
           out.println("<td>"+res.getString(4)+"</td>"); 
           out.println("</tr>");
           
           out.println("<tr>");
           out.println("<td><b>Address</b></td>");
           out.println("<td>"+res.getString(5)+"</td>"); 
           out.println("</tr>");
           
          
          out.println("</tbody>");
           out.println("</table>");  
                     }
                       

        }
        catch(Exception ex)
                               {
            ex.printStackTrace();
                       }
        %>
         </div>
  </div>
          <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>  
    </body>     
</html>

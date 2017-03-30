<%-- 
    Document   : showThread
    Created on : Jul 11, 2014, 4:24:17 PM
    Author     : Jainendra
--%>
<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>
<head>
     <style>
        .right {
    
    float: right;
}
    </style>
<title>Student Forum</title>
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
        <li><a href="About.jsp">About Us</a></li>
        <li id="active"><a href="index.jsp" >Topics</a></li>
        <li><a href="members.jsp">Members</a></li>
       <li><a href="Profile.jsp?u=<%=s3%>">Profile</a></li> 
              

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
                       String sc=request.getParameter("tid");
            out.println("<table border=1 bordercolor=#FFFFFF cellspacing=0 cellpadding=10 width=1150 bgcolor=#E0F3F5>");
                    out.println("<tr>");
                   out.println("<th bgcolor=#4169E1><font color=#FFFFFF><img src=img/post_it.png width=30 height=30 alt=post_it align=center/>&nbsp;&nbsp;Thread</font></th>");
                   out.println("<th bgcolor=#4169E1><font color=#FFFFFF><img  src = img/user.png width = 30 height = 30 alt = user align=center />&nbsp;&nbsp;User</font></th>");
                   out.println("<th bgcolor=#4169E1><font color=#FFFFFF><img src=img/clock.png width=30 height=30 alt=cloc align=center />&nbsp;&nbsp;Date and time</font></th>");
                    out.println("</tr><br>");
                   
        try
                               {
         
               PreparedStatement ps;
                ps=con.prepareStatement("Select tid,text,Username,DATE_FORMAT(dp,'%b %d %Y %h:%i %p') from subthread where subcode=?");
                ps.setInt(1,Integer.valueOf(sc));
                 ResultSet res=ps.executeQuery();
               while(res.next())
                                     {
                   int tid=res.getInt(1);
                   
                  // session.setAttribute("thid",tid);
                   
                   out.println("<tr>");
                
                 

                   
                   out.println("<td width=600>  <img  src = img/page_icon.png width = 25 height = 25 alt = page_icon />&nbsp;&nbsp;<a href=replythreads.jsp?t="+tid+">"+res.getString(2)+"<a/></td>");
                  // out.println("<td>"+res.getString(3)+"</td>");
                   out.println("<td width=275><a href=Profile2.jsp?u="+res.getString(3)+">"+res.getString(3)+"</a></td>");
                   out.println("<td width=275>"+res.getString(4)+"</td>");
                      
                   
                   out.println("</tr>");
                   
               }
               out.println("</table>");
               
                     }
        catch(Exception ee)
                               {
            ee.printStackTrace();
                       }
        %>
      </div>
  </div>
      <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>
    </body>
</html>

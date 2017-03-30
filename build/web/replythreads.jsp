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
       PreparedStatement ps2;
       ps2=con.prepareStatement("Select Name from user where Username=?");
       ps2.setString(1,s3.trim());
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
        <li id="active"><a href="index.jsp"id="current" >Topics</a></li>
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
        
        <h1></h1>
       
        <form action="replyupdate.jsp">
       <% 
         
      // int tid=(Integer)session.getAttribute("thid");
         String tid=request.getParameter("t");
          
          session.setAttribute("rid",tid);
          
          
           try
                     {
                           
           
           
           PreparedStatement ps;
            ps=con.prepareStatement("Select text from subthread where tid=?"); 
           ps.setInt(1,Integer.valueOf(tid));
            ResultSet res=ps.executeQuery();
            

              while(res.next())
               { 
                   String q=res.getString(1);
          out.println("<table border=1 bordercolor=#FFFFFF cellspacing=0 cellpadding=10 width=1125 bgcolor=#E0F3F5>"); 
          out.println("<tr>");
          out.println("<th bgcolor=#4169E1 width=337.5><img  src = img/user.png width = 40 height = 40 alt = user align=center />&nbsp;&nbsp;<font color=#FFFFFF>User info</font></th>"); 
                                                                     
          out.println("<th bgcolor=#4169E1 width=787.5> <img  src = img/ask.png width = 60 height = 60 alt = page_icon />&nbsp;&nbsp;<font color=#FFFFFF>"+q+"</font></th>");
          out.println("</tr>");
          out.println("<table>");
          
                    
           PreparedStatement ps1;
            ps1=con.prepareStatement("Select uname,DATE_FORMAT(dt,'%b %d %Y %h:%i %p'),answer from reply where textid=?"); 
           ps1.setInt(1,Integer.valueOf(tid));
            ResultSet res1=ps1.executeQuery();
              while(res1.next())
               { 
                   String un=res1.getString(1);
                   String dt=res1.getString(2);
                   String ans=res1.getString(3);
            out.println("<table border=1 bordercolor=#FFFFFF cellspacing=0 cellpadding=10 width=1125 bgcolor=#E0F3F5>"); 
            out.println("<tr>");
            out.println("<td width=337.5><a href=Profile2.jsp?u="+un+">"+un+"</a><br>");
            out.println(dt+"</td><br>");
            out.println("<td width=787.5><img  src = img/answer.png width = 40 height = 40 alt = user align=center />&nbsp;&nbsp;"+ans+"</td><br>");
            out.println("</tr>");
            out.println("<table>");
                }
              }
           }
            catch(Exception ex)
             {
                ex.printStackTrace();
             }
          
          
          
              %>
              <br><br><h3>Enter Response here</h3>&nbsp;You may use these HTML tags and attributes:<br> 
          <textarea  name = textarea rows = 15 cols = 70></textarea><br>
         
          
          <input  type = submit value =Reply>
          
          </form>
       
       
        </div>
  </div>
      <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>
    </body>
</html>

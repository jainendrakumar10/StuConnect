
<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico">
</head>
<body>
    <style>
        .right {
    
    float: right;
}
    </style>
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
        <li><a href="home.jsp" >Home</a></li>
        <li><a href="About.jsp">About Us</a></li>
        <li><a href="index.jsp" >Topics</a></li>
        <li id="active"><a href="members.jsp" id="current">Members</a></li>
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
   
   
    <form action="homeupdate.jsp">
        
        <h3><img src="img/poll (1).png" width="20" height="20" alt="poll (1)"/>Today's Poll</h3>
          <table>
              
            <tbody>
                <tr>
                    <td>Govt says it has a right to be consulted on appointment of judges.</td>
                </tr>
                <tr>
                    <td><input type="radio" name="g1" value="yes" />Agree</td>
                </tr>
                <tr>
                    <td><input type="radio" name="g1" value="No" />Disagree</td>
                </tr>
                <tr>
                    <td><input type="radio" name="g1" value="dotno" />Can't say</td>
                </tr>
                <tr>
                    <td><input type="submit" value="Vote" /></td>
                </tr>
            </tbody>
        </table>

  </form>
    
   
  </div>
  
    
    <div id="content">
     <% 
        out.println("<table border=1 bordercolor=#FFFFFF cellspacing=20 width=1145  bgcolor=#E0F3F5>");
        out.println("<tr>");
        out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Name</font></th>");
        out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Email</font></th>");
        out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Age</font></th>");
      
        out.println("</tr>");      
       PreparedStatement ps2;
       ps2=con.prepareStatement("Select Name,Email,Age from user");
       ResultSet res1=ps2.executeQuery();
        while(res1.next())
         {
                  
                   out.println("<tr>");
                   out.println("<td align=center>"+res1.getString(1)+"</td>");
                   out.println("<td align=left>"+res1.getString(2)+"</td>");
                   out.println("<td align=center>"+res1.getInt(3)+"</td>");
                  
                   out.println("</tr>");
                   
                   
         }
       out.println("</table>");
       %> 
  </div>
    
    <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>
  </div>
  </body>
</html>


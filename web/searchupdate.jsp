
<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
 <style>
        .right {
    
    float: right;
}
    </style>
</head>
<body>
   
    <%
    String s3=(String)session.getAttribute("username");%>
<div id="page_wrapper">
  <div id="header_wrapper">
      
    <div id="header">
       <h1>Stu<font color="#FFDF8C">Connect</font></h1><br>
       
      <h2><font color="#FFFFFF">A complete web forum for</font> <font color="#FFDF8C">students</font></h2>
      <a class="right" href="logout.jsp"><font color=#FFFFFF>Logout</font></a>
    </div>
    <div id="navcontainer">
      <ul id="navlist">
        <li><a href="home.jsp" id="current">Home</a></li>
        <li><a href="About.jsp">About Us</a></li>
        <li id="active"><a href="index.jsp" >Topics</a></li>
        <li><a href="">FAQ</a></li>
       <li><a href="Profile.jsp?u=<%=s3%>">Profile</a></li> 
       </ul>
    </div>
     
  </div>
     

  
  <div id="right_side">
        <form action="searchupdate.jsp">
      
   <input type="text" name="t1" value="" /><input type="submit" value="Search" />
    </form> 
    <h3>News</h3>
    <p><a href="http://mashable.com/2014/07/02/world-cup-day-20-roundup-recap/" target="_blank">-What matters more than winning World Cup</a> </p>
    <p><a href="http://mashable.com/2014/07/01/united-states-internet-speed-lags/" target="_blank">-Internet Connection Speeds Are Up Globally, Lag in the U.S.</a>
    <p><a href="http://mashable.com/2014/07/01/oculus-rift-hack/" target="_blank">-Oculus Rift Hack Lets You Live Real Life Like a Video Game</a></p>
    <p><a href="http://mashable.com/2014/07/01/nasa-robot-astronaut/" target="_blank">-NASA's Human-like Space Robot Pays Dividends on Earth</a></p>
    <p><a href="http://in.reuters.com/article/2014/07/01/us-google-songza-idINKBN0F65M620140701" target="_blank">-Google buys music streaming service Songza</a></p>
   
   
    <form action="homeupdate.jsp">
        
        <h3>Today's Poll</h3>
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
            String s1=request.getParameter("t1");
            out.println("<table border=1 bordercolor=#FFFFFF cellspacing=0 cellpadding=10 width=1100  bgcolor=#E0F3F5>");
                    out.println("<tr>");
                   
                   out.println("<th bordercolor=#FFFFFF bgcolor=#4169E1><font color=#FFFFFF>Text</font></th>");
                   out.println("<th bordercolor=#FFFFFF bgcolor=#4169E1><font color=#FFFFFF>Username</font></th>");
                   out.println("<th bordercolor=#FFFFFF bgcolor=#4169E1><font color=#FFFFFF>Date and Time</font></th>");
                 
                   out.println("</tr>");
                   
        try
          {
            String strq="select tid,text,Username,DATE_FORMAT(dp,'%b %d %Y %h:%i %p') FROM subthread where text like '%"+s1+"%'";
          Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
             
                Statement ps;
                ps=con.createStatement();
                ResultSet res=ps.executeQuery(strq);
                
              
              
                 
               while(res.next())
                 {
                  int tid=res.getInt(1);
                   out.println("<tr>");
                   out.println("<td bordercolor=#FFFFFF align=left><a href=replythreads.jsp?t="+tid+">"+res.getString(2)+"<a/></td>");
                   out.println("<td bordercolor=#FFFFFF align=left><a href=Profile.jsp?u="+res.getString(3)+">"+res.getString(3)+"</td>");
                   out.println("<td bordercolor=#FFFFFF align=left>"+res.getString(4)+"</td>");
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

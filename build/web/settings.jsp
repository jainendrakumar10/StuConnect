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
</head>
    <body>
        
        
        <%
          //String s3=(String)session.getAttribute("username");
            String s3=request.getParameter("u");
             session.setAttribute("ub",s3);
   
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
       <a class="right"><font color=#FFFFFF>Settings&nbsp;&nbsp;|&nbsp;</font></a>
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
        <li><a href="">Members</a></li>
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
   
   
   
    
   
  </div>
       
       
         <div id="content">
        <% 
        
        
        
               
        try
                               {
            
           PreparedStatement ps;
           ps=con.prepareStatement("Select Name,EnrollmentNo,Email,Age,Address,Username,Paassword,RePassword from user where Username=?");
           ps.setString(1, s3.trim());
           ResultSet res=ps.executeQuery();
           if(res.next())
                             {  %>
                             <h3>Change your settings&nbsp;<%=res.getString(1)%></h3><br>
        
               <form action="settingsupdate.jsp">
               
         <%  
        String n=res.getString(1).trim();
       
         
         
         out.println("<table cellspacing=20 cellpadding=20>");
           
           out.println("<tbody>");
           
             out.println("<tr>");
           out.println("<td><b>Username</b></td>");
           out.println("<td>"+res.getString(6).trim()+"</td>"); 
           out.println("</tr>"); 

           out.println("<tr>");
           out.println("<td><b>Name</b></td>");
           out.println("<td><input type=text name=t1 value="+res.getString(1).trim()+" /></td>");
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Enrollment Number</b></td>");
           out.println("<td><input type=text name=t2 value="+res.getString(2).trim()+" /></td>"); 
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Email</b></td>");
           out.println("<td><input type=text name=t3 value="+res.getString(3).trim()+" /></td>"); 
           out.println("</tr>");
           out.println("<tr>");
           out.println("<td><b>Age</b></td>");
           out.println("<td><input type=text name=t4 value="+res.getString(4).trim()+" /></td>"); 
           out.println("</tr>");
           
           out.println("<tr>");
           out.println("<td><b>Address</b></td>");
           out.println("<td><textarea name=t5 rows=4 cols=20 >"+res.getString(5).trim()+"</textarea ></td>"); 
           out.println("</tr>");
           
           out.println("<tr>");
           out.println("<td><b>Password</b></td>");
           out.println("<td><input type=password name=t6 value="+res.getString(7).trim()+" /></td>"); 
           out.println("</tr>");
           
            out.println("<tr>");
           out.println("<td><b> Re-enterPassword</b></td>");
           out.println("<td><input type=password name=t7 value="+res.getString(8).trim()+" /></td>"); 
           out.println("</tr>");

            out.println("<tr>");
           out.println("<td><input type=submit value=Save name=b1 /></td>"); 
           out.println("</tr>");                     
                               
          out.println("</tbody>");
           out.println("</table>");  
                     }%>
           </form>            

       <% }
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

<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico">
<style>
        .right {
    
    float: right;
}
    </style>
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
                  <li id="active"><a href="home2.jsp" id="current">Home</a></li>
               <% } %>  
        <li><a href="About.jsp">About Us</a></li>
        <li><a href="index.jsp" >Topics</a></li>
        <li><a href="members.jsp">Members</a></li>
       <li><a href="Profile.jsp?u=<%=s3%>">Profile</a></li> 
       
       
      </ul>
    </div>
     
  </div>
     

  
  <div id="right_side">
        <form action="searchupdate.jsp">
      
   <input type="text" name="t1" value="" /><input type="submit" value="Search" />
    </form> 
      <a href="inbox.jsp"><img src="img/mail-icon.png" width="20" height="20" alt="mail-icon"/>&nbsp;&nbsp;Inbox</a>
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
        <h3><img src="img/forum-icon.png" width="30" height="30" alt="forum-icon"/>&nbsp;&nbsp;Welcome to the student forum</h3>
        <p>Welcome to StuConnect!
It is a thriving free student discussion forum, if you can think of a topic there will be somewhere for you to discuss it here.</p>
        <p>The site welcomes people from any stage of education. You can read and post messages in any of our forums free of charge. We only ask that you register (which will take a few seconds.) Once you have done this you can join in any existing discussions, start your own and contribute to the ever-growing array of resources and information for students.</p>
        <h3><img src="img/forum-icon.png" width="30" height="30" alt="forum-icon"/>&nbsp;&nbsp;Why should I register?</h3>
        <p>First of all, registration is completely free. Registration is quick and simple, and only by registering can you get the complete forum experience. Registering with TSR enables you to: 

Interact with other members, by starting new discussions, taking part in existing ones and using the Private Message system
Access our brilliant learning tools, including an interactive revision timetable, library of assignments and coursework.
And much, much more!
</p>
<h3><img src="img/forum-icon.png" width="30" height="30" alt="forum-icon"/>&nbsp;&nbsp;What's a thread/sticky/sub? etc - The forum Glossary</h3>


<p><b>What's a thread?</b><br>
On the forums, a 'thread' is the name given to a topic of discussion, into which members' comments are made. The title of a thread should make it clear what that discussion is about.<br>
<b>What's a post?</b> <br>
A 'post' is the name given to each individual comment made in threads by TSR members.<br>
<b>What's a sticky? </b><br>
A 'sticky' is a thread that is literally 'stuck' at the top of the forum by the Moderators. Usually it will be a reference thread, or large discussion thread that prevents the forum being clogged up by lots of smaller threads with the same topic of discussion.<br>
<b>What's a sub?</b> <br>
A 'sub' can either refer to a 'subscriber', a member who pays to subscribe to the website in order to access other forums and features not available to ordinary members, or a ?subscription?, which is the name of paid package that subscribers have purchased. Click here for more information regarding subscriptions on TSR.</p>
        <br><br>
          <%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* First visit */
       hitsCount = 1;
    }else{
       /* return visit */
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>
<center><p>Total number of visits: <%= hitsCount%></p></center>
        
  </div>
    
    <div id="footer">
        <p>Created By:Jainendra Kumar,Sharda University</p>
      
    </div>
  </body>
</html>

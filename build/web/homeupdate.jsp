

<!DOCTYPE>

<head>
     <style>
        .right {
    
    float: right;
}
    </style>
<title>Student Forum</title>
<%@page  import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
   
    <%
    String s3=(String)session.getAttribute("username");
     Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps4;
       ps4=con.prepareStatement("Select Name from user where Username=?");
       ps4.setString(1,s3.trim());
       ResultSet res4=ps4.executeQuery();
    %>
<div id="page_wrapper">
  <div id="header_wrapper">
      
    <div id="header">
       <h1>Stu<font color="#FFDF8C">Connect</font></h1><br>
      <h2><div style="color:white">A complete web forum for <font color="#FFDF8C">students</font></h2>
      <a class="right" href="logout.jsp"><font color=#FFFFFF>Logout</font></a>
      
       <%       if(res4.next())
        {
           out.println("<p><font color=#FFFFFF>Welcome "+res4.getString(1)+"</font></p>");
        } %>
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
       <input type="text" name="t1" value="" /><input type="submit" value="Search" />
    <h3>News</h3>
    <p><a href="http://mashable.com/2014/07/02/world-cup-day-20-roundup-recap/" target="_blank">-What matters more than winning World Cup</a> </p>
    <p><a href="http://mashable.com/2014/07/01/united-states-internet-speed-lags/" target="_blank">-Internet Connection Speeds Are Up Globally, Lag in the U.S.</a>
    <p><a href="http://mashable.com/2014/07/01/oculus-rift-hack/" target="_blank">-Oculus Rift Hack Lets You Live Real Life Like a Video Game</a></p>
    <p><a href="http://mashable.com/2014/07/01/nasa-robot-astronaut/" target="_blank">-NASA's Human-like Space Robot Pays Dividends on Earth</a></p>
    <p><a href="http://in.reuters.com/article/2014/07/01/us-google-songza-idINKBN0F65M620140701" target="_blank">-Google buys music streaming service Songza</a></p>
   
   
    
        
        <h3>Today's Poll</h3>
          
                
               <%
             String str=request.getParameter("g1");
             
             int ans1=0;
             int ans2=0;
             int ans3=0;
             int qid=0;

try
{            
            
             
             PreparedStatement ps;
             ps=con.prepareStatement("Select * from checkvote where uname=?");
             ps.setString(1,s3.trim());
             ResultSet res1=ps.executeQuery();
             if(!res1.next())
              {  
                     PreparedStatement ps2=con.prepareStatement("insert into checkvote values(?)");
                     ps2.setString(1,s3.trim());
                     ps2.executeUpdate();
            
              
             Statement st2=con.createStatement();
             ResultSet res=st2.executeQuery("Select * from vote");
             if(res.next())
                                 {
                 qid=res.getInt(1);
                 String ques=res.getString(2);
                 
                 ans1=res.getInt(3);
                 ans2=res.getInt(4);
                 ans3=res.getInt(5);
                      }
             
             if(str.equals("yes"))
                 ans1++;
             
             if(str.equals("No"))
                 ans2++;
             
             if(str.equals("dotno"))
                 ans3++;
             

             PreparedStatement ps3=con.prepareStatement("update vote set ans_yes=?,ans_no=?,ans_dotno=? where qid=?");
             ps3.setInt(1,ans1);
             ps3.setInt(2,ans2);
             ps3.setInt(3,ans3);
             ps3.setInt(4,qid);
             ps3.executeUpdate();
             out.println("<b>Vote Counted</b><br><br>");
             }  
              else
                {
               out.println("<b>You have already voted</b>");
                }
                
                PreparedStatement ps5;
                 ps5=con.prepareStatement("Select * from vote");
                 ResultSet res5=ps5.executeQuery();
                 if(res5.next())
                   {
                    int qit=res5.getInt(1);
                                      
                    
                    String ques=res5.getString(2);
                    out.println(ques+"<br><br>");
                    int ans4=res5.getInt(3);
                    int ans5=res5.getInt(4);
                    int ans6=res5.getInt(5);
                    int total=ans4+ans5+ans6;
                    float per1=(ans4*100)/total;
                   
                    for(int i1=0;i1<=per1/2;i1++)
                     {
                        out.print("<img src=g.png title="+per1+">");
                      }
                    out.println(per1+"&nbsp% &nbspAgree<br>");
                    float per2=(ans5*100)/total;
                    for(int j=0;j<=per2/2;j++)
                        {
                             out.print("<img src=g.png title="+per2+">");
                           }
                    out.println(per2+"&nbsp% &nbspDisagree<br>");
                    float per3=(ans6*100)/total;
                    for(int k=0;k<=per3/2;k++)
                    {
                        out.print("<img src=g.png title="+per3+">");
                    }
                    out.println(per3+"&nbsp% &nbspCan't say<br><br>");
                  
                   out.println("<b>Total votes:"+total+"</b>");
                 }
                   
            
          }
      
             catch(Exception ex)
               {
                  ex.printStackTrace();
                }


        %>
            

  
    
   
  </div>
  
    
    <div id="content">
        <h3>Welcome to the student forum</h3>
        <p>Welcome to The Student Room!
It is a thriving free student discussion forum, if you can think of a topic there will be somewhere for you to discuss it here.</p>
        <p>The site welcomes people from any stage of education. You can read and post messages in any of our forums free of charge. We only ask that you register (which will take a few seconds.) Once you have done this you can join in any existing discussions, start your own and contribute to the ever-growing array of resources and information for students.</p>
        <h3>Why should I register?</h3>
        <p>First of all, registration is completely free. Registration is quick and simple, and only by registering can you get the complete forum experience. Registering with TSR enables you to: 

Interact with other members, by starting new discussions, taking part in existing ones and using the Private Message system
Access our brilliant learning tools, including an interactive revision timetable, library of assignments and coursework.
And much, much more!
</p>
<h3>What's a thread/sticky/sub? etc - The forum Glossary</h3>
<p>TSR has a number of terms for specific things that some new members may struggle to understand. To prevent the need to ask about them, we've provided a Glossary of TSR terms to help you out. Below are the basics, but for a more in depth list of terms and definitions, see the TSR Glossary on the Wiki.</p>

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
</div>

  </body>
</html>

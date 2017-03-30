
<%@page import="java.sql.*;"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>

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
        if(s3.equals("null"))
               {
            String site=new String("login.jsp");
            response.setStatus(response.SC_MOVED_PERMANENTLY);
            response.setHeader("Location",site);
    }
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
        <li id="active"><a href="index.jsp" id="current">Topics</a></li>
        <li><a href="members.jsp">Members</a></li>
       <li><a href="Profile.jsp?u=<%=s3%>">Profile</a></li> 
        
      
      </ul>
    </div>
  </div>

      
     
  
  <div id="right_side">
      <form action="searchupdate.jsp">
      
   <input type="text" name="t1" value="" /><input type="submit" value="Search" />
    </form> 
         <form action="Threadupdate.jsp">
         <table border="0">
             
             <tbody>
                 <tr>
                     <td width="30%">
                          <h3>Choose Topic</h3>
                
                <select name="d1">
                    
                <%  
                   try
            {
           
           
            PreparedStatement ps;
            ps=con.prepareStatement("Select * from thread");
             ResultSet res=ps.executeQuery();
          
                 while(res.next())
                                 {
               
                    out.println(res.getString(1));
                    String ss=res.getString(2);
                    %>
                        <option value="<%=ss%>"><%=ss%></option>
                        
                    <%
                    out.println();
                                   }
           
              
                         }
             catch(Exception ex)
             {
                 ex.printStackTrace();
             }                                                                                   
                
                  %>
                  </select>
                    
                  <br><br>
                <h3>Post a thread</h3><br>
        
                       <input type="text" name="t2" value="" /><br><br>
        <input type="submit" value="Submit " /><input type="reset" value="Clear" />
         </td>
                 </tr>
             </tbody>
         </table></form>
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
    </form></div>
        
     
                       
 <div id="content">
       
                    
                          <%
            out.println("<table border=1 bordercolor=#FFFFFF cellspacing=0 width=1145  bgcolor=#E0F3F5>");
            out.println("<tr>");
            out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Serial Number</font></th>");
            out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Categories</font></th>");
            out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Total Posts</font></th>");
            out.println("<th bgcolor=#4169E1><font color=#FFFFFF>Last post</font></th>");
            out.println("</tr>");
                   
        try
                               {
          Class.forName("com.mysql.jdbc.Driver");
           Connection con1= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
             
               //ResultSet res=st.executeQuery("SELECT * FROM thread");
             
                /* Statement st=con1.createStatement();Execute these two lines only once because view is created only once
              st.executeUpdate("Create view v3 as select * from subthread order by tid desc");*/
                PreparedStatement ps3=con1.prepareStatement("select thread.subcode,thread.subname,thread.nothreads,v3.text,v3.username,DATE_FORMAT(v3.dp,'%b %d %Y %h:%i %p') from thread INNER JOIN v3 where thread.subcode=v3.subcode group by v3.subcode");
                ResultSet res1=ps3.executeQuery();
              
             


                 
               while(res1.next())
                                     {
                   String id=res1.getString(1);
                   out.println("<tr>");
                   out.println("<td align=center>"+id+"</td>");
                   out.println("<td align=left> <img  src =img/forum-icon.png width = 30 height = 30 alt = forum-icon />&nbsp;&nbsp;<a href=showThreds.jsp?tid="+id+">"+res1.getString(2)+"<a/></td>");
                   out.println("<td align=center>"+res1.getString(3)+"</td>");
                   out.println("<td align=left><img  src = img/page_icon.png width = 25 height = 25 alt = page_icon />&nbsp;"+res1.getString(4)+"&nbsp<br>by&nbsp<a href=Profile2.jsp?u="+res1.getString(5)+">"+res1.getString(5)+"<a/>&nbsp<br>at&nbsp"+res1.getString(6)+"</td>");
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


  
</html>


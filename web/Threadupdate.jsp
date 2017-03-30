<%@page import="java.sql.*;" contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
         <%  
           String s1=request.getParameter("d1");
           String s2=request.getParameter("t2");
           String s3=(String)session.getAttribute("username");
            String site = new String("index.jsp?t1="+s1+"");
                   response.setStatus(response.SC_MOVED_TEMPORARILY);
                   response.setHeader("Location", site); 
           int scode;
             try
             {
                     int s;
             Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
                 if(s2.length()>0)
                  {
                   
                     PreparedStatement ps;
                      ps=con.prepareStatement("Select nothreads from thread where subname=?");
                      ps.setString(1,s1.trim());
                      ResultSet res=ps.executeQuery();
                      if(res.next())
                        { 
                          s=res.getInt(1);
                          
                          s=s+1;
                    PreparedStatement ps2=con.prepareStatement("update thread set nothreads=? where subname=?");
                        ps2.setInt(1,s);
                        ps2.setString(2,s1.trim());
                       int ii=ps2.executeUpdate();
                       if(ii>0)
                        {
                           %>
                           <script>
                               alert("Record Save");
                           </script>
                           <%
                        

                       
                       PreparedStatement ps3=con.prepareStatement("select subcode from thread where subname=?");
                       ps3.setString(1,s1.trim());
                       ResultSet res2=ps3.executeQuery();
                        if(res2.next())
                         {
                            scode=res2.getInt(1);
                                                
                       
                       
                       PreparedStatement ps4=con.prepareStatement("insert into subthread (text,Username,dp,subcode) values(?,?,NOW(),?)");
                        ps4.setString(1,s2.trim());
                        ps4.setString(2,s3.trim());
                        ps4.setInt(3,scode);
                        ps4.executeUpdate();
                      
                       
                                              }
                       
                                  }
          
             
             
                  }
                 
                                     }
           
              }
             catch(Exception ex)
             {
                 ex.printStackTrace();
             }
            
        %>
    </body>
</html>

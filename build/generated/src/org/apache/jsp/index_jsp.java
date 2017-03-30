package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE>\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("     <style>\r\n");
      out.write("        .right {\r\n");
      out.write("    \r\n");
      out.write("    float: right;\r\n");
      out.write("}\r\n");
      out.write("    </style>\r\n");
      out.write("<title>Student Forum</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<link href=\"css/style.css\" type=\"text/css\" rel=\"stylesheet\" />\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/favicon.ico\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("    \r\n");
      out.write("    ");

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
       
   
      out.write("\r\n");
      out.write("<div id=\"page_wrapper\">\r\n");
      out.write("  <div id=\"header_wrapper\">\r\n");
      out.write("    <div id=\"header\">\r\n");
      out.write("       <h1>Stu<font color=\"#FFDF8C\">Connect</font></h1><br>\r\n");
      out.write("      <h2><div style=\"color:white\">A complete web forum for <font color=\"#FFDF8C\">students</font></h2>\r\n");
      out.write("              <a class=\"right\" href=\"logout.jsp\"><font color=#FFFFFF>Logout</font></a>\r\n");
      out.write("               ");
       if(res2.next())
        {
           out.println("<a class=right><font color=#FFFFFF>Welcome "+res2.getString(1)+"&nbsp;&nbsp;|&nbsp;</font></a>");
        } 
      out.write("\r\n");
      out.write("     \r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("         \r\n");
      out.write("    <div id=\"navcontainer\">\r\n");
      out.write("         \r\n");
      out.write("      <ul id=\"navlist\">\r\n");
      out.write("          ");
 if(!s3.equals("admin"))
               { 
      out.write("\r\n");
      out.write("                <li><a href=\"home.jsp\">Home</a></li>\r\n");
      out.write("               ");
 }
             else
                { 
      out.write("  \r\n");
      out.write("                  <li><a href=\"home2.jsp\">Home</a></li>\r\n");
      out.write("               ");
 } 
      out.write("  \r\n");
      out.write("               \r\n");
      out.write("        <li><a href=\"About.jsp\">About Us</a></li>\r\n");
      out.write("        <li id=\"active\"><a href=\"index.jsp\" id=\"current\">Topics</a></li>\r\n");
      out.write("        <li><a href=\"members.jsp\">Members</a></li>\r\n");
      out.write("       <li><a href=\"Profile.jsp?u=");
      out.print(s3);
      out.write("\">Profile</a></li> \r\n");
      out.write("        \r\n");
      out.write("      \r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("      \r\n");
      out.write("     \r\n");
      out.write("  \r\n");
      out.write("  <div id=\"right_side\">\r\n");
      out.write("      <form action=\"searchupdate.jsp\">\r\n");
      out.write("      \r\n");
      out.write("   <input type=\"text\" name=\"t1\" value=\"\" /><input type=\"submit\" value=\"Search\" />\r\n");
      out.write("    </form> \r\n");
      out.write("         <form action=\"Threadupdate.jsp\">\r\n");
      out.write("         <table border=\"0\">\r\n");
      out.write("             \r\n");
      out.write("             <tbody>\r\n");
      out.write("                 <tr>\r\n");
      out.write("                     <td width=\"30%\">\r\n");
      out.write("                          <h3>Choose Topic</h3>\r\n");
      out.write("                \r\n");
      out.write("                <select name=\"d1\">\r\n");
      out.write("                    \r\n");
      out.write("                ");
  
                   try
            {
           
           
            PreparedStatement ps;
            ps=con.prepareStatement("Select * from thread");
             ResultSet res=ps.executeQuery();
          
                 while(res.next())
                                 {
               
                    out.println(res.getString(1));
                    String ss=res.getString(2);
                    
      out.write("\r\n");
      out.write("                        <option value=\"");
      out.print(ss);
      out.write('"');
      out.write('>');
      out.print(ss);
      out.write("</option>\r\n");
      out.write("                        \r\n");
      out.write("                    ");

                    out.println();
                                   }
           
              
                         }
             catch(Exception ex)
             {
                 ex.printStackTrace();
             }                                                                                   
                
                  
      out.write("\r\n");
      out.write("                  </select>\r\n");
      out.write("                    \r\n");
      out.write("                  <br><br>\r\n");
      out.write("                <h3>Post a thread</h3><br>\r\n");
      out.write("        \r\n");
      out.write("                       <input type=\"text\" name=\"t2\" value=\"\" /><br><br>\r\n");
      out.write("        <input type=\"submit\" value=\"Submit \" /><input type=\"reset\" value=\"Clear\" />\r\n");
      out.write("         </td>\r\n");
      out.write("                 </tr>\r\n");
      out.write("             </tbody>\r\n");
      out.write("         </table></form>\r\n");
      out.write("       <form action=\"homeupdate.jsp\">\r\n");
      out.write("        \r\n");
      out.write("        <h3><img src=\"img/poll (1).png\" width=\"20\" height=\"20\" alt=\"poll (1)\"/>Today's Poll</h3>\r\n");
      out.write("          <table>\r\n");
      out.write("              \r\n");
      out.write("            <tbody>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>Should more student exchange programs be conducted across the globe?</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"yes\" />Agree</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"No\" />Disagree</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"dotno\" />Can't say</td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td><input type=\"submit\" value=\"Vote\" /></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </tbody>\r\n");
      out.write("        </table>\r\n");
      out.write("    </form></div>\r\n");
      out.write("        \r\n");
      out.write("     \r\n");
      out.write("                       \r\n");
      out.write(" <div id=\"content\">\r\n");
      out.write("       \r\n");
      out.write("                    \r\n");
      out.write("                          ");

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
        
                
      
      out.write("\r\n");
      out.write("                    \r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("        \r\n");
      out.write("  </div>\r\n");
      out.write("  </div>\r\n");
      out.write("    \r\n");
      out.write("    <div id=\"footer\">\r\n");
      out.write("        <p>Created By:Jainendra Kumar,Sharda University</p>\r\n");
      out.write("      \r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

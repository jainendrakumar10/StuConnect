package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("<link href=\"css/style.css\" type=\"text/css\" rel=\"stylesheet\" />\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/favicon.ico\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <style>\n");
      out.write("        .right {\n");
      out.write("    \n");
      out.write("    float: right;\n");
      out.write("}\n");
      out.write("    </style>\n");
      out.write("    ");

    String s3=(String)session.getAttribute("username");
    Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps1;
       ps1=con.prepareStatement("Select Name from user where Username=?");
       ps1.setString(1,s3.trim());
       ResultSet res2=ps1.executeQuery();

      out.write("\n");
      out.write("<div id=\"page_wrapper\">\n");
      out.write("  <div id=\"header_wrapper\">\n");
      out.write("      \n");
      out.write("    <div id=\"header\">\n");
      out.write("       <h1>Stu<font color=\"#FFDF8C\">Connect</font></h1><br>\n");
      out.write("      <h2><div style=\"color:white\">A complete web forum for <font color=\"#FFDF8C\">students</font></h2>\n");
      out.write("      \n");
      out.write("      <a class=\"right\" href=\"logout.jsp\"><font color=#FFFFFF>Logout</font></a>\n");
      out.write("        ");
       if(res2.next())
        {
           out.println("<a class=right><font color=#FFFFFF>Welcome "+res2.getString(1)+"&nbsp;&nbsp;|&nbsp;</font></a>");
        } 
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <div id=\"navcontainer\">\n");
      out.write("      <ul id=\"navlist\">\n");
      out.write("        <li id=\"active\"><a href=\"home.jsp\" id=\"current\">Home</a></li>\n");
      out.write("        <li><a href=\"About.jsp\">About Us</a></li>\n");
      out.write("        <li><a href=\"index.jsp\" >Topics</a></li>\n");
      out.write("        <li><a href=\"members.jsp\">Members</a></li>\n");
      out.write("       <li><a href=\"Profile.jsp?u=");
      out.print(s3);
      out.write("\">Profile</a></li> \n");
      out.write("       \n");
      out.write("       \n");
      out.write("      </ul>\n");
      out.write("    </div>\n");
      out.write("     \n");
      out.write("  </div>\n");
      out.write("     \n");
      out.write("\n");
      out.write("  \n");
      out.write("  <div id=\"right_side\">\n");
      out.write("       <form action=\"searchupdate.jsp\">\n");
      out.write("      \n");
      out.write("   <input type=\"text\" name=\"t1\" value=\"\" /><input type=\"submit\" value=\"Search\" />\n");
      out.write("    </form> \n");
      out.write("      <h3><img src=\"img/news-icon.gif\" width=\"20\" height=\"20\" alt=\"news-icon\"/>&nbsp;&nbsp;News</h3>\n");
      out.write("    <p><a href=\"http://mashable.com/2014/07/02/world-cup-day-20-roundup-recap/\" target=\"_blank\">-What matters more than winning World Cup</a> </p>\n");
      out.write("    <p><a href=\"http://mashable.com/2014/07/01/united-states-internet-speed-lags/\" target=\"_blank\">-Internet Connection Speeds Are Up Globally, Lag in the U.S.</a>\n");
      out.write("    <p><a href=\"http://mashable.com/2014/07/01/oculus-rift-hack/\" target=\"_blank\">-Oculus Rift Hack Lets You Live Real Life Like a Video Game</a></p>\n");
      out.write("    <p><a href=\"http://mashable.com/2014/07/01/nasa-robot-astronaut/\" target=\"_blank\">-NASA's Human-like Space Robot Pays Dividends on Earth</a></p>\n");
      out.write("    <p><a href=\"http://in.reuters.com/article/2014/07/01/us-google-songza-idINKBN0F65M620140701\" target=\"_blank\">-Google buys music streaming service Songza</a></p>\n");
      out.write("   \n");
      out.write("   \n");
      out.write("    <form action=\"homeupdate.jsp\">\n");
      out.write("        \n");
      out.write("        <h3><img src=\"img/poll (1).png\" width=\"20\" height=\"20\" alt=\"poll (1)\"/>Today's Poll</h3>\n");
      out.write("          <table>\n");
      out.write("              \n");
      out.write("            <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Should more student exchange programs be conducted across the globe?</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"yes\" />Agree</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"No\" />Disagree</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"radio\" name=\"g1\" value=\"dotno\" />Can't say</td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" value=\"Vote\" /></td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("  </form>\n");
      out.write("    \n");
      out.write("   \n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("    \n");
      out.write("    <div id=\"content\">\n");
      out.write("        <h3><img src=\"img/forum-icon.png\" width=\"30\" height=\"30\" alt=\"forum-icon\"/>&nbsp;&nbsp;Welcome to the student forum</h3>\n");
      out.write("        <p>Welcome to The StuConnect!\n");
      out.write("It is a thriving free student discussion forum, if you can think of a topic there will be somewhere for you to discuss it here.</p>\n");
      out.write("        <p>The site welcomes people from any stage of education. You can read and post messages in any of our forums free of charge. We only ask that you register (which will take a few seconds.) Once you have done this you can join in any existing discussions, start your own and contribute to the ever-growing array of resources and information for students.</p>\n");
      out.write("        \n");
      out.write("         <h3><img src=\"img/forum-icon.png\" width=\"30\" height=\"30\" alt=\"forum-icon\"/>&nbsp;&nbsp;Why should I register?</h3>\n");
      out.write("        <p>First of all, registration is completely free. Registration is quick and simple, and only by registering can you get the complete forum experience. Registering enables you to: \n");
      out.write("\n");
      out.write("Interact with other members, by starting new discussions, taking part in existing ones and using the Private Message system\n");
      out.write("Access our brilliant learning tools, including an interactive revision timetable, library of assignments and coursework.\n");
      out.write("And much, much more!</p>\n");
      out.write(" <h3><img src=\"img/forum-icon.png\" width=\"30\" height=\"30\" alt=\"forum-icon\"/>&nbsp;&nbsp;What's a thread/sticky/sub? etc - The forum Glossary</h3>\n");
      out.write("\n");
      out.write("\n");
      out.write("<p><b>What's a thread?</b><br>\n");
      out.write("On the forums, a 'thread' is the name given to a topic of discussion, into which members' comments are made. The title of a thread should make it clear what that discussion is about.<br>\n");
      out.write("<b>What's a post?</b> <br>\n");
      out.write("A 'post' is the name given to each individual comment made in threads by StuConnect members.<br>\n");
      out.write("<b>What's a sticky? </b><br>\n");
      out.write("A 'sticky' is a thread that is literally 'stuck' at the top of the forum by the Moderators. Usually it will be a reference thread, or large discussion thread that prevents the forum being clogged up by lots of smaller threads with the same topic of discussion.<br>\n");
      out.write("<b>What's a sub?</b> <br>\n");
      out.write("A 'sub' can either refer to a 'subscriber', a member who pays to subscribe to the website in order to access other forums and features not available to ordinary members, or a subscription?, which is the name of paid package that subscribers have purchased.</p>\n");
      out.write("        <br><br>\n");
      out.write("          ");

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

      out.write("\n");
      out.write("<center><p>Total number of visits: ");
      out.print( hitsCount);
      out.write("</p></center>\n");
      out.write("        \n");
      out.write("  </div>\n");
      out.write("    \n");
      out.write("    <div id=\"footer\">\n");
      out.write("        <p>Created By:Jainendra Kumar,Sharda University</p>\n");
      out.write("      \n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
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

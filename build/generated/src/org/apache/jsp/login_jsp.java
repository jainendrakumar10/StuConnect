package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<head>\r\n");
      out.write("<title>Student Forum</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<link href=\"css/style.css\" type=\"text/css\" rel=\"stylesheet\" />\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"img/favicon.ico\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body background=\"c2.jpg\">\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("<div id=\"page_wrapper\">\r\n");
      out.write("  <div id=\"header_wrapper\">\r\n");
      out.write("    <div id=\"header\" style=\"\" >\r\n");
      out.write("      <h1>Stu<font color=\"#FFDF8C\">Connect</font></h1><br>\r\n");
      out.write("      <h2><div style=\"color:white\">A complete web forum for <font color=\"#FFDF8C\">students</font></h2>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("  </div>\r\n");
      out.write("    <div>\r\n");
      out.write("        <h1 align=\"left\"><font color=\"#00008B\">Please Sign in to Continue</font></h1>\r\n");
      out.write("      <form method=\"post\" action=\"loginupdate.jsp\">\r\n");
      out.write("          <table border=\"0\" width=\"20\" cellspacing=\"20\" cellpadding=\"20\">\r\n");
      out.write("              <tbody>\r\n");
      out.write("                  <tr>\r\n");
      out.write("                      <td><font color=\"#00008B\"><b>Username</b></font></td>\r\n");
      out.write("                      <td><input type=\"text\" name=\"t1\" value=\"\" /></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                  <tr>\r\n");
      out.write("                      <td><font color=\"#00008B\"><b>Password</b></font></td>\r\n");
      out.write("                      <td><input type=\"password\" name=\"t2\" value=\"\" /></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                  <tr>\r\n");
      out.write("                      <td><input type=\"submit\" value=\"Login\" /></td>\r\n");
      out.write("                      <td><input type=\"Reset\" value=\"Clear\" /></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("              </tbody>\r\n");
      out.write("          </table>\r\n");
      out.write("     </form>\r\n");
      out.write("     <form method=\"GET\" action=\"register.jsp\">\r\n");
      out.write("\r\n");
      out.write("         <h3 align=\"left\"><a href=\"register.jsp\"><font color=\"#00008B\"><b>Not a Member Click Here</b></font></a></h3>\r\n");
      out.write("     </form>\r\n");
      out.write("     </div>\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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

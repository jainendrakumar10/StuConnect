package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.InputStream;
import java.awt.Toolkit;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.sql.*;;
import java.io.*;;

public final class photo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Image</h1>\n");
      out.write("        ");

       
         String s3=(String)session.getAttribute("username");
         String imgLen = "";
         
        
         Class.forName("com.mysql.jdbc.Driver");
       Connection con= DriverManager.getConnection("jdbc:mysql://localhost/forumproject", "root", "sys");
       PreparedStatement ps1;
       ps1=con.prepareStatement("Select dp from user where Username=?");
       ps1.setString(1,s3.trim());
       ResultSet res2=ps1.executeQuery();
       if(res2.next())
         {
                    imgLen = res2.getString(1);  
                    System.out.println(imgLen.length());  
                    int len = imgLen.length();  
                    byte[] rb = new byte[len];  
                    InputStream readImg = res2.getBinaryStream(1);  
                    int index = readImg.read(rb, 0, len);  
                    System.out.println("Index.........." + index);  
  
                    response.reset();  
                    response.setContentType("image/jpg"); 
                    out.println("<tr>");
                    out.println("<td>");
                    response.getOutputStream().write(rb, 0, len);  
                    response.getOutputStream().flush(); 
                    
                      out.println("</td>");
                    out.println("</tr>");

               
               }
              out.println("</table>");
       
      out.write("\n");
      out.write("    </body>\n");
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

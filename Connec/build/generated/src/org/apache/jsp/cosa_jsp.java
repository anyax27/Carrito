package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cosa_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         \n");
      out.write("        <title>Cosa</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/Style.css\">\n");
      out.write("        <script type=\"text/javascript\" src=\"https://www.google.com/jsapi\" ></script>\n");
      out.write("      <script type=\"text/javascript\" src=\"js/Administrar.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color:#F2BEA0\">\n");
      out.write("        <header>\n");
      out.write("        <div class=\"wrapper\" style=\"font-family: Bahnschrift Condensed\">\n");
      out.write("            <br>\n");
      out.write("            <div class=\"logo\" style=\"font-family:Bookman Old Style\" style=\"font-size:\"><b><i>Pictures</i></b> \n");
      out.write("                        </div>\n");
      out.write("\t\t\t<nav>\n");
      out.write("\t\t\t\t<a href=\"Inicio.jsp\">Inicio</a>\n");
      out.write("                                <a href=\"Principal.jsp\">Fotos</a>\n");
      out.write("                                <a href=\"D_A.jsp\">Derechos de Autor</a>\n");
      out.write("                                \n");
      out.write("\t\t\t</nav>\n");
      out.write("\t\t</div>\n");
      out.write("        <br>\n");
      out.write("    </header>\n");
      out.write("       <br>\n");
      out.write("            <div class=\"ino\"   >\n");
      out.write("                \n");
      out.write("                <div class=\"titulo\">\n");
      out.write("                <font style=\"font-family: Bahnschrift Condensed\"  style=\"color:#202022 \" >\n");
      out.write("                <i>Graficas</i>\n");
      out.write("                </font>\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <div id=\"grafica\" class=\"grafica\">\n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                \n");
      out.write("                <div id=\"grafica2\" class=\"grafica\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div id=\"grafica3\" class=\"grafica\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <br>\n");
      out.write("                <div id=\"grafica4\" class=\"grafica\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <a href=\"SCerrarSesion\">Cerrar sesión</a>\n");
      out.write("            </div>\n");
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

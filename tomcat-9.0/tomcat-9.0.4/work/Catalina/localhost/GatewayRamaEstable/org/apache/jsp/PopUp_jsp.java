/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.4
 * Generated at: 2018-06-08 09:53:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;

public final class PopUp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<html>\r\n");
      out.write("<head><title>Rangos</title><script language=\"JavaScript\" src=\"js/util.js\"></script>\r\n");
      out.write("<link href=\"estilos/estilos.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("    <body leftMargin=0 topMargin=0 marginheight=\"0\" marginwidth=\"0\">\r\n");
      out.write("        \r\n");
      out.write("        \r\n");

	String m_NRN = (String) request.getParameter("NRN");
	String m_NIR = (String) request.getParameter("NIR");
	String m_NFR = (String) request.getParameter("NFR");
        
        Vector v_NRN = new Vector();        
        
        if ((m_NRN!=null) && (m_NRN.length()>2))
            {
                StringTokenizer st_NRN = new StringTokenizer(m_NRN,",");
                while (st_NRN.hasMoreTokens()) {
                    v_NRN.add(st_NRN.nextToken());
                }
            }

        Vector v_NIR = new Vector();        
	StringTokenizer st_NIR = new StringTokenizer(m_NIR,",");
        while (st_NIR.hasMoreTokens()) {
            v_NIR.add(st_NIR.nextToken());
        }

        Vector v_NFR = new Vector();        
	StringTokenizer st_NFR = new StringTokenizer(m_NFR,",");
        while (st_NFR.hasMoreTokens()) {
            v_NFR.add(st_NFR.nextToken());
        }
        
        if (v_NRN.size()>0)
            {

      out.write("\r\n");
      out.write("        <table  border=\"1\" class=\"tablas\" align=\"center\">\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td class=\"bgCabeceraFila\" align=\"center\"><font class=\"texto2\"><small>NRN</small></font></td>\r\n");
      out.write("                <td class=\"bgCabeceraFila\" align=\"center\" NOWRAP><font class=\"texto2\"><small>Inicio Rango</small></font></td>\r\n");
      out.write("                <td class=\"bgCabeceraFila\" align=\"center\" NOWRAP><font class=\"texto2\"><small>Final Rango</small></font></td>\r\n");
      out.write("            </tr>\r\n");

        for (int i=0; i< v_NRN.size(); i++)
        {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td align=\"center\" class=\"texto\"><small>");
      out.print(v_NRN.elementAt(i).toString());
      out.write("</small></td>\r\n");
      out.write("                <td align=\"center\" class=\"texto\"><small>");
      out.print(v_NIR.elementAt(i).toString());
      out.write("</small></td>\r\n");
      out.write("                <td align=\"center\" class=\"texto\"><small>");
      out.print(v_NFR.elementAt(i).toString());
      out.write("</small></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

        }
        }
        else
            {

      out.write("\r\n");
      out.write("        <table  border=\"1\" class=\"tablas\" align=\"center\" >\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td  NOWRAP><font class=\"texto2\"><small>Inicio Rango</small></font></td>\r\n");
      out.write("                <td  NOWRAP><font class=\"texto2\"><small>Final Rango</small></font></td>\r\n");
      out.write("            </tr>\r\n");

        for (int i=0; i< v_NIR.size(); i++)
        {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("                <td align=\"center\" class=\"texto\"><small>");
      out.print(v_NIR.elementAt(i).toString());
      out.write("</small></td>\r\n");
      out.write("                <td align=\"center\" class=\"texto\"><small>");
      out.print(v_NFR.elementAt(i).toString());
      out.write("</small></td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

        }
}

      out.write("\r\n");
      out.write("        </table>     \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.73
 * Generated at: 2023-06-19 23:36:40 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.HttpSession;

public final class nav_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("javax.servlet.http.HttpSession");
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
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("nav {\r\n");
      out.write("  background-color: #333;\r\n");
      out.write("  padding: 10px;\r\n");
      out.write("  display: flex;\r\n");
      out.write("  justify-content: space-between;\r\n");
      out.write("  align-items: center;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-logo img {\r\n");
      out.write("  height: 40px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-links ul {\r\n");
      out.write("  list-style-type: none;\r\n");
      out.write("  margin: 0;\r\n");
      out.write("  padding: 0;\r\n");
      out.write("  display: flex;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-links li {\r\n");
      out.write("  margin-right: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-links li a {\r\n");
      out.write("  color: #fff;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  font-size: 16px;\r\n");
      out.write("  font-size: 20px;\r\n");
      out.write("    margin-right: 20px;\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-links li a:hover {\r\n");
      out.write("  color: #ff6600;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write(".navbar-logo{\r\n");
      out.write("margin-top:8px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<nav>\r\n");
      out.write("  <div class=\"navbar-logo\">\r\n");
      out.write("    \r\n");
      out.write("      <a href=index.jsp><img src=\"../Contents/logo.png\" alt=\"Logo\"></a>\r\n");
      out.write("      \r\n");
      out.write("   \r\n");
      out.write("  </div>\r\n");
      out.write("  <div class=\"navbar-links\">\r\n");
      out.write("    <ul>\r\n");
      out.write("      <li><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("      <li><a href=\"order.jsp\">Services</a></li>\r\n");
      out.write("      <li><a href=\"contact.jsp\">Contact</a></li>\r\n");
      out.write("       ");
      out.write("\r\n");
      out.write("      ");

        HttpSession s = request.getSession(false);
        if (s != null && s.getAttribute("username") != null) {
          // User is logged in, show logout link
          
      out.write("\r\n");
      out.write("          <li class=\"jobs\"><a href=\"jobs.jsp\">Jobs</a></li>\r\n");
      out.write("          <li class=\"logout\"><a href=\"logout.jsp\">Logout</a></li>\r\n");
      out.write("          ");

        } else {
          // User is not logged in, show login link
          
      out.write("\r\n");
      out.write("          <li class=\"login\"><a href=\"login.jsp\">Login</a></li>\r\n");
      out.write("          <li class=\"Signup\"><a href=\"reg.jsp\">Signup</a></li>\r\n");
      out.write("          ");

        }
      
      out.write("\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
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

/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.73
 * Generated at: 2023-08-09 13:47:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;
import com.database.dbconn;

public final class report_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {


    public String formatTime(int seconds) {
        int hours = seconds / 3600;
        int minutes = (seconds % 3600) / 60;
        return hours + "h " + minutes + "m";
    }

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/JSP/adminNav.jsp", Long.valueOf(1691584261031L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Date");
    _jspx_imports_classes.add("com.database.dbconn");
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Invoice Report</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"../CSS/report.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("body {\r\n");
      out.write("	margin: 0;\r\n");
      out.write("	padding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".admin-navbar {\r\n");
      out.write("	background-color: #333;\r\n");
      out.write("	height: 110%;\r\n");
      out.write("	width: 220px;\r\n");
      out.write("	position: absolute;\r\n");
      out.write("	display: flex;\r\n");
      out.write("	flex-direction: column;\r\n");
      out.write("	justify-content: flex-start;\r\n");
      out.write("	align-items: center;\r\n");
      out.write("	padding-top: 20px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".admin-navbar-links {\r\n");
      out.write("	width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".admin-navbar-links ul {\r\n");
      out.write("	list-style-type: none;\r\n");
      out.write("	margin: 0;\r\n");
      out.write("	padding: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar-links li {\r\n");
      out.write("	margin-bottom: 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".admin-navbar-links li a {\r\n");
      out.write("	display: block;\r\n");
      out.write("	padding: 9px 54px 36px;\r\n");
      out.write("	color: #fff;\r\n");
      out.write("	text-decoration: none;\r\n");
      out.write("	font-size: 19px;\r\n");
      out.write("	transition: background-color 0.3s;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".admin-navbar-links li a:hover {\r\n");
      out.write("	background-color: #555;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".content {\r\n");
      out.write("	margin-left: 220px;\r\n");
      out.write("	padding: 20px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "nav.jsp", out, false);
      out.write("\r\n");
      out.write("	<div class=\"admin-navbar\">\r\n");
      out.write("\r\n");
      out.write("		<div class=\"admin-navbar-links\">\r\n");
      out.write("			<ul>\r\n");
      out.write("				<li><a href=\"adminDash.jsp\">Dashboard</a></li>\r\n");
      out.write("				<li><a href=\"users.jsp\">Users</a></li>\r\n");
      out.write("				<li><a href=\"customers.jsp\">Customers</a></li>\r\n");
      out.write("				<li><a href=\"admins.jsp\">Admins</a></li>\r\n");
      out.write("				<li><a href=\"invoice.jsp\">Invoice</a></li>\r\n");
      out.write("<!-- 				<li><a href=\"report.jsp\">Report</a></li> -->\r\n");
      out.write("			</ul>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"content\">\r\n");
      out.write("        <form action=\"\" method=\"post\">\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label class=\"label\" for=\"startDate\">Start Date</label>\r\n");
      out.write("                <input type=\"date\" class=\"input\" id=\"startDate\" name=\"startDate\" placeholder=\"Start Date\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label class=\"label\" for=\"endDate\">End Date</label>\r\n");
      out.write("                <input type=\"date\" class=\"input\" id=\"endDate\" name=\"endDate\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <input type=\"submit\" class=\"btn\" value=\"Generate Report\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </form>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    ");
 
        if (request.getMethod().equalsIgnoreCase("post")) {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            
            int totalInvoices = 0;
            int totalTimeTaken = 0;
            
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = dbconn.getConnection();
                Statement st = conn.createStatement();
                
                // Construct and execute the SQL query
                String query = "SELECT * FROM invoice WHERE mechanicID = " + id + 
                               " AND invoice_date BETWEEN '" + startDate + "' AND '" + endDate + "'";
                ResultSet rs = st.executeQuery(query);
                
                while (rs.next()) {
                    
                    
            
      out.write("\r\n");
      out.write("   <div class=\"table-container\">\r\n");
      out.write("    <table class=\"table\">\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th>Invoice ID</th>\r\n");
      out.write("                <th>Invoice Date</th>\r\n");
      out.write("                <!-- Add more columns as needed -->\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

               
                while (rs.next()) {
            
      out.write("\r\n");
      out.write("            <tr>\r\n");
      out.write("           ");
 totalInvoices++;
           Time timeTaken = rs.getTime("timeTaken"); // Assuming column name is "time_taken"
                    totalTimeTaken += timeTaken.toLocalTime().toSecondOfDay();
      out.write("\r\n");
      out.write("                <td>");
      out.print( rs.getInt("invoice_id") );
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print( rs.getDate("invoice_date") );
      out.write("</td>\r\n");
      out.write("                <!-- Add more columns as needed -->\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

                }
                
            } }catch (Exception e) {
                e.printStackTrace();
            }
            
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"summary\">\r\n");
      out.write("        <p>Total Jobs: ");
      out.print( totalInvoices );
      out.write("</p>\r\n");
      out.write("        <p>Total Time Worked: ");
      out.print( formatTime(totalTimeTaken) );
      out.write("</p>\r\n");
      out.write("    </div>\r\n");
      out.write("    ");

        }
    
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
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

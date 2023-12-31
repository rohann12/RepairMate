<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>

<%


String username = request.getParameter("user-name");
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement statement = null;
ResultSet resultSet = null;

try {
	// Establish a database connection
	String url = "jdbc:mysql://localhost:3306/repairmate";
	String username1 = "root";
	String password1 = "";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, username1, password1);

	// Create the SQL statement
	String query = "SELECT * FROM user WHERE user_name = ? AND password = ?";

	// Create a prepared statement
	statement = conn.prepareStatement(query);
	// Set the parameters
	statement.setString(1, username);
	statement.setString(2, password);

	// Execute the query
	resultSet = statement.executeQuery();

	if (resultSet.next()) {
		// Check the value of the is_admin column
		int isAdmin = resultSet.getInt("is_admin");
		int userID= resultSet.getInt("user_id");
		// Start a session and store the user information
		HttpSession s = request.getSession();
		s.setAttribute("username", username);
		s.setAttribute("userID",userID);
		
		// Redirect to admin dashboard or a different page for non-admin users
		if (isAdmin == 1) {
	s.setAttribute("isAdmin", true);
	

	response.sendRedirect("../JSP/adminDash.jsp");
		} else {
	s.setAttribute("isAdmin", false);
	response.sendRedirect("../JSP/index.jsp");
		}
	} else {
		// Invalid login credentials, display an error message
		out.println("<p>Invalid username or password.</p>");
	}
} catch (Exception e) {
	out.println(e);

}
%>

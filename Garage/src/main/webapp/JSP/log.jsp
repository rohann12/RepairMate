<%@ page import="java.sql.*" %>
<%@ page import="com.database.dbconn" %>

<%
   String username = request.getParameter("user-name");
   String password = request.getParameter("password");

   try {
      // Establish a database connection
      try (Connection conn = dbconn.getConnection()) {
         // Create the SQL statement
         String query = "SELECT * FROM user WHERE user_name = ? AND password = ?";
         
         // Create a prepared statement
         try (PreparedStatement statement = conn.prepareStatement(query)) {
            // Set the parameters
            statement.setString(1, username);
            statement.setString(2, password);
            
            // Execute the query
            try (ResultSet resultSet = statement.executeQuery()) {
               if (resultSet.next()) {
                  // Check the value of the is_admin column
                  int isAdmin = resultSet.getInt("is_admin");
                  
                  if (isAdmin == 1) {
                     // Redirect to admin dashboard
                     response.sendRedirect("adminDash.jsp");
                     
                     // Start a session and store the user information
                     HttpSession s = request.getSession();
                     session.setAttribute("username", username);
                     session.setAttribute("isAdmin", true);
                  } else {
                     // Redirect to a different page for non-admin users
                     response.sendRedirect("index.jsp");
                     
                     // Start a session and store the user information
                     HttpSession s = request.getSession();
                     session.setAttribute("username", username);
                     session.setAttribute("isAdmin", false);
                  }
               } else {
                  // Invalid login credentials, display an error message
                  out.println("<p>Invalid username or password.</p>");
               }
            }
         }
      }
   } catch (Exception e) {
      out.println(e);
   }
%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Database Connection Example</title>
</head>
<body>
    <h1>Database Connection Example</h1>

    <%
        Connection conn = null;

        try {
            String url = "jdbc:mysql://localhost:3306/repairmate";
            String username = "root";
            String password = "";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            out.println("Database connected");
        } catch (Exception e) {
            out.println(e);
        }
    %>

    <%
        // Perform database operations using the 'conn' connection object
        // ...

        // Example query execution
        try {
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM your_table");

            while (resultSet.next()) {
                // Retrieve and display data
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                // ...
                out.println("ID: " + id + ", Name: " + name);
                out.println("<br>");
            }
        } catch (SQLException e) {
            out.println("Error executing query: " + e.getMessage());
        }
    %>

    <%
        // Close the connection
        if (conn != null) {
            try {
                conn.close();
                out.println("Database connection closed");
            } catch (SQLException e) {
                out.println("Error while closing the database connection: " + e.getMessage());
            }
        }
    %>
</body>
</html>

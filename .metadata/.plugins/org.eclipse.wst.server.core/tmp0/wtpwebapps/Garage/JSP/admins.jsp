<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.dbconn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
    <style>
        table {
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<jsp:include page="adminNav.jsp" />

    <%-- Establish the database connection --%>
    <%
        Connection conn = dbconn.getConnection();
        Statement stmt = conn.createStatement();

        // Retrieve users with is_admin = 2
        String query = "SELECT * FROM user WHERE is_admin = 1";
        ResultSet rs = stmt.executeQuery(query);
    %>
<div class="content">
    <h2>Admin Users:</h2>

    <table>
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
        </tr>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("user_id") %></td>
                <td><%= rs.getString("user_name") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
        <% } %>
    </table>
</div>
    
</body>
</html>

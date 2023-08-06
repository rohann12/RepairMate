<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.dbconn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
    <style>
        /* Add custom scrollbar styles */
        .table-container::-webkit-scrollbar {
            width: 8px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 4px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .table-container {
            max-height: 300px; /* Set the maximum height to determine the number of rows to be displayed at once */
            overflow-y: scroll;
        }

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
        String query = "SELECT * FROM user WHERE is_admin = 0";
        ResultSet rs = stmt.executeQuery(query);
    %>

    <div class="content">
        <h2>Customers:</h2>

        <div class="table-container">
            <table>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Contact</th>
                </tr>
                <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("user_id") %></td>
                        <td><%= rs.getString("full_name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("contact") %></td>
                    </tr>
                <% } %>
            </table>
        </div>
        <a href="addCustomer.jsp"><button>Add a customer</button></a>
    </div>


</body>
</html>

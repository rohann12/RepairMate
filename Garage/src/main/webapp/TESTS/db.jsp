<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

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
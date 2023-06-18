<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Login Page</h2>
    <form action="login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="Login">
    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
    // Create a map to store the valid username-password combinations
    Map<String, String> users = new HashMap<>();
    users.put("john", "password1");
    users.put("jane", "password2");

    // Retrieve the submitted username and password from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Check if the submitted credentials match the stored values
    if (users.containsKey(username) && users.get(username).equals(password)) {
        // Valid login, redirect to a welcome page
        response.sendRedirect("welcome.jsp");
    } else {
        // Invalid login, display an error message
        out.println("<p>Invalid username or password. Please try again.</p>");
    }
%>

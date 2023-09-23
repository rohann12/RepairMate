<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.database.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save Completion</title>
</head>
<body>
<%
    // Get form data
    String customerName = request.getParameter("customerName");
    String completedTime = request.getParameter("completedTime");
    String id = request.getParameter("order_id");
    String[] parts = request.getParameterValues("parts[]");
    String[] prices = request.getParameterValues("prices[]");
    String mechanic = (String) session.getAttribute("username");
    int mechanicID = (int) session.getAttribute("userID");
    
    Connection conn = dbconn.getConnection();
    PreparedStatement pstmt = null;

    try {
        // Insert data into the invoice table
        String insertQuery = "INSERT INTO invoice (customer_name, mechanic, mechanicID, invoice_date, total_amount, paid_amount, payment_status, timeTaken, parts, prices)" +
                " VALUES (?, ?, ?, CURDATE(), ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, customerName);
        pstmt.setString(2, mechanic);
        pstmt.setInt(3, mechanicID);
        pstmt.setDouble(4, 0.0); // Set initial total_amount
        pstmt.setDouble(5, 0.0); // Set initial paid_amount
        pstmt.setString(6, "Unpaid"); // Set initial payment_status
        pstmt.setString(7, completedTime);
        pstmt.setString(8, String.join(", ", parts)); // Concatenate parts
        pstmt.setString(9, String.join(", ", prices)); // Concatenate prices

        pstmt.executeUpdate();
        
        response.sendRedirect("complete.jsp?id=" + id + "&timetaken=" + completedTime);
    } catch (SQLException e) {
        out.println("Error saving data: " + e.getMessage());
        e.printStackTrace();
    }
%>
</body>
</html>

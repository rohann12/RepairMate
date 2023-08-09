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
    // Add other form fields as needed

    // Get mechanic data from session
    String mechanic = (String) session.getAttribute("username");
    int mechanicID = (int) session.getAttribute("userID");
    Connection conn = dbconn.getConnection();
    PreparedStatement pstmt = null;

    try {
        // Insert data into the invoice table
        String insertQuery = "INSERT INTO invoice (customer_name, mechanic, mechanicID, invoice_date, total_amount, paid_amount, payment_status)" +
                " VALUES (?, ?, ?, CURDATE(), ?, ?, ?)";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, customerName);
        pstmt.setString(2, mechanic);
        pstmt.setInt(3, mechanicID);
        pstmt.setDouble(4, 0.0); // Set initial total_amount
        pstmt.setDouble(5, 0.0); // Set initial paid_amount
        pstmt.setString(6, "Unpaid"); // Set initial payment_status

        pstmt.executeUpdate();
        // Call the function to show "Data Saved" alert
        out.println("<script>showDataSavedAlert();</script>");

        response.sendRedirect("complete.jsp?id=" + id + "&timetaken=" + completedTime);
		
       
    } catch (SQLException e) {
        out.println("Error saving data: " + e.getMessage());
        e.printStackTrace();
    }
%>
<!-- <script> -->
//         // Function to show a data saved alert
//         function showDataSavedAlert() {
//             alert('Data saved successfully.');            
<%--             var id=<%=id%>; --%>
<%--             var comp=<%=completedTime%>; --%>
//             var url = "complete.jsp?id=" + id + "&timeTaken=" + comp;
//             window.location.href = url;
//         }
<!--     </script> -->
</body>
</html>

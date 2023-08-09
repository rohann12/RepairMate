<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.*"%>
<%@ page import=" java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
HttpSession s = request.getSession(false);
if (s != null && Boolean.TRUE.equals(s.getAttribute("isAdmin"))) {
%>
<jsp:include page="adminNav.jsp" />
<%
} else if (s != null && Boolean.FALSE.equals(s.getAttribute("isAdmin"))) {
%>
<jsp:include page="nav.jsp" />
<%
}
%>

<%
// Establish the database connection
Connection conn = dbconn.getConnection();
Statement stmt = conn.createStatement();
String query = "SELECT * FROM order_list ";
ResultSet rs1 = stmt.executeQuery(query);

while (rs1.next()) {
    if ("available".equals(rs1.getString("status"))) {
        // Calculate priority for the current job
        String startTime1 = rs1.getString("start_time");
        String estimatedCompleted1 = rs1.getString("estimated_completed");
        int estimatedCost1Int = rs1.getInt("estimated_cost");
        String estimatedCost1 = String.valueOf(estimatedCost1Int);
        String concatenatedJobs1 = rs1.getString("repairs");

        priority order = new priority(startTime1, estimatedCompleted1, estimatedCost1, concatenatedJobs1);
        int priorit = order.calculate_priority();

        // Update the priority in the database
        int orderId = rs1.getInt("order_id");
        String updatePriorityQuery = "UPDATE order_list SET priority = " + priorit + " WHERE order_id = " + orderId;
        
        stmt.executeUpdate(updatePriorityQuery);
    }
}

// Close the ResultSet and statement
rs1.close();
stmt.close();
conn.close();
%>

<!DOCTYPE html>
<html>
<head>
<title>Jobs List</title>
<link rel="stylesheet" href="../CSS/jobs.css">
</head>
<body>
<!-- Rest of your code -->
</body>
</html>

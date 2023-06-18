<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.dbconn" %>

<%
    try {
        Connection conn = dbconn.getConnection();
        Statement st = conn.createStatement();

        String orderID = request.getParameter("order_id");
        String customerID = request.getParameter("customer_id");
        String customerName = request.getParameter("customer_name");
        String vehicleNo = request.getParameter("vehicle_no");
        String startTime = request.getParameter("start_time");
        String estimatedCompleted = request.getParameter("estimated_completed");
        String estimatedCost = request.getParameter("estimated_cost");
        String repairs = request.getParameter("repairs");

        String query = "INSERT INTO order_list ( customer_id, customer_name, vehicle_no, start_time, estimated_completed, estimated_cost, repairs) " +
                "VALUES ( '" + customerID + "', '" + customerName + "', '" + vehicleNo + "', '" + startTime + "', '" + estimatedCompleted + "', '" + estimatedCost + "', '" + repairs + "')";

        st.executeUpdate(query);

        response.getWriter().println("<script>Data inserted successfully</script>");

        // Redirect to index.html
        response.sendRedirect("index.html");
    } catch (Exception e) {
        out.println(e);
    }
%>

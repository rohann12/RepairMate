<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.database.dbconn" %>
<%@ page import="com.database.priority" %>

<%
    try {
        Connection conn = dbconn.getConnection();
        Statement st = conn.createStatement();

        String orderID = request.getParameter("order_id");
        String customerID = request.getParameter("customer_id");
        String customerName = request.getParameter("customer_name");
        String email = request.getParameter("email");
        String vehicleNo = request.getParameter("vehicle_no");
        String startTime = request.getParameter("start_time");
        String estimatedCompleted = request.getParameter("estimated_completed");
        String estimatedCost = request.getParameter("estimated_cost");
        String repairs = request.getParameter("repairs");
        String[] jobs = request.getParameterValues("jobs[]");

       
        // Concatenate job entries into a single string
        String concatenatedJobs = String.join(". ", jobs);
//         // To calculate priority       
		priority order= new priority(startTime,estimatedCompleted,estimatedCost,concatenatedJobs);
        int priorit = order.calculate_priority();

        String query = "INSERT INTO order_list ( customer_id, customer_name, email, vehicle_no, start_time, estimated_completed, estimated_cost, repairs, priority) " +
                "VALUES ( '" + customerID + "', '" + customerName + "','" + email + "', '" + vehicleNo + "', '" + startTime + "', '" + estimatedCompleted + "', '" + estimatedCost + "', '" + concatenatedJobs+ "', '" + priorit+ "')";

        st.executeUpdate(query);
        response.getWriter().println("<script>Data inserted successfully</script>");

        // Redirect to index.html
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        out.println(e);
    }
%>

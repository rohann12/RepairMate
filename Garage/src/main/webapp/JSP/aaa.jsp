<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.*"%>

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
	//THIS IS FOR PRIORITY
	    String query1 = "SELECT * FROM order_list ";
    ResultSet rs1 = stmt.executeQuery(query1);
                    
                    while (rs1.next()) {
                        if ("available".equals(rs1.getString("status"))) {
                                                       // Calculate priority for the current job
                            String startTime1 = rs1.getString("start_time");
                            String estimatedCompleted1 = rs1.getString("estimated_completed");
                            String estimatedCost1 = rs1.getString("estimated_cost");
                            String concatenatedJobs1 = rs1.getString("repairs");

                            priority order = new priority(startTime1, estimatedCompleted1, estimatedCost1, concatenatedJobs1);
                            int priorit = order.calculate_priority();

                            // Update the priority in the database
                            int orderId = rs1.getInt("order_id");
                            String updatePriorityQuery = "UPDATE order_list SET priority = " + priorit + " WHERE order_id = " + orderId;
                            stmt.executeUpdate(updatePriorityQuery);
                        }
                    }
                        %>
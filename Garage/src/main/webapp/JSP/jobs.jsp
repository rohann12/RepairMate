<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Jobs List</title>
<link rel="stylesheet" href="../CSS/jobs.css">
</head>
<body>

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



	<%-- Establish the database connection --%>
	<%
	Connection conn = dbconn.getConnection();
	Statement stmt = conn.createStatement(); String query1 = "SELECT * FROM order_list ";
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

	// Retrieve users with is_admin = 2
	String query = "SELECT * FROM order_list ORDER BY priority DESC";
	ResultSet rs = stmt.executeQuery(query);
	%>
	<div style="display: grid; place-items: center">
		<div class="content" style="margin-top: 20px;">
			<h2>Jobs:</h2>

			<div class="scrollable-table">
				<table>
					<tr>
						<th>S.N.</th>
						<th>Customer Name</th>
						<th>Vehicle number</th>
						<th>Repairs</th>
						<th>Priority</th>
						<th>Actions</th>
					</tr>
					<%
					int serialNumber = 1; // Counter variable for serial numbering
					while (rs.next()) {
						if ("available".equals(rs.getString("status"))) {
							String repairs = rs.getString("repairs");
							String[] repairsArray = repairs.split(". "); // Split the concatenated repairs into an array
						%>
						<tr>
							<td><%= serialNumber %></td> <!-- Display serial number -->
							<td><%=rs.getString("customer_name")%></td>
							<td><%=rs.getString("vehicle_no")%></td>
							<td>
								<%
								for (String repair : repairsArray) {
								%> <%=repair%><br> <!-- Display each repair on a new line -->
								<%
								}
								%>
							</td>
							<td><%=rs.getString("priority")%></td>
							<td><a href="repair.jsp?id=<%=rs.getInt("order_id")%>"><button>Take
										job</button></a>
							</td>
						</tr>
						<%
						serialNumber++; // Increment the serial number
						}
					}
					%>
				</table>
			</div>
		</div>
	</div>
	<%-- Close the database connection and result set --%>
	<%-- <% rs.close(); %>
    <% stmt.close(); %> --%>
	<!-- This closed the connection preventing the reload -->
	<%-- <% conn.close(); %> --%>
</body>
</html>
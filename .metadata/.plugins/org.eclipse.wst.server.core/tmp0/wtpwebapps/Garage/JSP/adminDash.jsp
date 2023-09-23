<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Dashboard</title>
<link rel="stylesheet" href="../CSS/adminDash.css">
</head>
<body>

	<jsp:include page="adminNav.jsp" />

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
						<th>Status</th>
					</tr>
					<%
					int serialNumber = 1; // Counter variable for serial numbering
					Connection conn = dbconn.getConnection();
					Statement stmt = conn.createStatement();

					// Get today's date in the format yyyy-MM-dd
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String todayDate = dateFormat.format(new Date());

				
					String query = "SELECT * FROM order_list WHERE DATE(start_time) = '" + todayDate + "' or (status = 'available' OR status = 'ongoing') ORDER BY status ASC, priority DESC";
					ResultSet rs = stmt.executeQuery(query);

					while (rs.next()) {
						String repairs = rs.getString("repairs");
						String[] repairsArray = repairs.split(". "); // Split the concatenated repairs into an array
						int count=0;
					%>
					<tr>
						<td><%=serialNumber%></td>
						<td><%=rs.getString("customer_name")%></td>
						<td><%=rs.getString("vehicle_no")%></td>
						<td>
							<%
							for (String repair : repairsArray) {
								count++;
							%>
							
<%-- 							 <%=repair%><br> <!-- Display each repair on a new line --> --%>
							<%
							}
							
							%>
							<%=count%>
						</td>
						<td><%=rs.getString("priority")%></td>
						<td><%=rs.getString("status")%></td>
					</tr>

					<%
					serialNumber++; // Increment the serial number
					}
					%>
				</table>
			</div>
		</div>
	</div>

</body>
</html>

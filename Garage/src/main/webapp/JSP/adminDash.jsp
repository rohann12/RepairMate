<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
	font-family: "Helvetica Neue", Arial, sans-serif;
	margin: 0;
	padding: 0;
	color: #333;
	background-color: #f5f5f5;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.content {
	max-width: 740px;
	margin: 20px;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	margin-top: 0;
	font-size: 24px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f5f5f5;
}

.scrollable-table {
	overflow: auto;
	max-height: 400px;
	/* Hide the scrollbar */
	scrollbar-width: thin;
	scrollbar-color: transparent transparent;
}

/* Hide scrollbar for Chrome, Safari, and Opera */
.scrollable-table::-webkit-scrollbar {
	width: 6px;
}

.scrollable-table::-webkit-scrollbar-track {
	background-color: transparent;
}

.scrollable-table::-webkit-scrollbar-thumb {
	background-color: transparent;
}

/* Hide scrollbar for Firefox */
.scrollable-table {
	scrollbar-width: thin;
	scrollbar-color: transparent transparent;
}

.scrollable-table::-moz-scrollbar {
	width: 6px;
}

.scrollable-table::-moz-scrollbar-track {
	background-color: transparent;
}

.scrollable-table::-moz-scrollbar-thumb {
	background-color: transparent;
}
</style>
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

					// Retrieve users with is_admin = 2
					String query = "SELECT * FROM order_list ORDER BY priority DESC";
					ResultSet rs = stmt.executeQuery(query);

					while (rs.next()) {
						String repairs = rs.getString("repairs");
						String[] repairsArray = repairs.split(". "); // Split the concatenated repairs into an array
					%>
					<tr>
						<td><%=serialNumber%></td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.database.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Repair</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	Connection conn = dbconn.getConnection();
	Statement stmt = conn.createStatement();

	// Retrieve users with is_admin = 2
	String query = "SELECT * FROM order_list WHERE order_id=" + id;
	ResultSet rs = stmt.executeQuery(query);
	%>
	<%
	while (rs.next()) {
	%>


	<table>
		<tr>
			<th>Customer Name</th>
			<td><%=rs.getString("customer_name")%></td>
		</tr>
		<tr>
			<th>Vehicle Number</th>
			<td><%=rs.getString("vehicle_no")%></td>
		</tr>
		<tr>
			<th>Start Time</th>
			<td><%=rs.getString("start_time")%></td>
		</tr>
		<tr>
			<th>Estimated Cost</th>
			<td><%=rs.getString("estimated_cost")%></td>
		</tr>
		<tr>
			<th>Repairs</th>
			<td><%=rs.getString("repairs")%></td>
		</tr>
		<tr>
			<th>Time taken</th>
			<td id="time_taken">0 seconds</td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="start_btn" onclick="startStopwatch()">Start</button>
				<button id="stop_btn" onclick="stopStopwatch()" disabled>Stop</button>
				<button id="complete_btn" onclick="complete()" disabled>Complete</button>
			</td>
		</tr>
	</table>

	<script type="text/javascript" src="../Javascript/stopwatch.js"></script>


	<%
	}
	%>
</body>
</html>
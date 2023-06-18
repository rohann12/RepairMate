<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.database.dbconn"%>
<!DOCTYPE html>
<html>
<head>
<title>Users List</title>
<style>
table {
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp" />

	<%-- Establish the database connection --%>
	<%
	Connection conn = dbconn.getConnection();
	Statement stmt = conn.createStatement();

	// Retrieve users with is_admin = 2
	String query = "SELECT * FROM order_list";
	ResultSet rs = stmt.executeQuery(query);
	%>
	<div style="display: grid; place-items: center">
		<div class="content" style="margin-top:20px;">
			<h2>Jobs:</h2>

			<table>
				<tr>
					<th>Customer Name</th>
					<th>Vehicle number</th>
					<th>Repairs</th>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("customer_name")%></td>
					<td><%=rs.getString("vehicle_no")%></td>
					<td><%=rs.getString("repairs")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<%-- Close the database connection and result set --%>
	<%-- <% rs.close(); %>
    <% stmt.close(); %> --%>
	<!-- This closed the connection preventing the reload -->
	<%-- <% conn.close(); %> --%>
</body>
</html>

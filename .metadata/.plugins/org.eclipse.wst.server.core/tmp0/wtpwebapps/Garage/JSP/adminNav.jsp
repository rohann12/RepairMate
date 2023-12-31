<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
body {
	margin: 0;
	padding: 0;
}

.admin-navbar {
	background-color: #333;
	height: 110%;
	width: 220px;
	position: absolute;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	padding-top: 20px;
}

.admin-navbar-links {
	width: 100%;
}

.admin-navbar-links ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.navbar-links li {
	margin-bottom: 10px;
}

.admin-navbar-links li a {
	display: block;
	padding: 9px 54px 36px;
	color: #fff;
	text-decoration: none;
	font-size: 19px;
	transition: background-color 0.3s;
}

.admin-navbar-links li a:hover {
	background-color: #555;
}

.content {
	margin-left: 220px;
	padding: 20px;
}
</style>
</head>
<body>

	<jsp:include page="nav.jsp" />
	<div class="admin-navbar">

		<div class="admin-navbar-links">
			<ul>
				<li><a href="adminDash.jsp">Dashboard</a></li>
				<li><a href="users.jsp">Users</a></li>
				<li><a href="customers.jsp">Customers</a></li>
				<li><a href="admins.jsp">Admins</a></li>
				<li><a href="invoice.jsp">Invoice</a></li>
<!-- 				<li><a href="report.jsp">Report</a></li> -->
			</ul>
		</div>
	</div>
</body>
</html>



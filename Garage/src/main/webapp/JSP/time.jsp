<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.database.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<p><%=request.getParameter("timeTaken") %></p>


<!-- // 	String time = request.getParameter("time_taken"); -->
<!-- // 	Connection conn = dbconn.getConnection(); -->
<!-- // 	Statement st = conn.createStatement(); -->
<!-- // 	String q = "UPDATE order_list SET time_taken = '" + timeTaken + "' WHERE id = 1"; -->
<!-- // 	st.executeUpdate(q); -->
<!-- // 	response.sendRedirect("index.jsp"); -->

</body>
</html>
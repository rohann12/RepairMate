<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="com.database.dbconn"%>
	<%
	try {
		Connection conn = dbconn.getConnection();
		/* String url = "jdbc:mysql://localhost:3306/repairmate";
		String username = "root";
		String password = "";
		Class.forName("com.mysql.jdbc.Driver");
		
		// Create a connection
		Connection conn = DriverManager.getConnection(url, username, password); */

		Statement st = conn.createStatement();
		String fullname = request.getParameter("full-name");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String uname = request.getParameter("user-name");
		String contact = request.getParameter("contact");
		/* int contact=Integer.parseInt(request.getParameter("contact"));
		/* int cont=Integer.parseInt(contact); */
		/* 
		String qry="insert into user(full_name,email,user_name,password)"+
			"values('fullname','email','pass','uname+')"; */
		String qry = "INSERT INTO user (full_name, email, user_name, password,contact) " + "VALUES ('" + fullname + "', '"
		+ email + "', '" + uname + "', '" + pass + "','" + contact + "')";
		st.executeUpdate(qry);
		response.getWriter().println("<script>Data inserted successfully</script>");

		// Redirect to index.html
		response.sendRedirect("index.jsp");
	} catch (Exception e) {
		out.println(e);

	}
	%>
</body>
</html>
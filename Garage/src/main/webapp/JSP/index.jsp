<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>RepairMate</title>
  <link rel="stylesheet" href="../CSS/index.css">
 
</head>
<body style="margin:0px;">
  <!-- Navigation Bar -->
  
  <%
	HttpSession s = request.getSession(false);
	if (s != null && Boolean.TRUE.equals(s.getAttribute("isAdmin"))) {
		
	%>
	<jsp:include page="adminNav.jsp" />
	<%
	} else if (s != null && Boolean.FALSE.equals(s.getAttribute("isAdmin"))) {
	%>
	<jsp:include page="nav.jsp" />
	<jsp:include page="adminDashCus.jsp" />
	<style>
	.landing-page{
	display:none;}
	</style>
	<%
	}
	 else{ %>
	<jsp:include page="nav.jsp"/>
		<% }%>
  <!-- Landing Page Content -->
  <div class="content">
  <div class="landing-page">
    <h1>Welcome to RepairMate!</h1>
    <p></p>
<!--     <div class="cta-buttons"> -->
<!--       <a href="login.jsp">Login</a> -->
<!--       <a href="reg.jsp">Sign Up</a> -->
<!--     </div> -->
  </div>

  <!-- Other content of the landing page -->
  <div class="other-content">
    <h2>About Us</h2>
    <p>At RepairMate, we are dedicated to simplifying the way you manage and optimize your garage operations. Our system offers a comprehensive solution for handling customer interactions, vehicle records, repair tasks, estimated timeframes, and billing.</p>
  </div>
  </div>
</body>
</html>

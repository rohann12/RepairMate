<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<link rel="stylesheet" href="../CSS/reg.css" />
<script src="../Javascript/formValidation.js"></script>
</head>
<body>
 <jsp:include page="nav.jsp" />
	<h2>User Registration</h2>
	<form action="../TESTS/registration.jsp" method="POST" id="signUpForm"
		onsubmit="event.preventDefault();validation();">
		<label for="full-name">Full Name</label> <input type="text"
			id="full-name" placeholder="&#xf007;  Enter your full name"
			name="full-name"><br> <span id="full-name-validation"
			class="error-message"></span> <label for="email">Email</label> <input
			type="text" id="email" placeholder="&#xf0e0;  Enter your email"
			name="email"><br> <span id="email-validation"
			class="error-message"></span> <label for="contact">Contact</label> <input
			type="number" id="contact"
			placeholder="&#xf10b;  Enter your contact number" name="contact"><br>
		<span id="contact-validation" class="error-message"></span> <label
			for="user-name">User Name</label> <input type="text" id="user-name"
			placeholder="&#xf2c2;  Create a user name" name="user-name"><br>
		<span id="user-name-validation" class="error-message"></span> <label
			for="password">Password</label> <input type="password" id="password"
			placeholder="&#xf084;  Create a password" name="password"><br>
		<span id="password-validation" class="error-message"></span> <label
			for="confirm-password">Confirm Password</label> <input
			type="password" id="confirm-password"
			placeholder="&#xf00c;&#xf084;  Confirm your password"
			name="confirm-password"><br> <span
			id="confirm-password-validation" class="error-message"></span> <span
			class="backend-error-message">
			<?= $error_message?>
		</span> <span class="message">
			<?= $message?>
		</span>
		<button type="submit">Register</button>
		<hr>
		<span style="text-align: center"><b>Already have an account</b></span>
		<a href="login.jsp"><button type="button">Proceed to Login</button></a>
	</form>
</body>
</html>

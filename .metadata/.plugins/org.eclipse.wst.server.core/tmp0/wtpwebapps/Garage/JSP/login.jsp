<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login </title>
<link rel="stylesheet" href="../CSS/login.css">
</head>
<body>
<jsp:include page="nav.jsp" />
	<h1>Login Form</h1>
	<form method='POST' action='http://localhost:8080/Garage/login1' id="loginForm">
	

		<label for='user-name'>Username</label> <input type='text'
			placeholder='&#xf007; Enter Username' name="user-name" id="user-name"><br>
		<span class="error-message" id="username-validation"></span> <span
			class='backend-error-message'> <?=$error_msg?>
		</span> <label for='password'>Password</label> <input type='password'
			placeholder='&#xf084; Enter Password' name='password' id="password"><br>
		<span class="error-message" id="password-validation"></span> <span
			class='backend-error-message'> <?=$error_msg2?>
		</span>
		<button type='submit'>Login</button>
		<hr>
		<span style="text-align: center"><b>Don't have an account</b></span> <a
			href="reg.jsp"><button type="button">Create an
				account</button></a>

	</form>

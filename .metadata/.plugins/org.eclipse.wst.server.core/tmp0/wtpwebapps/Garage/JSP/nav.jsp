<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<style>
nav {
  background-color: #333;
  padding: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.navbar-logo img {
  height: 40px;
}

.navbar-links ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.navbar-links li {
  margin-right: 20px;
}

.navbar-links li a {
  color: #fff;
  text-decoration: none;
  font-size: 16px;
  font-size: 20px;
    margin-right: 20px;


}

.navbar-links li a:hover {
  color: #ff6600;

}
.navbar-logo{
margin-top:8px;
}
</style>
<nav>
  <div class="navbar-logo">
    
      <a href=index.jsp><img src="../Contents/logo.png" alt="Logo"></a>
      
   
  </div>
  <div class="navbar-links">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="order.jsp">Services</a></li>
    
       <%-- Checking session to determine login/logout links --%>
      <%
        HttpSession s = request.getSession(false);
        if (s != null && s.getAttribute("username") != null) {
          // User is logged in, show logout link
          %>
          <li class="jobs"><a href="jobs.jsp">Jobs</a></li>
          <li class="logout"><a href="logout.jsp">Logout</a></li>
          
          <%
        } else {
          // User is not logged in, show login link
          %>
          <li class="login"><a href="login.jsp">Login</a></li>
          <li class="Signup"><a href="reg.jsp">Signup</a></li>
          <%
        }
      %>
    </ul>
  </div>
</nav>

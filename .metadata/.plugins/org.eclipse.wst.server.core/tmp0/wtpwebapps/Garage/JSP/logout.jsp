<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
   // Retrieve the session object
   HttpSession s = request.getSession(false);

   // Invalidate the session if it exists
   if (session != null) {
      s.invalidate();
   }

   // Redirect the user to the login page
   response.sendRedirect("index.jsp");
%>

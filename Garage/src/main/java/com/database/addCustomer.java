package com.database;

import java.io.IOException;
import java.sql.Connection;

import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addCustomer extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//For testing connectivity and data insertions
		System.out.println("Customer added");
		try {
			Connection conn = dbconn.getConnection();
			Statement st = conn.createStatement();

			String fullname = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String uname = request.getParameter("user-name");
			String contact = request.getParameter("contact");

			String qry = "INSERT INTO customers (full_name, email, user_name, password, contact) VALUES ('" + fullname
					+ "', '" + email + "', '" + uname + "', '" + pass + "','" + contact + "')";
			st.executeUpdate(qry);

			response.getWriter().println("<script>Data inserted successfully</script>");

			// Redirect to index.jsp
			response.sendRedirect("/Garage/JSP/index.jsp");
		} catch (Exception e) {
			e.printStackTrace(); // It's recommended to log the exception instead of printing to the response
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("working");
	}
}

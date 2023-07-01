package com.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("user-name");
		String password = request.getParameter("password");

		Connection conn = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			// Establish a database connection
		     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/repairmate", "root", "");
			// Create the SQL statement
			String query = "SELECT * FROM user WHERE user_name = ? AND password = ?";

			// Create a prepared statement
			statement = conn.prepareStatement(query);
			// Set the parameters
			statement.setString(1, username);
			statement.setString(2, password);

			// Execute the query
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				// Check the value of the is_admin column
				int isAdmin = resultSet.getInt("is_admin");

				// Start a session and store the user information
				HttpSession session = request.getSession();
				session.setAttribute("username", username);

				// Redirect to admin dashboard or a different page for non-admin users
				if (isAdmin == 1) {
					session.setAttribute("isAdmin", true);
					response.sendRedirect("adminDash.jsp");
				} else {
					session.setAttribute("isAdmin", false);
					response.sendRedirect("../JSP/index.jsp");
				}
			} else {
				// Invalid login credentials, display an error message
				PrintWriter out = response.getWriter();
				out.println("<p>Invalid username or password.</p>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Close the database resources
			try {
				if (resultSet != null)
					resultSet.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		System.out.print("This is a servlet");
	}
}

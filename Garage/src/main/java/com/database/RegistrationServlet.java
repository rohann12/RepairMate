package com.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registrationServlet")
public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection conn = dbconn.getConnection();

            Statement st = conn.createStatement();
            String fullname = request.getParameter("full-name");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String uname = request.getParameter("user-name");
            String contact = request.getParameter("contact");

            String qry = "INSERT INTO user (full_name, email, user_name, password, contact) VALUES ('" + fullname + "', '"
                    + email + "', '" + uname + "', '" + pass + "','" + contact + "')";
            st.executeUpdate(qry);
            response.getWriter().println("<script>Data inserted successfully</script>");

            // Redirect to index.jsp
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception accordingly
        }
    }
}

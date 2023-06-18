import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Perform form validation
        if (fullName.isEmpty() || email.isEmpty() || contact.isEmpty() || username.isEmpty() || password.isEmpty()) {
            // Handle form validation error
            response.sendRedirect("register.jsp?error=validation");
            return;
        }

        // Insert data into the database
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DBConn.getConnection();

            String query = "INSERT INTO user_details (full_name, email, contact, username, password) VALUES (?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, fullName);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, contact);
            preparedStatement.setString(4, username);
            preparedStatement.setString(5, password);
            preparedStatement.executeUpdate();

            // Redirect to index.jsp or a different page after successful registration
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database error
            response.sendRedirect("register.jsp?error=database");
        } finally {
            // Close resources
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

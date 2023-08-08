<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.database.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.mail.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Email</title>
    
</head>
<body>
<%
    // Get the id parameter from the URL
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = dbconn.getConnection();
    Statement stmt = conn.createStatement();

    // Retrieve customer's email from order_list where id matches
    String query = "SELECT email FROM order_list WHERE order_id=" + id;
    ResultSet rs = stmt.executeQuery(query);
    if (rs.next()) {
        String customerEmail = rs.getString("email");

        // Email configuration
        String host = "smtp.gmail.com"; // Example: for Gmail SMTP server
        String port = "587"; // Example: for TLS
        String username = "anyonefor4u@gmail.com"; // Your email
        String password = "cjrbbebkpygbjatq"; // Your email password

        // Sender's email
        String senderEmail = "anyonefor4u@gmail.com"; // Your email
        String senderName = "RepairMate"; // Your name

        // Email subject and content
        String subject = "Your Repair Order is Complete";
        String content = "Dear Customer,\n\nYour repair order has been completed.";

        // Set up mail properties
        java.util.Properties props = new java.util.Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);

        // Create a session with the SMTP server
        final String finalUsername = username;
        final String finalPassword = password;

        Session session1 = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(finalUsername, finalPassword);
                }
            });

        try {
            // Create a MimeMessage object
            MimeMessage message = new MimeMessage(session1);

            // Set the sender's email and recipient's email
            message.setFrom(new InternetAddress(senderEmail, senderName));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(customerEmail));

            // Set the email subject and content
            message.setSubject(subject);
            message.setText(content);

            // Send the email
            Transport.send(message);
            out.println("Email sent successfully.");
        } catch (Exception e) {
            out.println("Error sending email: " + e.getMessage());

            // Log the stack trace using JspWriter
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            out.println("<pre>" + sw.toString() + "</pre>");
        }
    } else {
        out.println("Customer email not found.");
    }

    // ... (remaining code)
%>
</body>
</html>

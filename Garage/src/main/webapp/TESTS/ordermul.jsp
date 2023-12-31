<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.database.*" %>
<%@ page import="java.sql.*" %>
<%
  try {
    Connection conn = dbconn.getConnection();
    Statement st = conn.createStatement();

    String customerName = request.getParameter("customer_name	");
    String[] jobs = request.getParameterValues("jobs[]");

    if (jobs == null || jobs.length == 0) {
      response.getWriter().println("<script>alert('At least one job is required'); window.history.back();</script>");
      return;
    }

    // Check if any job entry is empty
    boolean allJobsEmpty = true;
    for (String job : jobs) {
      if (!job.isEmpty()) {
        allJobsEmpty = false;
        break;
      }
    }

    if (allJobsEmpty) {
      response.getWriter().println("<script>alert('At least one job is required'); window.history.back();</script>");
      return;
    }

    // Concatenate job entries into a single string
    String concatenatedJobs = String.join(". ", jobs);

    // Insert the customer name and concatenated jobs into the database
    String query = "INSERT INTO mul (customer_name, jobs) VALUES (?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, customerName);
    pstmt.setString(2, concatenatedJobs);
    pstmt.executeUpdate();

    response.getWriter().println("<script>Data inserted successfully</script>");

    // Redirect to index.jsp
    response.sendRedirect("index.jsp");
  } catch (Exception e) {
    out.println(e);
  }
%>
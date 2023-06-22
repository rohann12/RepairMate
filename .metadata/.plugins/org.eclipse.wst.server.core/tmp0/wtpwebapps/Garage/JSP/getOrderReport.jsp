<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.database.dbconn" %>

<%
   String startDate= request.getParameter("startDate");
   String endDate = request.getParameter("endDate");
    
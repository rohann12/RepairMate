package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class dbconn {
    private static Connection conn;

    static {
        String url = "jdbc:mysql://localhost:3306/repairmate";
        String username = "root";
        String password = "";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Database connected");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static Connection getConnection() {
        return conn;
    }
    
    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Database connection closed");
            }
        } catch (SQLException e) {
            System.out.println("Error while closing the database connection: " + e.getMessage());
        }
    }
}
 

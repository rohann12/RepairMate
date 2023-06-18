package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

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

}
 

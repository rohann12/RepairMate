package com.database;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;



import com.mysql.jdbc.PreparedStatement;
public class test{
	
	public static void main(String[] args){
		
		Connection conn1= dbconn.getConnection();
		 
		 try {
			 if(conn1!=null) {
		
	            // Use the connection object to execute queries and perform database operations
				
		            System.out.println("Database connected");
		            String sqlQuery = "SELECT * FROM user";
		            PreparedStatement statement = (PreparedStatement) conn1.prepareStatement(sqlQuery);
		            ResultSet resultSet = statement.executeQuery();

		            while (resultSet.next()) {
		                // Retrieve and process the data from the result set
		                int id = resultSet.getInt("user_id");
		                String name = resultSet.getString("user_name");
		                // Do something with the retrieved data
		                System.out.println("ID: " + id + ", Name: " + name);
		                }
			 }else {
				 System.out.println("error connection");
			 }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	
	}
	
}

package org.zvandiri.reports;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtils {

	private static Connection connection;
	private static Statement statement;
	public static final String location="Reports/";
	//public static final String location="/home/zvandiri/reports/Reports/";
	
	public static ResultSet excecute(String query) {
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/zvandiri","zvandiri","zvandiri2019");  
			return connection.createStatement().executeQuery(query);   
		}catch(Exception e) {
			e.printStackTrace();
		}
//		finally {
//			try {
//				connection.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
		return null;
	}
	
	
	
	public static ResultSet createResults(Statement state, String query) throws SQLException {
		state.executeQuery(query);  
		return null;
	}
	
	
}

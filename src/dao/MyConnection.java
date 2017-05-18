package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MyConnection {

	// Database driver name and database url
	public static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	public static final String DB_URL = "jdbc:mysql://localhost/onlinehospitalinformationsystem";

	// Database credentials
	public static final String USER = "vaibhav";
	public static final String PASSWORD = "vaibhav";

	
	static Connection con=null;
	static Statement statement=null;
	public Statement OpenConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			statement=con.createStatement();
			System.out.println("Connection open");			
		} catch (Exception e) {
			System.out.println(e);
		}
		return statement;
	}
	
	public void CloseConnection()
	{
		try
		{
		//con.commit();
	      statement.close();
	      con.close();
	      System.out.println("Connection Closed...");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}

package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection()
	{
		String url = "jdbc:mysql://localhost:3306/techblog?autoReconnect=true&useSSL=false";
		String username = "root";
		String password = "root";
		try {
			if(con == null)
			{
				//load the driver class here
				Class.forName("com.mysql.jdbc.Driver");
				//Create a connection
				con= DriverManager.getConnection(url, username, password);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}

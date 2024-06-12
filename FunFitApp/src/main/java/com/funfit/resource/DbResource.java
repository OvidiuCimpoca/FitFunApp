package com.funfit.resource;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbResource {
	public static Connection getDbConnection () {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/course2_db", "root", "123");
			return con;
		} catch (Exception e) {
			System.err.println(e);
			return null;
		}
	}
}

package com.tnbpda.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBUtil {

	public static void main(String[] args) {
		getConnection();
	}

	public static Connection getConnection() {
		Connection con;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/TNBPDA_DB", "root", "root123");

		} catch (Exception e) {
			con = null;
		}

		return con;
	}

	public static void closeConnection(Connection con, Statement stmt,
			ResultSet rs) {
		try {
			con.close();
			stmt.close();
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

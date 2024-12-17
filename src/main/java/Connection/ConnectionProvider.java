package Connection;

import java.sql.*;

public class ConnectionProvider {

	private static String url = "jdbc:mysql://localhost:3306/hospitaldb";
	private static String user = "root";
	private static String Pass = "Lahiru@123";
	private static Connection con;

	public static Connection getConnection() {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, Pass);

		} catch (Exception e) {

			System.out.println("Database connection is not succesfull");

		}

		return con;

	}
}

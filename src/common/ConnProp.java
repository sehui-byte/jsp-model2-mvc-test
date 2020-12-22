package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public abstract class ConnProp {
	public static final String ORCL_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String ORCL_USER = "ksh00";
	public static final String ORCL_PASS = "orcl00";
	public static final String ORCL_DRIVER = "oracle.jdbc.driver.OracleDriver";


	public static Connection getConnection() {
		Connection conn = null;
		try {

			Class.forName(ConnProp.ORCL_DRIVER);
			conn = DriverManager.getConnection(ConnProp.ORCL_URL,ConnProp.ORCL_USER,ConnProp.ORCL_PASS);
		} catch (Exception c) {
			System.out.println("c.getMessage() >> " + c.getMessage());

		}
		return conn;
	}


	public static void connClose(Connection conn, PreparedStatement pstmt, ResultSet rsRs) {
		if (rsRs != null) {

			try {
				rsRs.close();
				rsRs = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}

		}

		if (conn != null) {
			try { 
				conn.close();
				conn = null;

			} catch (Exception e) {

				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}
	}

	public static void connClose(Connection conn, PreparedStatement pstmt) {
		if (pstmt != null) {
			try { 
				pstmt.close();
				pstmt = null;
			} catch (Exception e) {
				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}

		}

		if (conn != null) {
			try { 
				conn.close();
				conn = null;

			} catch (Exception e) {

				System.out.println("e.getMessage() >>> : " + e.getMessage());
			}
		}
	}
}
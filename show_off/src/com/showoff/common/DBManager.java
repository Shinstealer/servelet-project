package com.showoff.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {
	//인스턴스의 주소를 저장하기 위한 참조 변수
	private static Connection conn;
	
	private static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private static String USER = "java";
	private static String PASS = "1234";	
	
	private DBManager() {
	}
	
	public static Connection getConnection() {
		conn = null;
		
		if(conn == null) {
			try {
				Class.forName(DRIVER);
				conn= DriverManager.getConnection(URL,USER,PASS);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//  insert 문
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	



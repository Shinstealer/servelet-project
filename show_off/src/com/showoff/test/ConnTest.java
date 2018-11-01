package com.showoff.test;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnTest {
	private static Connection conn;
	private static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private static String USER = "java";
	private static String PASS = "1234";
	
	@Test
	public void testGetConnection() {
		conn = null;
		
		if(conn == null) {
			try {
				Class.forName(DRIVER);
				conn= DriverManager.getConnection(URL,USER,PASS);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}

}

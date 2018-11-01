package com.showoff.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {

	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/showoff/mybatis/Configuration.xml";
		
		//입출력할 때 예외처리 사용
		try {
			//Reader로 xml파일을 읽어옴
			Reader reader = Resources.getResourceAsReader(resource);
			
			//sqlSessionFactory에 mybatis설정값이 다 들어감
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
}

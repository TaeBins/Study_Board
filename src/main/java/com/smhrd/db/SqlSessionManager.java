package com.smhrd.db;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	//5. SqlSessionFactory : Connection객체 모음
	
	//static 블록 : 무조건 한번 실행되는 영역
	//DB를 **미리** 연결하는 동작 (Connection Pool;CP)
	//Connection 부분이 가장 자원소모가 많다
	//mybatis는 자원소모를 줄이기 위해서 connection객체를 미리 생성 
	
	
	static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/smhrd/db/config.xml"; //config.xml의 경로
			InputStream inputStream = Resources.getResourceAsStream(resource);//xml파일 읽어들이기
			//sqlsession = connection
			//sqlsessionfactory = connection을 여러개 가지고 있는 공장 
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}
	//DAO에서 sqlsessionFactory 사용하기 위해 메소드 생성 대소문자 
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}

}

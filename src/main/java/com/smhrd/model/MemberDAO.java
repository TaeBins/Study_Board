package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class MemberDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public Member login(Member m) {
		//세션생성
		SqlSession session = sqlSessionFactory.openSession(true);
		
		//select (한 행만)
		Member info = session.selectOne("com.smhrd.db.MemberMapper.login", m);
		session.close();
		
		return info;
	}
}

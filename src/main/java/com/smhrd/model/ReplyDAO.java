package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class ReplyDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public int insertReply(Reply rvo) {
		// 세션생성
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.ReplyMapper.insertReply", rvo);
		session.close();
		
		return cnt;
	}
	
	// 특정 게시물에 작성된 모든 댓글 가지고오는 메서드
	public List<Reply> selectAllReply(int boardnum) {
		// 세션생성
		SqlSession session = sqlSessionFactory.openSession(true);
		List<Reply> list = session.selectList("com.smhrd.db.ReplyMapper.selectAllReply", boardnum);
		session.close();
		
		return list;
	}
}

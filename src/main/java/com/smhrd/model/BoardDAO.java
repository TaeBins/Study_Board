package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class BoardDAO {

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public List<Board> selectAllBoard() {
		// 세션생성
		SqlSession session = sqlSessionFactory.openSession(true);

		// select (한 행만)
		List<Board> list = session.selectList("com.smhrd.db.BoardMapper.selectAllBoard");
		session.close();

		return list;
	}

	// 게시물 삽입메소드
	public int insertBoard(Board bvo) {
		// 세션생성
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.insert("com.smhrd.db.BoardMapper.insertBoard", bvo);
		session.close();
		
		return cnt;
	}
	
	// 한 게시물 정보만 조회
	public Board selectOneBoard(int num) {
		// 세션생성
		SqlSession session = sqlSessionFactory.openSession(true);

		// select (한 행만)
		Board board = session.selectOne("com.smhrd.db.BoardMapper.selectOneBoard", num);
		session.close();

		return board;
	}
}

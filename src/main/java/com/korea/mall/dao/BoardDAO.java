package com.korea.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.BoardDTO;
import com.korea.mall.dto.UserDTO;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class BoardDAO {
	
	private final SqlSession sqlSession;
	
	public Object selectList(BoardDTO param){
		return sqlSession.selectList("board.selectList" , param);
	}
	
	public BoardDTO selectOne(BoardDTO param) {
		return sqlSession.selectOne("board.selectOne", param);
	}
	
	public String selectKey() {
		return sqlSession.selectOne("board.selectkey");	}
	
	public int insertBase(BoardDTO param) {
		return sqlSession.insert("board.insertBase", param);
	}
	
	public int insertDtls(BoardDTO param) {
		return sqlSession.insert("board.insertDtls", param);
	}
	
	public int updateBase(BoardDTO param) {
		return sqlSession.update("board.updateBase", param);
	}
	
	public int updateDtls(BoardDTO param) {
		return sqlSession.update("board.updateDtls", param);
	}
	
	
	
}

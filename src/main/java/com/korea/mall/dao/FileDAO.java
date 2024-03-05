package com.korea.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korea.mall.dto.BoardDTO;
import com.korea.mall.dto.FileDTO;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class FileDAO {
	
	private final SqlSession sqlSession;
	
	public BoardDTO selectOne(FileDTO param) {
		return sqlSession.selectOne("file.selectOne", param);
	}
	
	public int insert(FileDTO param) {
		return sqlSession.insert("file.insert", param);
	}
	
	public int update(FileDTO param) {
		return sqlSession.update("file.update", param);
	}
}

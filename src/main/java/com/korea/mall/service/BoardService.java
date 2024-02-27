package com.korea.mall.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.korea.mall.dao.BoardDAO;
import com.korea.mall.dto.BoardDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardDAO boardDao;
	
	public List<Object> selectList(BoardDTO param){
		return (List<Object>) boardDao.selectList(param);
	}
	
	
	public BoardDTO selectOne(BoardDTO param) throws Exception {
	
		if("".equals( param.getSeq()) || null == param.getSeq()) {
			//TODO:exception 클래스 추후 변경 하거나 exception handler 변경
			throw new Exception("필수값 seq가 없습니다.");
		}
		
		return boardDao.selectOne(param);
	}
	
}

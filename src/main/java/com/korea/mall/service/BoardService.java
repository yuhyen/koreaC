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
	
	public List<Object> selectList(HashMap<String, Object> param){
		return (List<Object>) boardDao.selectList(param);
	}
	
	public BoardDTO selectOne(BoardDTO param) {
	
		if("".equals( param.getSeq()) || null == param.getSeq()) {
			
//			throw new Exception("�ʼ��� seq�� �����ϴ�.");
			return null;
		}
		
		return boardDao.selectOne(param);
	}
	
	
	public BoardDTO insert(BoardDTO param) {
		
		String seq = "";
		String reply = "";
		String crtr = "";
		String deep = "";
		String imgPath = "";
		
		if(param.getSeq() == null || param.getSeq().equals("")) {
			seq = boardDao.selectKey();
			reply = seq;
			
		}else if(param.getSeq() != null || !param.getSeq().equals("")) {
			seq = param.getSeq();
			reply  = boardDao.selectReply(seq);
		}
		crtr = param.getCrtr() == null ? reply : param.getCrtr();
		deep = param.getDeep() == null ? reply : param.getDeep();
		imgPath = param.getImgPath() == null ? "" : param.getImgPath();
		
		param.setSeq(seq);
		param.setCrtr(crtr);
		param.setReply(reply);
		param.setDeep(deep);
		param.setImgPath(imgPath);
		
		boardDao.insertBase(param);
		boardDao.insertDtls(param);
		
		return param;
	}
	
}

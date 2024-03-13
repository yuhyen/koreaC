package com.korea.mall.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.korea.mall.dao.BoardDAO;
import com.korea.mall.dto.BoardDTO;
import com.korea.mall.dto.pagingDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardDAO boardDao;
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	public Object selectPage(HashMap<String, Object> param){
		
		HashMap<String, Object> output = new HashMap<String, Object>();
		int totalCnt = boardDao.selectCnt(param);
		int nowPage = param.get("pageNo") == null ? 0 :(int) param.get("pageNo");
		int cntPerPage = param.get("cntPerPage") == null ? 0 :(int) param.get("cntPerPage");
		
		if (nowPage == 0 && cntPerPage == 0) {
			nowPage = 1;
			cntPerPage = 10;
		} else if (nowPage == 0) {
			nowPage = 1;
		} else if (cntPerPage == 0) { 
			cntPerPage = 10;
		}
		
		pagingDTO pagingDTO = new pagingDTO(totalCnt, nowPage, cntPerPage);
		
//		searchKey 검색어
//		searchType 검색 종류 SUBJECT , NAME ;
		
		
		param.put("start", pagingDTO.getStart());
		param.put("end", pagingDTO.getEnd());
		output.put("list" , boardDao.selectPage(param)) ;
		output.put("page" , pagingDTO) ;
		
		return output;
		
	}
	
	public List<Object> selectList(HashMap<String, Object> param){
		return (List<Object>) boardDao.selectList(param);
	}
	
	
	public Object selectDetail(BoardDTO param) {
		String reply = param.getReply() == null || param.getReply().equals("") ?  "1" : param.getReply();
		param.setReply(reply);
		return boardDao.selectDetail(param);
	}
	
	
	public BoardDTO selectOne(BoardDTO param) {
	
		if("".equals( param.getSeq()) || null == param.getSeq()) {
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
		}else if(param.getSeq() != null || !param.getSeq().equals("")) {
			seq = param.getSeq();
		}
		reply  = boardDao.selectReply(seq);
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

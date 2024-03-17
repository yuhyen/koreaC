package com.korea.mall.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.korea.mall.common.Common;
import com.korea.mall.dao.BoardDAO;
import com.korea.mall.dto.BoardDTO;
import com.korea.mall.dto.pagingDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardDAO boardDao;
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);

	public Object selectPage(HashMap<String, Object> param) {

		HashMap<String, Object> output = new HashMap<String, Object>();
		String category = (String) param.get("category");
		int totalCnt;
		int nowPage = param.get("pageNo") == null ? 0 : (int) param.get("pageNo");
		int cntPerPage = param.get("cntPerPage") == null ? 0 : (int) param.get("cntPerPage");
		//카테고리별 공지노출 로직
		switch (category) {
		case Common.BoardConst.Q_N_A:
			param.put("showNotice", "A");
			break;
		case Common.BoardConst.REVIEW:
			param.put("showNotice", "N");
			
			break;
		case Common.BoardConst.NOTICE:
			param.put("showNotice", "Y");
			break;
			
		}
		totalCnt = boardDao.selectCnt(param);

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
		
		output.put("list", boardDao.selectPage(param));
		output.put("page", pagingDTO);

		return output;

	}

	public List<Object> selectList(HashMap<String, Object> param) {
		return (List<Object>) boardDao.selectList(param);
	}

	public Object selectDetail(BoardDTO param) {
		return boardDao.selectDetail(param);
	}

	public BoardDTO selectOne(BoardDTO param) {

		if ("".equals(param.getSeq()) || null == param.getSeq()) {
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

		if (param.getSeq() == null || param.getSeq().equals("")) {
			seq = boardDao.selectKey();
		} else if (param.getSeq() != null || !param.getSeq().equals("")) {
			seq = param.getSeq();
		}
		reply = boardDao.selectReply(seq);
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
	public BoardDTO update(BoardDTO param) {
		
		if(param.getImgPath() == null) {
			param.setImgPath("");
		}
		
		if(param.getReply() != null && param.getReply().equals("1")) {
			//upate base\
			boardDao.updateBase(param);
		}
		boardDao.updateDtls(param);
		
		return param;
	}
	
	public BoardDTO reply(BoardDTO param) {
		
		String reply = "";
		String crtr = "";
		String deep = "";
		String imgPath = "";
		
		reply = boardDao.selectReply(param.getSeq());
		crtr = param.getCrtr() == null ? reply : param.getCrtr();
		deep = param.getDeep() == null ? reply : param.getDeep();
		imgPath = param.getImgPath() == null ? "" : param.getImgPath();

		param.setCrtr(crtr);
		param.setReply(reply);
		param.setDeep(deep);
		param.setImgPath(imgPath);

		boardDao.insertDtls(param);
		
		return param;
	}

}

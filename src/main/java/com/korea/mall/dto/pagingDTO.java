package com.korea.mall.dto;

import lombok.Data;

@Data
public class pagingDTO {
	// �쁽�옱�럹�씠吏�, �떆�옉�럹�씠吏�, �걹�럹�씠吏�, 寃뚯떆湲� 珥� 媛��닔, �럹�씠吏��떦 湲� 媛��닔, 留덉�留됲럹�씠吏�, SQL荑쇰━�뿉 �벝 start, end
	private int nowPage;
	private int startPage;
	private int endPage;
	private int total;
	private int cntPerPage;
	private int lastPage;
	private int start;
	private int end;
	private int cntPage = 5;
	
	public pagingDTO() {
	}
	public pagingDTO(int total, int nowPage, int cntPerPage) {
		
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	// �젣�씪 留덉�留� �럹�씠吏� 怨꾩궛
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// �떆�옉, �걹 �럹�씠吏� 怨꾩궛
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(((nowPage-1)/cntPage)*cntPage+1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 荑쇰━�뿉�꽌 �궗�슜�븷 start, end媛� 怨꾩궛
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
}
package com.showoff.dto;

//검색기준 또는 분류기준
public class CriteriaDTO {
	private int page;
	private int perPageNum;
	private String keyword;
	private String flag;
	
	public CriteriaDTO() {
		
		this.page = 1;
		this.perPageNum = 10;
	}

	public CriteriaDTO(int page, int perPageNum, String keyword) {
		super();
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	//method for MyBatis SQL Mapper:조회 시작 row 취득하는 메서드
	public int getPageStart() {
		return (((this.page-1)*perPageNum)+1);
	}
	
	//method for MyBatis SQL Mapper:조회 마지막 row 취득하는 메서드
	public int getPerPageNum() {
		return this.page*perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "CriteriaDTO [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", flag=" + flag
				+ "]";
	}
	
	
}

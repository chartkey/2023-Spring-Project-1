package com.vitalchoice.web.list;

public class PageDTO {
	//현재페이지, 시작페이지, 끝페이지, 레코드 총 개수, 페이지당 레코드 수, 전체 페이지 수, 쿼리문에서 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	//123456 한 화면에 몇 페이지씩 보여줄 건지..
	private int cntPage = 10; // 3개씩 보여준다..
	public PageDTO(int nowPage, int total, int cntPerPage) {
		//현재페이지, 총 레코드 수, 한 페이지당 보여줄 레코드 수를 받아온다.. 나머지 변수들은 이를 통해 구한다.
		this.nowPage = nowPage;
		this.total = total;
		this.cntPerPage = cntPerPage;
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), getCntPage());
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	private void calcLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total/(double)cntPerPage));
	}
	private void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage/(double)cntPage))*cntPage);
		if(getLastPage()<getEndPage())
			setEndPage(getLastPage());
		setStartPage(getEndPage()-cntPage+1);
		if(getStartPage()<1)
			setStartPage(1);
	}
	//얘는 한페이지당 불러올.. 시작 레코드 끝 레코드를 정하는 것!!
	private void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);//2페이지라면 2*3=6번째 게시물까지 불러와라
		setStart(getEnd()-cntPerPage+1);// 6-3+1 =4 번째부터 불러와라
	}
	public PageDTO() {
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCntPerPage() {
		return cntPerPage;
	}
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
}
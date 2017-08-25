package com.javalec.tea_pjt.service.board;

public class Pager2 {
	
	private final int PAGE_SCALE = 10;
	private final int BLOCK_SCALE = 10;
	private int curPage;
	private int prePage;
	private int nextPage;
	private int curBlock;
	private int preBlock;
	private int nextBlock;
	private int beginPage;
	private int endPage;
	private int beginBlock;
	private int endBlock;
	private int totPage;
	private int totBlock;
	
	public Pager2(int count,int curPage) {
		
		this.curPage = curPage;
		
		setTotPage(count);
		
		setPageRange();
		
		setTotBlock();
		
		setBlockRange();
		
	}
	
	private void setPageRange() {
		beginPage = (curPage -1) * PAGE_SCALE+1;
		endPage = beginPage+PAGE_SCALE -1;
		
	}

	
	private void setBlockRange() {
		curBlock = 1;
		
	}


	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPreBlock() {
		return preBlock;
	}
	public void setPreBlock(int preBlock) {
		this.preBlock = preBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getBeginBlock() {
		return beginBlock;
	}
	public void setBeginBlock(int beginBlock) {
		this.beginBlock = beginBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		this.totPage = (int) (Math.ceil(count*1.0)/PAGE_SCALE);
	}
	public int getTotBlock() {
		return totBlock;
	}
	public void setTotBlock() {
		this.totBlock = (int) (Math.ceil(totPage*1.0)/BLOCK_SCALE);
	}
	
	
	
}

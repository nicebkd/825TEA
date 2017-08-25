package com.javalec.tea_pjt.model.board.dto;

import java.util.Arrays;
import java.util.Date;

public class BoardVo {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate; //java.util.Date;
	private int viewcnt;
	private String user_name;
	private int cnt;
	private String show;
	private String[] files;
	
	public void setFiles(String[] files) {
		this.files = files;
	}
	
	public String[] getFiles() {
		return files;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}


	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + ", viewcnt=" + viewcnt + ", user_name=" + user_name + ", cnt=" + cnt + ", show=" + show
				+ ", files=" + Arrays.toString(files) + "]";
	}
	
	
	
	

}

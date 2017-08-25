package com.javalec.tea_pjt.model.board.dto;

import java.sql.Date;

public class ReplyVo {
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private String user_name;
	private Date regdate;
	private Date updatedate;
	private String secret_reply;
	private String writer;

	public String getSecret_reply() {
		return secret_reply;
	}

	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}

	public Integer getRno() {
		return rno;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}


	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "ReplyVo [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", user_name=" + user_name + ", regdate=" + regdate + ", updatedate=" + updatedate + ", secret_reply="
				+ secret_reply + ", writer=" + writer + "]";
	}
	
	

}

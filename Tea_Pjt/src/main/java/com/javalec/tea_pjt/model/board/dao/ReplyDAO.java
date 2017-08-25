package com.javalec.tea_pjt.model.board.dao;

import java.util.List;

import com.javalec.tea_pjt.model.board.dto.ReplyVo;


public interface ReplyDAO {
	public List<ReplyVo> list(Integer bno,int start,int end);
	public void create(ReplyVo vo);
	public void update(ReplyVo vo);
	public void delete(Integer rno);
	public int count(int bno);
	public ReplyVo detail(int rno);
	
}

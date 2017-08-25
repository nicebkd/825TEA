package com.javalec.tea_pjt.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.javalec.tea_pjt.model.board.dto.ReplyVo;


public interface ReplyService {
	public List<ReplyVo> list(Integer bno,int start,int end,HttpSession session);
	public void create(ReplyVo vo);
	public void updaet(ReplyVo vo);
	public void delete(Integer rno);
	public int count(int bno);
	public ReplyVo detail(int rno);
}

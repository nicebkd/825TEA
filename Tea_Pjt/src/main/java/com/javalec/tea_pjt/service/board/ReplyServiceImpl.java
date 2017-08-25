package com.javalec.tea_pjt.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.javalec.tea_pjt.model.board.dao.ReplyDAO;
import com.javalec.tea_pjt.model.board.dto.ReplyVo;
import com.javalec.tea_pjt.model.member.dto.MemberDTO;


@Repository
public class ReplyServiceImpl implements ReplyService{

	@Inject
	ReplyDAO replyDao;
	
	@Override
	public List<ReplyVo> list(Integer bno,int start,int end,HttpSession session) {
		
		List<ReplyVo> items = replyDao.list(bno,start,end);
		//현재 사용자
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		String userid=dto.getUser_id(); 
		for(ReplyVo vo : items){
			if(vo.getSecret_reply().equals("y")){
				 if(userid == null){
					 vo.setReplytext("비밀 댓글입니다.");
				 }else{
					 //게시물 작성자
					 String writer = vo.getWriter();
					 //댓글 작성자
					 String replyer = vo.getReplyer();
					 if(!userid.equals(writer) &&
							 !userid.equals(replyer)){
						 vo.setReplytext("비밀 댓글입니다.");
					 }
				 }
			}

		}
		
		return items;
		
	}

	@Override
	public void create(ReplyVo vo) {
		replyDao.create(vo);		
	}

	@Override
	public void updaet(ReplyVo vo) {
		replyDao.update(vo);
	}

	@Override
	public void delete(Integer rno) {
		replyDao.delete(rno);
	}

	@Override
	public int count(int bno) {
		
		return replyDao.count(bno);
	}

	@Override
	public ReplyVo detail(int rno) {
		
		return replyDao.detail(rno);
	}

}

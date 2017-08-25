package com.javalec.tea_pjt.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.javalec.tea_pjt.model.board.dto.ReplyVo;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	 
	
	@Override
	public List<ReplyVo> list(Integer bno,int start,int end) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("bno",bno);
		map.put("start",start);
		map.put("end",end);
		
		return sqlSession.selectList("reply.listReply",map);
	}

	@Override
	public void create(ReplyVo vo) {
		 
		sqlSession.insert("reply.insertReply",vo);
	}

	@Override
	public void update(ReplyVo vo) {
		sqlSession.update("reply.update",vo);		
	}

	@Override
	public void delete(Integer rno) {
		sqlSession.delete("reply.delete",rno);
	}

	@Override
	public int count(int bno) {
		
		return sqlSession.selectOne("reply.count",bno);
	}

	@Override
	public ReplyVo detail(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reply.detail",rno);
	}




}

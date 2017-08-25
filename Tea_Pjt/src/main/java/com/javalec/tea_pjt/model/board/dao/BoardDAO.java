package com.javalec.tea_pjt.model.board.dao;


import java.util.List;
import com.javalec.tea_pjt.model.board.dto.BoardVo;


public interface BoardDAO {
	public void addAttach(String fullName);
	public void create(BoardVo vo) throws Exception;
	public BoardVo read(int bno) throws Exception;
	public void update(BoardVo vo) throws Exception;
	public void delete(int bno) throws Exception;
	public List<BoardVo> listAll(int start,int end,String search_option,String keyword) throws Exception;
	public void increaseViewcnt(int bno)throws Exception;
	public int countArticle(String search_option,String keyword)throws Exception;
	
	
}

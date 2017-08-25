package com.javalec.tea_pjt.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.tea_pjt.model.board.dto.BoardVo;
import com.javalec.tea_pjt.model.member.dto.MemberDTO;
import com.javalec.tea_pjt.service.board.BoardService;
import com.javalec.tea_pjt.service.board.Pager;
import com.javalec.tea_pjt.service.board.ReplyService;


@Controller //현재 클래스를 컨트롤 빈으로 등록
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(BoardController.class);
	
	//의존 관계 주입 실제로 만들어지는건 boardServceImpl
	@Inject
	BoardService boardService;
	@Inject
	ReplyService replyService;
	
	@RequestMapping("list.do")
	public @ResponseBody ModelAndView list(@RequestParam(defaultValue="title") String search_option
			,@RequestParam(defaultValue="")String keyword
			,@RequestParam(defaultValue="1")int curPage) throws Exception{
		//레코드수 계산
		int count=boardService.countArticle(search_option, keyword);
		//페이지 나누기 관련 처리
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
				
		
		List<BoardVo> list = boardService.listAll(start,end,search_option,keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list"); //뷰를 list.jsp로 설정
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("count",count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager",pager);
		
		mav.addObject("map",map);
		
		return mav;
		
	}
	
//	@RequestMapping("write.do") 안적을시 기본 get
	//value="url이름" method="전송방식"
	@RequestMapping(value="write.do",method=RequestMethod.GET)
	public String write(){
		return "board/write";
	}
	
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVo vo,
			HttpSession session) throws Exception{
		
		//세션에 저장된 아이디를 조회
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		String writer = dto.getUser_id();
		vo.setWriter(writer);
		boardService.create(vo);
		return "redirect:/board/list.do";
	}
	
//	@RequestParam get/post 방식으로 전달된 변수 1개
//	@ModelAttribute 객체로 저장됨
	@RequestMapping(value="view.do",method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno,
			@RequestParam int curPage,
			@RequestParam String search_option,
			@RequestParam String keyword,
			HttpSession session) throws Exception{
		//조회수 증가처리
		boardService.increaseViewcnt(bno,session);
		//모델(데이터) + 뷰(화면)을 함께 전달하는 객체
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("dto",boardService.read(bno));
		mv.addObject("count",replyService.count(bno));
		mv.addObject("curPage",curPage);
		mv.addObject("search_option",search_option);
		mv.addObject("keyword",keyword);
		return mv;
	}
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute BoardVo vo,Model model) throws Exception{
		
		boardService.update(vo);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception{
		
		boardService.delete(bno);
		return "redirect:/board/list.do";
	}

}

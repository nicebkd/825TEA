package com.javalec.tea_pjt.controller.menu;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.tea_pjt.controller.member.MemberController;
import com.javalec.tea_pjt.model.attendance.dto.AttendanceDTO;
import com.javalec.tea_pjt.model.member.dto.MemberDTO;
import com.javalec.tea_pjt.service.attendance.AttendanceService;
import com.javalec.tea_pjt.service.member.MemberService;

@Controller
@RequestMapping("/menu/*")
public class MenuController {

	private static final Logger logger
	=LoggerFactory.getLogger(MenuController.class);
	
	@Inject
	AttendanceService aService;
	@Inject
	MemberService mService;
	
	@RequestMapping("brand/introduceGongcha.do")
	public String IntroduceGongcha() {
		return "/menu/brand/introduceGongcha";
	}
	
	@RequestMapping("event/attendanceGo.do")
	public String AttendanceGo() {
		
		return "/menu/event/attendance";
	}
	/*@RequestMapping("event/attendance.do")
	public ModelAndView Attendance(ModelAndView mav, HttpSession session){
		MemberDTO mDto = (MemberDTO) session.getAttribute("user");
		String user_id = mDto.getUser_id();
		System.out.println("유저아이디 확인: "+user_id);//OK
		int result = aService.attendance(user_id);//DB에 출석 추가
		System.out.println("디비에 출석 추가: "+result);
		//mav.setViewName("/menu/event/attendance");
		if(result>=1) {//DB에 출석 추가 성공하면
			System.out.println("엥 여기 안돼?");
			AttendanceDTO aDto = aService.userAllAttendance(user_id);
			String atYear = aDto.getAtYear();
			String atMonth = aDto.getAtMonth();
			System.out.println("호호잇 atYear: "+atYear+", atMonth: "+atMonth);
			aDto= aService.monthAttendance(user_id, atYear, atMonth);
			int atCount = aService.atCount(user_id, );
			if(atCount>=1) {
				mav.addObject("msg", "축하합니다! 이번달 쿠폰을 발급받으셨습니다.");
				//mav.setViewName("/menu/event/attendance");
			}	
			int userCount = aService.userCount(user_id);
			if(userCount>=3) {
				mav.addObject("msg", "축하합니다! 회원님의 누적 출석 3회 기념 쿠폰 발급해드립니다.");
				//mav.setViewName("/menu/event/attendance");
			}
			int allCount = aService.allCount();
			if(allCount>=4) {
				mav.addObject("msg", "축하합니다! 전체 회원 누적 출석 4번째 주인공이 되었습니다.");
				//mav.setViewName("/menu/event/attendance");
			}
		}
		return mav;
	}*/
}

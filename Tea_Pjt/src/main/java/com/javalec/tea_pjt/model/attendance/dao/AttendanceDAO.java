package com.javalec.tea_pjt.model.attendance.dao;

import com.javalec.tea_pjt.model.attendance.dto.AttendanceDTO;

public interface AttendanceDAO {
	//출석클릭 시
	public int attendance(String user_id);
	
	//한달 이내의 출석 일
	public AttendanceDTO monthAttendance(String user_id, String atYear, String atMonth);
	
	//한달 이내 출석 수
	public int atCount(String user_id, String atYear, String atMonth);
	
	//유저의 총 출석 수
	public int userCount(String user_id);
	
	//전체 유저들의 총 출석 수
	public int allCount();
	
	//한 유저의 모든 출석정보
	public AttendanceDTO userAllAttendance(String user_id);
}

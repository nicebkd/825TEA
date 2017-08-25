<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@include file="../../include/header.jsp"%>
<%
 String year = null;
 String month = null;
 String day = "01";

 Calendar cal = Calendar.getInstance();
 java.text.DateFormat df = null;

 if ((year = request.getParameter(year)) == null) 
 {
  df = new SimpleDateFormat("yyyy");
  year = df.format(cal.getTime());
 }

 if ((month = request.getParameter(month)) == null) 
 {
  df = new SimpleDateFormat("MM");
  month = df.format(cal.getTime());
 }

 df = new SimpleDateFormat("yyyyMM");
 
 if (df.format(cal.getTime()).equals(year + month)) 
 {
  df = new SimpleDateFormat("dd");
  day = df.format(cal.getTime());
 }
%>

<html>
<head>
<title>출석</title>
<style>
A:link {color: #1f3174; text-decoration: none}
A:active {color: #1f3174; text-decoration: none}
A:visited {color: #1f3174; text-decoration: none}
A:hover {color: #3366cc; text-decoration: underline}

.verdana_b { font-family:verdana, arial; font-size: 9px; font-weight: bold}
.cal_red { font-family:verdana, arial; font-size: 9px; color: #CC0000 }
.cal_blue { font-family:verdana, arial; font-size: 9px; color: #6666CC }
.cal_black { font-family:verdana, arial; font-size: 9px; color: #333333 }
#calDiv{
	text-align: center;
	background: #ffdddd;
}
#buttonDiv{
	text-align: center;
}
</style>
<script>
	$(function(){
		if((${msg})!=null){
			alert(${msg});
		}
	});
</script>
<script>
	function atButton(today){
		if(today<10){
			today = today.replace(/(^0+)/, "");
		}else{
			today = today;
		}
		var dayId = "day"+today;
		document.getElementById(dayId).style.backgroundImage = "url('data:image/jpeg;base64,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')";
		//location.href="attendance.do";
	}
</script>
</head>

<body bgcolor=#FFFFFF text=#000000 leftmargin=20 topmargin=20 marginwidth=20 marginheight=20>
	<%@include file="../../include/menu.jsp"%>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div id="calDiv">
				<table id="table" width=100% border=0 cellspacing=0 cellpadding=0>
					<tr>
						<td>
						<%
						 String prev = null;
						 String next = null;
						
						 if (Integer.parseInt(month) == 1) 
						 {
						  prev = "calendar.jsp?year= + (Integer.parseInt(year) - 1) + &month=12";
						 } 
						 else 
						 {
						  String prevMonth = "0 + (Integer.parseInt(month) - 1)";
						  
						  if (prevMonth.length() == 3) 
						  {
						   prevMonth = prevMonth.substring(1);
						  }
						
						  prev = "calendar.jsp?year= + year + &month= + prevMonth";
						 }
						
						 if (Integer.parseInt(month) == 12) 
						 {
						  next = "calendar.jsp?year= + (Integer.parseInt(year) + 1) + &month=01";
						 } 
						 else 
						 {
						  String nextMonth = "0 + (Integer.parseInt(month) + 1)";
						
						  if (nextMonth.length() == 3) 
						  {
						   nextMonth = nextMonth.substring(1);
						  }
						
						  next = "calendar.jsp?year= + year + &month= + nextMonth";
						 }
						%>
						<table width=100% height=20 border=0 cellspacing=0 cellpadding=0>
						    <tr>
						    <!-- 여기가 년도, 월 타이틀 -->
						     <td align=center valign=middle height=25 background=http://img.cyworld.com/img/icon/popup_back_gray.gif>
						      <font color=#FFFFFF><font face=Verdana, Arial, Helvetica, sans-serif><b>
						      <%=year%>    <%=month%></b></font>  </font>
						     </td>
						    </tr>
						   </table>
						  </td>
						 </tr>
						</table>
						<!-- 캘린더 HEAD -->
						
						<!-- 달력 시작 -->
						<table width=100% border=0 cellspacing=1 cellpadding=3 bgcolor=#999999>
						 <tr bgcolor=#FCFCF3 align=center>
						  <td width=82 height=30 class=verdana_b><font color=#CC0000>Sun</font></td>
						  <td width=82 class=verdana_b><font color=#666666>Mon</font></td>
						  <td width=82 class=verdana_b><font color=#666666>Tue</font></td>
						  <td width=82 class=verdana_b><font color=#666666>Wed</font></td>
						  <td width=82 class=verdana_b><font color=#666666>Thu</font></td>
						  <td width=82 class=verdana_b><font color=#666666>Fri</font></td>
						  <td width=82 class=verdana_b><font color=#6666CC>Sat</font></td>
						 </tr>
						<%
						 cal.set(Integer.parseInt(year), Integer.parseInt(month) - 1 , 1);
						 int indent = cal.get(Calendar.DAY_OF_WEEK);
						 cal.add(Calendar.MONTH, 1);
						 cal.add(Calendar.DATE, -1);
						 int numberOfDays = cal.get(Calendar.DATE);
						
						 for (int i = 1; i < indent; i++) {
						  	if (i == 1) {
						   		out.println("<tr bgcolor='#FFFFFF' valign='top' height='85'>");
						  	}
						  	out.println("<td width='82'></td>");
						 }
						
						//1일 부터 끝날까지 뿌려줌
						 Calendar today = Calendar.getInstance();
						 df = new SimpleDateFormat("yyyyMMdd");
						 
						 for (int i = 1; i <= numberOfDays; i++) 
						 {
						  String cssClass = "cal_black";
						  String dayDescript = "";
						  day = "0" + i;
						
						  if (day.length() == 3) 
						  {
						   day = day.substring(1);
						  }
						
						  if (((indent + i) - 1) % 7 == 1) 
						  {  // 일요일
						   out.println("<tr bgcolor='#FFFFFF' valign='top' height='85'>");
						   cssClass = "cal_red";
						  }
						  else if (((indent + i) - 1) % 7 == 0) 
						  {
						   cssClass = "cal_blue";
						  }
						
						  if (df.format(today.getTime()).equals(year + month + day)) 
						  {//오늘
						   out.println("<td id='day"+i+"' width='82' bgcolor='#F2F2F2'>");
						  }
						  else 
						  {//평일(검정)
						   out.println("<td id='day"+i+"' width='82'>");
						  }
						
						  out.println("<span class=" + cssClass + ">" + i + "</span>");
						  out.println(dayDescript);
						  out.println("</td>");
						  
						  if (((indent + i) - 1) % 7 == 0) 
						  {
						   out.println("</tr>"); //토요일
						  }
						 }
						
						
						 if ( ( (indent == 6) && (numberOfDays > 30) ) || ( (indent == 7) && (numberOfDays > 29) ) ) 
						 {
						  if (41-numberOfDays-indent > 0) 
						  {
						   for (int i = 43 - numberOfDays - indent; i > 0; i--) 
						   {
						    out.println("<td> </td>");
						   }
						  }
						
						  out.println("</tr>");
						 } 
						 else if ( (numberOfDays != 28) || (indent > 1) ) 
						 {
						  if (36-numberOfDays-indent > 0) 
						  {
						   for (int i = 36 - numberOfDays - indent; i > 0; i--) 
						   {
						    out.println("<td> </td>");
						   }
						  }
						  out.println("</tr>");
						 }
					%>
				</table>
			</div>
			<div id="buttonDiv">
			<%	//오늘 날짜 찾기
					Calendar mCal = Calendar.getInstance();
					SimpleDateFormat sdf;
					sdf = new SimpleDateFormat("dd");
					String mDate = sdf.format(mCal.getTime());
					request.setAttribute("mDate", mDate);
			%>
				<input id="atBtn" type="button" value="출석하기" onclick="atButton('${mDate}')">
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>

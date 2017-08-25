<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<table style="width: 700px;">
<c:forEach var="row" items="${list}">
<tr>
	<td>${row.user_name }(<fmt:formatDate value="${row.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>)
	<br>
	${row.replytext}
	<!-- 본인 댓글 수정 -->
	<c:if test="${sessionScope.user.user_id == row.replyer }">
	<input type="button" value="Modify" onclick="showModify('${row.rno}')">
	</c:if>
	</td>
</tr>
</c:forEach>
<!-- 페이지 나누기 -->
	<tr>
		<td>
			<c:if test="${pager.curBlock >1 }">
			<a href="javascript:listReply('${pager.prevPage}')">
			[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="num" begin="${pager.blockBegin }" end="${pager.blockEnd }">
			<c:choose>
				<c:when test="${num ==pager.curPage }">
					<!-- 현재 페이지 -->
					${num }&nbsp;
				</c:when>
				<c:otherwise>
				<!-- 현재 페이지가 아닐때 -->				
				<a href="javascript:listReply('${num }')">${num }&nbsp;</a>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			<c:if test="${pager.curBlock <=pager.totBlock }">
			<a href="javascript:listReply('${pager.nextPage }')">
			다음</a>&nbsp;
			</c:if>
	
</table>
</body>
</html>
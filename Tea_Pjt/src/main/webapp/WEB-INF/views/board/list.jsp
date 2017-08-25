<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			//페이지 주소 변경 이동
			location.href="${path}/board/write.do";
		});
	});
	
function list(page){
	location.href="${path}/board/list.do?curPage="+page
			+"&search_option=${map.search_option}"
			+"&keyword=${map.keyword}";
	
}
	
</script>
</head>
<body>
<%@include file="../include/menu.jsp" %>
<h2>게시판</h2>
<form name="form1" method="post" action="${path }/board/list.do" >
<select name="search_option">
	<option value="all"
	<c:out
	value="${map.search_option=='all'?'selected':''}"/>>이름+내용+제목</option>
	<option value="writer"
	<c:out
	value="${map.search_option=='writer'?'selected':''}"/>>이름</option>
	<option value="content"
	<c:out
	value="${map.search_option=='content'?'selected':''}"/>>내용</option>
	<option value="title" 
	<c:out
	value="${map.search_option=='title'?'selected':''}"/>>제목</option>
</select>
<input name="keyword" value="${map.keyword }">
<input type="submit" value="조회">
<c:if test="${sessionScope.user != null }">
<button type="button" id="btnWrite">글쓰기</button>
</c:if>
</form>
${map.count }개의 게시물이 있습니다.
<table border="1" width="600px">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>이름</td>
		<td>날짜</td>
		<td>조회수</td>		
	</tr> 
	<c:forEach var="row" items="${map.list }">
	<c:choose>
	<c:when test="${row.show =='y' }">
		<!-- show컬럼이 y일때	 -->
			<tr>
			<td>${row.bno }</td>
			<td>
			<a href="${path }/board/view.do?bno=${row.bno}
			&curPage=${map.pager.curPage}
			&search_option=${map.search_option}
			&keyword=${map.keyword}">
			${row.title }</a>
			<!-- 댓글 갯수 출력 -->
			<c:if test="${row.cnt >0 }">
			<span style="color: red">(${row.cnt})</span> 
			</c:if>
			</td>
			<td>${row.user_name }</td>
			<td>
			<fmt:formatDate value="${row.regdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${row.viewcnt }</td>
			
		</tr>
	</c:when>
	<c:otherwise>
		<!-- show 컬럼이 n일때 -->
		<tr>
			<td colspan="5" align="center">
				삭제된 게시물 입니다.
			</td>
		</tr>
	</c:otherwise>
	</c:choose>
	
	</c:forEach>
	<tr>
		<td colspan="5" align="center">
	<c:if test="${map.pager.curBlock >1 }">
		<a href="javascript:list('1')">[처음]</a>
	</c:if>
	<c:if test="${map.pager.curBlock >1 }">
		<a href="javascript:list('${map.pager.prevPage}')">[이전]</a>
	</c:if>
		<c:forEach var="num" begin="${map.pager.blockBegin }"
		end="${map.pager.blockEnd}">
		
		<c:choose>
			<c:when test="${num == map.pager.curPage }">
			<!-- 현재 페이지면 하이퍼링크 제거 -->
			<span style="color: red">${num}</span>&nbsp;
			</c:when>
			<c:otherwise>
			<a href="javascript:list('${num}')">${num}</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		</c:forEach>
		<c:if test="${map.pager.curBlock <=map.pager.totBlock }">
			<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
		</c:if>
		<c:if test="${map.pager.curPage <=map.pager.totPage}">
			<a href="javascript:list('${map.pager.totPage }')">[끝]</a>
		</c:if>
		</td>
	</tr>
</table>
</body>
</html>
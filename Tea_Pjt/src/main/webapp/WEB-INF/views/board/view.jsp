<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		
		//listReply("1");//댓글 목록 불러오기
		listReply_rest("1"); //댓글 목록(rest방식)
		//listReply2();//JSON 리턴방식
		$("#btnReply").click(function() {
			//reply();
			reply_json();
		});
		
		$("#btnDelete").click(function() {
			var count="${count}"; //댓글의 갯수
			if(count >0){
				alert("댓글이 있는 게시물은 삭제 할 수 없습니다.");
				return;
			}
			if(confirm("삭제 하시겠습니까?")){
				document.form1.action=
					"${path}/board/delete.do?bno=${dto.bno}";
					document.form1.submit();
			}		
			
			
		});
		
		$("#btnList").click(function() {
			location.href="${path}/board/list.do?curPage=${curPage}"
			+"&serch_option=${search_option}"
			+"&keyword=${keyword}";
		});
		
		$("#btnUpdate").click(function() {
// 			var writer=document.form1.writer.value;
			var content=document.form1.content.value;
			var title =document.form1.title.value;
			
			/* var write=$("#writer").val();
			var write=$("#content").val();
			var write=$("#title").val(); */
			
			
			if(title==""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			
			if(content==""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			
// 			if(writer==""){
// 				alert("작성자를 입력하세요");
// 				document.form1.writer.focus();
// 				return;
// 			} 
			//수정 주소
			document.form1.action="${path}/board/update.do";
			//폼에 입력한 데이터를 서버로 전송함
			document.form1.submit();

		});
		
		
	});
	
function listReply(num) {
	$.ajax({
		type :"get",
		url : "${path}/reply/list.do?bno=${dto.bno}&curPage="+num,
		success : function(result) {
			// responseText가 result에 저장됨
			$("#listReply").html(result);
		}
	});
}

function listReply_rest(num) {
	$.ajax({
		type : "get",
		url : "${path}/reply/list/${dto.bno}/"+num,
		success : function(result) {
		// responseText가 result에 저장됨
		$("#listReply").html(result);
		}
	});
}

function listReply2() {
	//contentType : "application/json", 생략가능 컨트롤러가 RestController 라서 자동만들어줌
	$.ajax({
		type :"get",
		contentType : "application/json",
		url : "${path}/reply/list_json.do?bno=${dto.bno}",
		success : function(result) {
//			console.log(result);
			var output="<table>";
			for (var i in result){
				output+="<tr>";
				output+="<td>"+result[i].user_name;
				output+="("+result[i].regdate+")<br>";
				output+=result[i].replytext+"</td>";
				output+="</tr>";
				
			}
			output+="</table>";
			$("#listReply").html(output);
		}
	});
}



function reply(){
	var replytext =$("#replytext").val();
	var bno="${dto.bno}";	
	//비밀번호 체크 여부
	var secret_reply="n";
	//태그.is(":속성")
	if($("#secret_reply").is(":checked")){
		secret_reply="y";
	}
	var param="replytext="+replytext+"&bno="+bno+"&secret_reply="+secret_reply;
	$.ajax({
		type: "post",
		url: "${path}/reply/insert.do",
		data: param,
		success: function() {
			alert("댓글이 등록되었습니다.")
			listReply("1");
		}
	}); 
}

function reply_json(){
	var replytext =$("#replytext").val();
	var bno="${dto.bno}";	
	//비밀번호 체크 여부
	var secret_reply="n";
	//태그.is(":속성")
	if($("#secret_reply").is(":checked")){
		secret_reply="y";
	}
	
	$.ajax({
		type: "post",
		url: "${path}/reply/insert_rest.do",
		headers : {
			"Content-Type" : "application/json"
		},
		dataType :"text",
		data : JSON.stringify({
			bno : bno,
			replytext : replytext,
			secret_reply : secret_reply
		}),
		success: function() {
			alert("댓글이 등록되었습니다.")
			//listReply("1");
			listReply_rest("1");
		}
	}); 
}

function showModify(rno) {
	
	$.ajax({
		type : "get",
		url : "${path}/reply/detail/"+rno,
		success : function(result) {
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility","visible")
		}
	});
}
</script>
<style type="text/css">
#modifyReply{
	width: 300px;
	height: 100px;
	background-color: gray;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 10;
	visibility: hidden;
}
</style>
</head>
<body>
<%@include file="../include/menu.jsp" %>
<h2>게시물 작성</h2>
<form name="form1" method="post">
	<div>
		작성일자 : <fmt:formatDate value="${dto.regdate }" pattern="yyyy-mm-dd hh:mm:ss"></fmt:formatDate>
	</div>
	
	<div>
		조회수 : ${dto.viewcnt }
	</div>
	<div>
		제목
		<input name="title"  value="${dto.title }" placeholder="제목을 입력하세요" size="80">
	</div>
	
	<div>
		내용
		<textarea name="content" rows="3" cols="80"
		placeholder="내용을 입력하세요"  >${dto.content }</textarea>
	</div>
	
	<div>
		이름 : ${dto.user_name }
	</div>
	<div style="width: 700px; text-align: center;">
	<input type="hidden" name="bno" value="${dto.bno}">
	<c:if test="${sessionScope.user.user_id == dto.writer }">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</c:if>
	<button type="button" id="btnList">목록</button>
	</div>
</form>

<c:if test="${sessionScope.user!= null }">
<div style="width: 700px; text-align: center;">
	<br>
	<textarea rows="5" cols="80" placeholder="댓글을 작성하세요." id="replytext"></textarea>
		<br>
		<input type="checkbox" id="secret_reply">비밀댓글
		<button type="button" id="btnReply">댓글쓰기</button>
</div>
</c:if>

<!-- 댓글 목록 출력-->
<div id="listReply"></div>
<!-- 댓글 수정 화면 -->
<div id="modifyReply">댓글 수정 화면 영역</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp" %>
<%@include file="../include/session_check.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		
	/* 	$(".fileDrop").on("dragenter dragover",function(e){
			e.preventDefault(); //기본 효과 막음
		});
		$(".fileDrop").on("drop",function(e){
			e.preventDefault();
			var files=e.originalEvent.dataTransfer.files;
			
			console.log(files);
			var file=files[0];
			var formData = new FormData();
			formData.append("file",file);
			$.ajax({
				url : "${path}/upload/uploadAjax",
				data : formData,
				dataType : "text",
				processData : false,
				contentType : false,
				type : "post",
				success : function(data){
					console.log(data);
					//첨부파일의 정보
					var fileInfo=getFileInfo(data);
					//하이퍼링크
					var html="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
					//hidden 태그 추가
					html+="<input type='hidden' class='file' value='"+fileInfo.fullName+"'>";   
					//div에 추가
					$(".uploadedList").append(html);
					alert("실행");
								}
							});
						}); */
						
		$("#btnSave").click(function() {
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
			
/* 			if(writer==""){
				alert("작성자를 입력하세요");
				document.form1.writer.focus();
				return;
			} */
			
			//폼에 입력한 데이터를 서버로 전송함
			document.form1.submit();

		});
	});


	/* function checkImageType(fileName){
		var pattern= /jpg|gif|png|jpeg/;
		return fileName.match(pattern);
	}
	function getFileInfo(fullName){
		var fileName, imgsrc, getLink, fileLink;
		if(checkImageType(fullName)){//이미지 파일일 경우
			imgsrc="${path}/upload/displayFile?fileName="
					+fullName;
			fileLink=fullName.substr(14);
			var front=fullName.substr(0,12);
			var end=fullName.substr(14);
			getLink="${path}/upload/displayFile?fileName="
					+front+end;
		}else{ //이미지가 아닌 경우
			fileLink=fullName.substr(12);
			getLink="${path}/upload/displayFile?fileName="
					+fullName;
		}
		fileName=fileLink.substr(fileLink.indexOf("_")+1);
	// {변수:값}	
		return {fileName:fileName, imgsrc:imgsrc,
			getLink:getLink, fullName:fullName};
	} */
</script>

<style type="text/css">
	.fileDrop{
		width:600px;
		height: 100px;
		border: 1px dotted gray;
		background-color: gray;
		 
	}
</style>
</head>
<body>
<%@include file="../include/menu.jsp" %>
<h2>게시물 작성</h2>
<form name="form1" method="post" action="${path }/board/insert.do">
	<div>
		제목
		<input name="title" placeholder="제목을 입력하세요" size="80">
	</div>
	
	<div>
		내용
		<textarea name="content" rows="3" cols="80"
		placeholder="내용을 입력하세요"  ></textarea>
	</div>
	
<!-- <div>
	첨부파일 등록
	<div class="fileDrop"></div>
	
	첨부 파일 목록
	<div class="uploadedList"></div>
	
</div> -->
	
<!-- 	<div>
		이름
		<input name="writer" placeholder="이름을 입력하세요">
	</div> -->
	<div style="width: 700px; text-align: center;">
		<button type="button" id="btnSave">확인</button>
	</div>
</form>
</body>
</html>
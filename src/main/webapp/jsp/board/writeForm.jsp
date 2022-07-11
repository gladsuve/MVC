<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
<link rel="stylesheet" href="/Mission-web/resource/css/layout.css">
<link rel="stylesheet" href="/Mission-web/resource/css/table.css">
<script src="/Mission-web/resource/lib/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#listBtn').click(function(){
			location.href = "list.jsp"
		})
		
	})
	
	function checkForm(){
		
		let f = document.writeForm
		if(f.title.value == ''){
			alert('제목을 입력하세요.')
			f.title.focus()
			return false
		} /* else if(f.writer.value == ''){
			alert('작성자를 입력하세요.')
			f.writer.focus()
			return false
		} */ else if(f.content.value == ''){
			alert('내용을 입력하세요.')
			f.content.focus()
			return false
		}
		if(checExt(f.attachfile1))
			return false
		
		if(checkExt(f.attachfile2))
			return false
			
		return true
	}
	
	function checkExt(obj) {
		let forbidName = ['exe', 'java', 'class', 'js', 'jsp']
		let fileName = odj.value
		let ext = fileName.substring(fileName.lastIndexOf('.') + 1)
		console.log(ext)
		
		for(let i = 0, i < forbidName.length; i++){
			if(forbidName[i] == ext) {
				alert('[' + ext + '] 혹장자는 파일 업로드 정책에 위반됩니다')
				return true
			}
		}
		return false
	}
	
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>새글 등록 폼</h2>
		<hr>
		<br>
		<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="writeForm" onsubmit="return checkForm()">
<%-- 		<input type="hidden" name="writer" value="${ userVO.id }"> --%>
			<table border="1" style="width: 80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title" size="78"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
<%-- 					<td>${ userVO.id }</td> --%>
					<td><input type="text" name="writer" value=${ userVO.id }></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">&nbsp;&nbsp;
			<button type="button" id="listBtn">목록</button>
		</form>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>















<!-- <body>
	<div align="center">
		<hr>
		<h2>글쓰기</h2>
		<hr>
		<br>
		<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()">
			<table border="1" style="width: 80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title" size="78"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">&nbsp;&nbsp;
			<button type="button" id="listBtn">목록</button>
		</form>
	</div>
</body> -->
</html>
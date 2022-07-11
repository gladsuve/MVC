<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-web/resource/css/layout.css">
<link rel="stylesheet" href="/Mission-web/resource/css/table.css">
</head>


<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align = "center">
<hr>
<h2>게시판 상세</h2>
<hr>
<br>
<table border="1" style="width : 80%">
	<tr>
		<th width="25%">번호</th>
		<td>${ board.no }</td>
	</tr>
	<tr>
		<th width="25%">제목</th>
		<td><c:out value = "${ board.title }"/></td>
	</tr>
	<tr>
		<th width="25%">작성자</th>
		<td>${ board.writer }</td>
	</tr>
	<tr>
		<th width="25%">내용</th>
		<td>${ board.content }</td>
	</tr>
	<tr>
		<th width="25%">조회수</th>
		<td>${ board.viewCnt }</td>
	</tr>
	<tr>
		<th width="25%">등록일</th>
		<td>${ board.regDate }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
		<c:forEach items="${ fileList }" var="fileVO">
			<a href="/Mission-web/upload/${ fileVO.fileSaveName }">
			${ fileVO.fileOriName }			
			</a>
			(${ fileVO.fileSize }bytes)
			<br>
		</c:forEach>
		</td>
	</tr>
	
	
</table>
<button onclick="doAction('U')">글수정</button>&nbsp;&nbsp;
<button onclick="doAction('D')">글삭제</button>&nbsp;&nbsp;
<button onclick="doAction('L')">글목록</button>&nbsp;&nbsp;
 
</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>



















<%-- <body>
<div align = "center">
<hr>
<h2>게시판 상세</h2>
<hr>
<br>
<table border="1" style="width : 80%">
	<tr>
		<th width="25%">번호</th>
		<td>${ board.no }</td>
	</tr>
	<tr>
		<th width="25%">제목</th>
		<td><c:out value = "${ board.title }"/></td>
	</tr>
	<tr>
		<th width="25%">작성자</th>
		<td>${ board.writer }</td>
	</tr>
	<tr>
		<th width="25%">내용</th>
		<td>${ board.content }</td>
	</tr>
	<tr>
		<th width="25%">조회수</th>
		<td>${ board.viewCnt }</td>
	</tr>
	<tr>
		<th width="25%">등록일</th>
		<td>${ board.regDate }</td>
	</tr>
</table>
<button onclick="doAction('U')">글수정</button>&nbsp;&nbsp;
<button onclick="doAction('D')">글삭제</button>&nbsp;&nbsp;
<button onclick="doAction('L')">글목록</button>&nbsp;&nbsp;
 
</div>



</body> --%>
</html>
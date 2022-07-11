<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-web/resource/css/layout.css">
<link rel="stylesheet" href="/Mission-web/resource/css/table.css">
<script src="/Mission-web/resource/lib/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#add').click(function(){
				location.href = 'writeForm.jsp'
			
		})
		
	})
	function checkLogin(boardNo){
		<c:choose>
			<c:when test="${ empty userVO}">
				if(confirm('로그인 후 사용가능합니다\n로그인 페이지로 이동할까요?')) {
					location.href="/Mission-web/jsp/login/login.jsp"
				}
			</c:when>
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
	}
	
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
<%--
	url : http://localhost:9999/Mission-web/jsp/board/list.jsp
 --%>
 	<section>
 	<div align="center">
 		<hr>
 		<h1>전체 게시글 조회</h1>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr <c:if test="${ loop.count mod 2 eq 0 }" >class="even"</c:if>>
				<td>${ board.no }</td>
				<td>
					<a href="javascript:checkLogin(${ board.no })">
						<c:out value= "${ board.title }"/>
					</a>
				
			<%-- 	<a href="detail.jsp?no=${ board.no }"><c:out value= "${ board.title }"/></a> --%>
				</td>
				<td>${ board.writer }</td>
				<td>${ board.regDate }</td>
			</tr>
			
			</c:forEach>
			
			
			
			<%-- <tr>
			<%
				while(rs.next()){
					int no = rs.getInt("no");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					String reg_date = rs.getString("reg_date");
			%>		
				<tr>
					<th><%= no %></th>
					<th><a href="detail.jsp?no=<%=no%>"><%= title %></a></th>
					<th><%= writer %></th>
					<th><%= reg_date %></th>
				</tr>
			<% 	
				}
			%>
			</tr> --%>
		</table><br>
		<c:if test="${ not empty userVO }">
		<button id="add">새글등록</button>
		</c:if>
	<!-- 	<button id="update">글수정</button>
		<button id="delete">글삭제</button>
		<button id="list">글목록</button> -->
 	</div>
 	
 	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>


<%-- <% 
	JDBCClose.close(pstmt, conn);

%> --%>
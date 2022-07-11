<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDao"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
    
    
<%

MemberDao dao = new MemberDao();
List<MemberVO> list = dao.selectAll();

pageContext.setAttribute("list", list);

/* 	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select id, name, password, email_id, email_domain, tel1, tel2, tel3, ");
	sql.append(" post, basic_addr, detail_addr, type, to_char(reg_date,'yyyy-mm-dd') as reg_date ");
	sql.append(" from t_member ");
	sql.append(" order by id ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery(); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div {
	background-color : lightgrey;
	}
	
	table {
	background-color : #98DFFF;
	}
</style>
</head>
<body>
<div align="center">
 		<hr>
 		<h1>전체 회원 조회</h1>
		<hr>
		<br>
		<table border="1" style="width:90%">
			<tr>
				<th width="7%">ID</th>
				<th>이름</th>
				<th width="7%">비밀번호</th>
				<th width="14%">이메일</th>
				<th width="14%">전화번호</th>
				<th width="7%">우편번호</th>
				<th width="20%">주소</th>
				<th width="7%">타입</th>
				<th width="14%">등록일</th>
			</tr>
			<c:forEach items="${ list }" var="member">
			<tr>
				<td>${ member.id }</td>
				<td>${ member.name }</td>
				<td>${ member.password }</td>
				<td>${ member.email_id }@${ member.email_domain }</td>
				<td>${ member.tel1 }-${ member.tel2 }-${member.tel3 }</td>
				<td>${ member.post }</td>
				<td>${ member.basic_addr } ${ member.detail_addr }</td>
				<td>${ member.type }</td>
				<td>${ member.reg_date }</td>
			</tr>			
			</c:forEach>
			<%
	/* 			while(rs.next()){
					String id= rs.getString("id");
					String name= rs.getString("name");
					String pwd= rs.getString("password");
					String email= rs.getString("email_id");
					String domain= rs.getString("email_domain");
					String tel1= rs.getString("tel1");
					String tel2= rs.getString("tel2");
					String tel3= rs.getString("tel3");
					String post= rs.getString("post");
					String addr1= rs.getString("basic_addr");
					String addr2= rs.getString("detail_addr");
					String type= rs.getString("type");
					String reg_date= rs.getString("reg_date"); */
 	//		%>
<!-- 				<tr> -->
<%-- 					<th><%= id %></th> --%>
<%-- 					<th><%= name %></th> --%>
<%-- 					<th><%= pwd %></th> --%>
<%-- 					<th><%= email %>@<%= domain %></th> --%>
<%-- 					<th><%= tel1 %>-<%= tel2 %>-<%= tel3 %></th> --%>
<%-- 					<th><%= post %></th> --%>
<%-- 					<th><%= addr1 %>&nbsp;<%= addr2 %></th> --%>
<%-- 					<th><%= type %></th> --%>
<%-- 					<th><%= reg_date %></th> --%>
<!-- 				</tr> -->
<%-- 			<% 	 --%>
<!--  }-->			
<%-- 			%> --%>
			</tr>
		</table><br>
 	</div>

</body>
</html>
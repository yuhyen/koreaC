<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>총금액</th>
			<th>적립금</th>
		</tr>
		<c:forEach var="u" items="${list }">
		<tr>
			<td>${u.u_idx }</td>
			<td>${u.u_id }</td>
			<td>${u.u_pwd }</td>
			<td>${u.u_username }</td>
			<td>${u.u_email }</td>
			<td>${u.u_tel }</td>
			<td>${u.u_ip}</td>
			<td>${u.u_total}</td>
			<td>${u.u_reserve}</td>
			
		</tr>
		</c:forEach>	
	</table>
</body>
</html>
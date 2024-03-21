<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function search(){
		let u_username = document.getElementById("u_username").value.trim();
		
		if(u_username == ''){
			alert("회원 이름을 입력하세요")
			return;
		}
		
		location.href="user?u_username="+u_username;
	}
	
	function del(u_idx){
		
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		let url = "user_delete";
		let param = "u_idx="+u_idx;
		
		sendRequest(url, param, deleteFn, "POST")
	}
	
	function deleteFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return' + data))();
			
			if(json[0].del == 'no'){
				alert('삭제 실패')
				return;
			}
			
			alert('삭제 성공')
			location.href="user";
		}
	}
</script>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body>
<div class="container mx-auto p-6">
	<div>
		<input type="text" id="u_username" placeholder="이름">
		<input type="button" value="검색" onclick="search()">
	</div>
	<br>
	<hr>
	<div class="bg-white shadow-md rounded my-6">
		<table class="divide-y divide-black text-center w-full">
			<thead>
				<tr class="divide-x divide-black">
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>총금액</th>
					<th>적립금</th>
				</tr>
			</thead>
			<c:forEach var="u" items="${list}">
			<tbody>
				<tr class="divide-x divide-black">
					<td>${u.u_idx}</td>
					<td>${u.u_id }</td>
					<td>${u.u_username }</td>
					<td>${u.u_email }</td>
					<td>${u.u_tel }</td>
					<td>${u.u_ip}</td>
					<td>${u.u_total}</td>
					<td>${u.u_reserve}</td>
					<td>
						<input type="button" value="삭제" onclick="del(${u.u_idx})">
					</td>
				</tr>
			</tbody>
			</c:forEach>	
		</table>
	</div>
</div>
<div align="center">
	${pageMenu}
</div>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
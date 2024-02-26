<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function u_update(f){
	let pwd = f.pwd.value
	let pwdcheck = f.pwdcheck.value
	
	if(pwd =! pwdcheck){
		alert("비밀번호 와 비밀번호 확인이 틀립니다.")
		return;
	}
		
	f.submit();	
		
	}
</script>
</head>
<body>
	<form method="post" action="u_update">
		<table border="2" align="center">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name ="id">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td> 
					<input type="password" name="pwd">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pwdcheck">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" name="add"></td>
			</tr>
			
			 <tr>
			 	<th>휴대폰 번호</th>
			 	<td><input type="text" name="p_num"></td>
			 </tr>
			 
			 <tr>
			 	<th>이메일</th>
			 	<td>
			 		<input type = "email" name="email">
			 	</td>
			 </tr>
			 
		</table>
			<p align="center">
					<input type="button" value="수정하기" onclick="u_update(this.form)">
			 		<input type="button" value="취소하기" onclick="location.href='mypage'">
			</p>
			 	
	</form>
</body>
</html>
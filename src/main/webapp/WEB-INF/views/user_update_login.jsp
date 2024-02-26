<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script>
	function mypage(f){
		var id = f.id.value.trim();
		var pwd = f.pwd.value.trim();
		
		if(id == ""){
			alert("아이디를 입력해주세요")
			return;
		}
		if(pwd == ""){
			alert("비밀번호를 입력해주세요")
			return;
		}
		let url = "user_mypage_login";
		let param = "id="+id+"&pwd="+ encodeURIComponent(pwd);
	
		
		sendRequest(url, param, mylogin, "POST");
	}
	function mylogin(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = (new Function('return' + data))();
			
			if(json[0].param == "noid"){
				alert("아이디가 일차하지 않습니다");
			}else if(json[0].param == "nopwd"){
				alert("비밀번호가 일치하지 않습니다");
			}else{
		
			alert("로그인 성공");
				location.href = 'user_update';
			}
		}
	}
</script>
</head>
<body>
	<form>
		<table border="2" align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
		</table>
				<p align="center">
					<input type="button" value="확인" onclick="mypage(this.form)">
				</p>
	</form>
</body>
</html>
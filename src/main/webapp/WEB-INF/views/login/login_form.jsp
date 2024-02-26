<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function send(f){
		var u_id = f.u_id.value.trim();
		var u_pwd = f.u_pwd.value.trim();
		
		if(u_id == ''){
			alert('아이디를 입력해주세요');
			return;
		}
		
		if(u_pwd==''){
			alert('비밀번호를 입력하세요')
			return;
		}
		
		var url = "login";
		var param = "u_id="+u_id+"&u_pwd="+encodeURIComponent(u_pwd);
		
		sendRequest(url,param,myCheck,"POST");
	}
	
	function myCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data= xhr.responseText;
			var json = (new Function('return' + data))();
			
			if(json[0].param == 'no_u_id'){
				alert('아이디가 존재하지 않습니다.');
			}else if(json[0].param=='no_u_pwd'){
				alert('비밀번호가 틀립니다.');
			}else{
				alert('로그인 성공')
				location.href='list';
			}
		}
	}
</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>:::로그인:::</caption>
			<tr>
				<th>아이디</th>
				<td><input name="u_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input name="u_pwd" type="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form)">
					<input type="button" class="btn btn-primary" value="회원가입" onclick="location.href='user_insert_form'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
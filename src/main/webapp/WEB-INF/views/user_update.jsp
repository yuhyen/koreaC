<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function u_update(f){
	let u_username = f.name.value.trim();
	let u_pwd = f.pwd.value.trim();
	let u_id = f.id.value.trim();
	let u_ip = f.u_ip.value.trim() + f.u_ipExtraAddr.value.trim();
	let u_email = f.email.value.trim();
	let u_tel = f.p_num.value.trim();
	let u_idx = f.idx.value.trim();
	
	
	let pwdcheck = f.pwdcheck;
	
	if(u_pwd != pwdcheck.value){
		alert("비밀번호 와 비밀번호 확인이 틀립니다.");
		return;
	}
		let url= "user_db_update";
		let param = "u_idx=" + u_idx + "&u_username=" + u_username + "&u_id=" + u_id + "&u_pwd=" + u_pwd + "&u_ip=" + u_ip + "&u_tel=" + u_tel + "&u_email=" + u_email;
		
		sendRequest(url, param, userUpdate, "POST");
	}
	function userUpdate(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return' + data))();
			
			if(json[0].param == 'in'){
				alert("수정 완료");
				location.href = 'mypage';
			}
			if(json[0].param == 'notin'){
				alert("수정 실패");
			}
		}
	}
	
	function ipsearch(f){
		
		 new daum.Postcode({
		        oncomplete: function(data) {
		        	
		        	console.log(data);
		        	let u_ipNumber='';
		        	let u_ipAddr='';
		        	let u_ipExtraAddr='';
		        	u_ipNumber = data.zonecode;
		        	
		        	if(data.userSelectedType === 'R'){
		        		u_ipAddr = data.roadAddress;
		        	}else{
		        		u_ipAddr = data.jibunAddress;
		        	}
		        	
		        	if(data.userSelectedType =='R'){
		        		if(data.bname !== ''){
		        			u_ipExtraAddr += data.bname;
		        		}
		        		if(data.buildingName !==''){
		        			u_ipExtraAddr += (u_ipExtraAddr !== '' ?',' + data.buildingName : data.buildingName);	
		        		}
		        		u_ipAddr += (u_ipExtraAddr !=='' ?'(' + u_ipExtraAddr + ')' : '');	
		        	}        	
		   	
		        	f.u_ip.value = '('+u_ipNumber+')' + u_ipAddr;
		        	
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
	}
	
</script>
</head>
<body>
	<form>
	
	<input type="hidden" name="idx" value="${dto.u_idx} ">
		<table border="2" align="center">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${dto.u_username }"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name ="id" value="${dto.u_id }">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td> 
					<input type="password" name="pwd" >
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
				<td>
				<input type="text" name="u_ip" value="${dto.u_ip }">
				<input type = "button" value="주소찾기" onclick="ipsearch(this.form)">
				</td>
			</tr>
			<tr>
			<th>상세주소</th>
				<td>
				<input name="u_ipExtraAddr">
				</td>
			</tr>	
			
			 <tr>
			 	<th>휴대폰 번호</th>
			 	<td><input type="text" name="p_num" value="${dto.u_tel }"></td>
			 </tr>
			 
			 <tr>
			 	<th>이메일</th>
			 	<td>
			 		<input type = "email" name="email" value="${dto.u_email }">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	let b_idCheck=false;
	
	function check_id(){
		let u_id=document.getElementById("u_id").value;
		
		if(u_id==''){
			alert('아이디를 입력하세요')
			return;
		}
		
		let url ="check_id";
		let param = "u_id="+u_id;
		
		sendRequest(url,param,resultFn,"POST");
	}
	
	function resultFn(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			var json=(new Function('return' + data))();
			
			if(json[0].res=='yes'){
				alert('사용가능한 아이디입니다.')
			b_idCheck=true;
			}else{
				alert("이미 사용중인 아이디입니다.")
				return;
			}
		}
	}
	function che(){
		b_idCheck=false;
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
	
	function send(f) {
		
		let u_id = f.u_id.value.trim();
		let u_pwd = f.u_pwd.value.trim();
		let u_username = f.u_username.value.trim();
		let u_email = f.u_email.value.trim();
		let u_tel = f.u_tel.value.trim();
		let u_ip = f.u_ip.value.trim() + f.u_ipExtraAddr.value.trim();
		
		if(u_id ==''){
			alert('아이디를 입력해주세요')
			return;
		}
		
		if(u_pwd==''){
			alert('비밀번호를 입력해주세요')
			return;
		}
		
		if(u_username ==''){
			alert('이름을 입력해주세요')
			return;
		}
		if(u_email==''){
			alert('이메일을 입력해주세요')
			return;
		}
		if(u_tel==''){
			alert('전화번호를 입력해주세요')
			return;
		}
		if(u_ip==''){
			alert('주소를 입력해주세요')
			return;
		}
		//이메일은 형식검사
		let regex= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!regex.test(u_email)){
			alert('형식에 맞게 입력해주세요')
			return;
		}
		if(!b_idCheck){
			alert('아이디 중복체크 하세요')
			return;
		}
		
		//user_insert 매핑으로 전송
		f.method="post";
		f.action="user_insert";
		f.submit();
		
	}
</script>
</head>
<body>
	<form>
		<table border="1">
			<caption>:::회원가입:::</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input name="u_id", id="u_id" onchange="che()">
					<input type="button" value="중복체크" onclick="check_id()">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="u_username">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="u_pwd" type="password">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input name="u_email">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input name="u_tel">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input name="u_ip">
					<input type="button" value="우편번호검색" onclick="ipsearch(this.form)">
				</td>
			</tr>
			<tr>
			<th>상세주소</th>
				<td>
				<input name="u_ipExtraAddr">
				</td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="가입" onclick="send(this.form)">
				<input type="button" value="취소" onclick="location.href='login_form'">
				</td>
			</tr>							
		</table>
	</form>
</body>
</html>
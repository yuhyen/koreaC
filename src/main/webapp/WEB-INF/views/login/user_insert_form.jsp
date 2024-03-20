<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="resources/js/HttpRequest.js"></script>
 <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .button{
        	text-align: center;
        }
        
        #body{
        	min-height: 100vh; 
        	padding-top: 20px;
        }
        #white-box{
        	min-height: 600px; /* 예시로 설정한 최소 높이 */
    		padding-bottom: 80px; /
    		  overflow-y: auto; /* 세로 스크롤 추가 */
    		max-height: 95vh; /* 최대 높이 설정 */
        }
      input, label {
    margin-bottom: 10px; /* 더 적은 여백을 적용 */
}

	#register{
		margin-top: -20px;
	}
    </style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	let b_idCheck=false;
	let b_emailCheck=false;
	
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
	
	function check_email(f){
		
		let u_email = f.u_email.value;
		console.log(u_email);
		
		
		let regex= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
			if(!regex.test(u_email)){
				alert('형식에 맞게 입력해주세요')
				return;
			}
		
		let url="check_email";
		let param="u_email="+u_email;
		
		sendRequest(url,param,EmailresultFn,"post")
	}
	
	function EmailresultFn(){
		if(xhr.readyState==4 && xhr.status==200){
			var data=xhr.responseText;
			var json=(new Function('return' + data))();
			
			if(json[0].res=='yes'){
				alert('사용가능한 이메일입니다.')
			b_emailCheck=true;
			}else{
				alert("이미 사용중인 이메일입니다.")
				return;
			}
		}
	}
	
	/* function che(){
		b_idCheck=false;
	} */
	
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
		let u_ip = f.u_ip.value.trim();
		
		if(u_id ==''){
			alert('아이디를 입력해주세요')
			return;
		}
		if(!b_idCheck){
			alert('아이디 중복체크 하세요')
			return;
		}
		if(u_username ==''){
			alert('이름을 입력해주세요')
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
		if(!b_emailCheck){
			alert('이메일 중복체크 해주세요')
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
		
		alert('회원가입 성공!');
		//user_insert 매핑으로 전송
		f.method="post";
		f.action="user_insert";
		f.submit();
		
	}
</script>
</head>

<body>

	<!-- <h1 id="header" class="bg-gray-50 flex text-4xl font-bold"><a href="main">KoreaMall</a></h1> -->
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	
	<div id="body" class="bg-gray-50 flex items-center justify-center h-screen">

	<div id="white-box" class="bg-white shadow-lg rounded-lg p-8">
	
	
	
        <h1 id="register" class="text-3xl font-bold mb-5 text-center">회원가입</h1>
	<form>
	
			<div class="mb-2">
			<div class="flex items-center justify-between mb-1">
                <label for="u_id" class="block text-gray-700 text-sm font-bold mb-2">아이디</label>
                <input type="button" id="button" value="중복체크" class="bg-white-500 hover:bg-white-700 text-black font-bold py-1 px-2 rounded focus:outline-none focus:shadow-outline" onclick="check_id()">
           </div>   
                <input type="text" id="u_id" name="u_id" placeholder="아이디를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
        
       
			 <div class="mb-2">
                <label for="u_username" class="block text-gray-700 text-sm font-bold mb-2">이름</label>
                <input type="text" id="u_username" name="u_username" placeholder="이름 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
        
             <div class="mb-2">
                <label for="u_pwd" class="block text-gray-700 text-sm font-bold mb-2">비밀번호</label>
                <input type="password" id="u_pwd" name="u_pwd" placeholder="비밀번호를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            
             <div class="mb-2">
             <div class="flex items-center justify-between mb-1">
                <label for="u_email" class="block text-gray-700 text-sm font-bold mb-2">이메일</label>
                <input type="button" id="button2" value="중복체크" class="bg-white-500 hover:bg-white-700 text-black font-bold py-1 px-2 rounded focus:outline-none focus:shadow-outline" onclick="check_email(this.form)">
             </div>   
                <input type="text" id="u_email" name="u_email" placeholder="이메일를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            
             <div class="mb-2">
                <label for="u_tel" class="block text-gray-700 text-sm font-bold mb-2">전화번호</label>
                <input type="text" id="u_tel" name="u_tel" placeholder="전화번호를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            
             <div class="mb-2">
             <div class="flex items-center justify-between mb-1">
                <label for="u_ip" class="block text-gray-700 text-sm font-bold mb-2">주소</label>
               <input type="button" value="우편번호검색" class="bg-white-500 hover:bg-white-700 text-black font-bold py-1 px-2 rounded focus:outline-none focus:shadow-outline" onclick="ipsearch(this.form)">
             </div>  
                <input type="text" id="u_ip" name="u_ip" placeholder="주소" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-2 leading-tight focus:outline-none focus:shadow-outline">
                 <input type="text" id="u_ipExtraAddr" name="u_ipExtraAddr" placeholder="상세주소" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			<div class="flex items-center justify-between mb-4">
                <input type="button" class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-2 rounded focus:outline-none focus:shadow-outline" value="가입하기"  onclick="send(this.form)"/>
                <input type="button" class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-2 rounded focus:outline-none focus:shadow-outline" value="취소"  onclick="location.href='login_form'"/>
            </div>
            
           
	</div>
	</form>
	</div>
	 <div class="mb-4">
            </div>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<script src="resources/js/HttpRequest.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        #button{
        background-color: #FFFFFF; /* 배경 색상 */
        color: #4D4D4D; /* 글씨 색상 */
       border: 2px solid #666666;
        border-radius: 4px; /* 모서리 둥글기 */
        padding: 2px 5px; /* 내부 여백 */
        font-weight: 700; /* 글씨 두께 */
        cursor: pointer; /* 커서 모양 */
        transition: background-color 0.3s ease; /* 배경색 변경시 효과 */
    }
    #button:hover {
        background-color: #F7F7F7; /* 호버시 배경 색상 변경 */
    }
          #find_pwd-btn{
        background-color: #FFFFFF; /* 배경 색상 */
        color: #000000; /* 글씨 색상 */
        border-radius: 4px; /* 모서리 둥글기 */
        padding: 2px 5px; /* 내부 여백 */
        font-weight: 700; /* 글씨 두께 */
        cursor: pointer; /* 커서 모양 */
        transition: background-color 0.3s ease; /* 배경색 변경시 효과 */
    }
    #find_pwd-btn:hover {
        background-color: #F7F7F7; /* 호버시 배경 색상 변경 */
    }
    
      #back-btn{
        background-color: #FFFFFF; /* 배경 색상 */
        color: #000000; /* 글씨 색상 */
        border-radius: 4px; /* 모서리 둥글기 */
        padding: 2px 5px; /* 내부 여백 */
        font-weight: 700; /* 글씨 두께 */
        cursor: pointer; /* 커서 모양 */
        transition: background-color 0.3s ease; /* 배경색 변경시 효과 */
    }
    #back-btn:hover {
        background-color: #F7F7F7; /* 호버시 배경 색상 변경 */
    }
        
        
    </style>
    
    <script type="text/javascript">
    
    function send(f){
    	var u_id = f.u_id.value.trim();
		var u_email = f.u_email.value.trim();
		
		if(u_id == ''){
			alert('아이디를 입력해주세요');
			return;
		}
		if(u_email==''){
			alert('이메일을 입력하세요')
			return;
		}
		
		var url = "find_pwd";
		var param = "u_id="+u_id+"&u_email="+encodeURIComponent(u_email);
		
		sendRequest(url,param,myCheck,"post");
    }
    
    
    function myCheck(){
    	
    	let u_email = document.getElementById("u_email").value;
    	console.log(u_email)
    	
		if(xhr.readyState == 4 && xhr.status == 200){
			var data= xhr.responseText;
			var json = (new Function('return' + data))();
			if(json[0].param == 'no_u_id'){
				alert('아이디가 존재하지 않습니다.');
			}else if(json[0].param=='no_u_email'){
				alert('이메일이 틀립니다.');
			}else{				
				alert('인증번호가 전송되었습니다.');	
				
				var url = "find";
				var param = "u_email="+encodeURIComponent(u_email);
				
				sendRequest(url,param,myCheck2,"get");
			}
		}
	}
    
    function myCheck2(){
    	console.log('인증번호전송완료')
    }
    
    function keycheck(){
    	var u_check = document.getElementById("u_check").value;
    	var u_id = document.getElementById("u_id").value;
    	var u_email = document.getElementById("u_email").value;
    	
    	if(u_id==''){
    		alert('아이디를 입력해주세요');
    		return;
    	}
    	if(u_email==''){
    		alert('이메일을 입력해주세요');
    		return;
    	}
    	if(u_check == ''){
			alert('인증번호를 입력해주세요');
			return;
		}
    	
    	var url = "checknum";
    	var param = "u_check="+u_check+"&u_id="+u_id;
    	
    	sendRequest(url,param,myCheck3,"post");	
    }
    
    function myCheck3(){
    	if(xhr.readyState == 4 && xhr.status == 200){
			var data= xhr.responseText;
			var json = (new Function('return' + data))();
			
			 if(json[0].param=='no_equal'){
				alert('인증번호가 틀립니다.');
			}else{
				alert('회원님의 비밀번호는 '+json[0].u_pwd+'입니다.');			
				location.href='login_form';
			}
    }
    }
    </script>
</head>
<body>

<!-- <h1 id="header" class="bg-gray-50 flex text-4xl font-bold"><a href="main">KoreaMall</a></h1> -->
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include> 
	
	<div id="body"  class="bg-gray-50 flex items-center justify-center h-screen">

	<div class="bg-white shadow-lg rounded-lg p-8">
        <h1 class="text-3xl font-bold mb-6 text-center">비밀번호 찾기</h1>
	<form>
			<div class="mb-4">
                <label for="u_id" class="block text-gray-700 text-sm font-bold mb-2">아이디</label>
                <input type="text" id="u_id" name="u_username" placeholder="아이디를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            
            
			 <div class="mb-6">	
			 	<div class="flex items-center justify-between mb-1">
                <label for="u_email" class="block text-gray-700 text-sm font-bold mb-2">이메일</label>
                <input type="button" id="button" value="인증번호 전송" class="bg-white-500 hover:bg-white-700 text-black font-bold py-1 px-1 rounded focus:outline-none focus:shadow-outline" onclick="send(this.form)">
             	</div>
          
             	<div class="input-group"> 
                <input type="text" id="u_email" name="u_email" placeholder="이메일을 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            	</div>  
            
            	<div class="input-group"> 
                <input type="text" id="u_check" name="u_check" placeholder="인증번호" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-1 leading-tight focus:outline-none focus:shadow-outline">
            	</div> 
            </div>
            
 
			<div class="flex items-center justify-between mb-3">
                <input id="find_pwd-btn" type="button" class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="비밀번호찾기"  onclick="keycheck()"/>
                <input id="back-btn" type="button" class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="뒤로가기"  onclick="location.href='login_form'"/>
            </div>
          
      </div>  
	</form>
	</div>
	
	
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
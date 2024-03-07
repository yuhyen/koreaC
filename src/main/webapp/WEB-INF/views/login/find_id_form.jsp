<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디찾기</title>
	<script src="resources/js/HttpRequest.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    <script type="text/javascript">
	function send(f){
		var u_username = f.u_username.value.trim();
		var u_email = f.u_email.value.trim();
		
		if(u_username == ''){
			alert('이름을 입력해주세요');
			return;
		}
		
		if(u_email==''){
			alert('이메일을 입력하세요')
			return;
		}
		
		var url = "find_id";
		var param = "u_username="+u_username+"&u_email="+encodeURIComponent(u_email);
		
		sendRequest(url,param,myCheck,"post");
		
	}
	
	function myCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data= xhr.responseText;
			var json = (new Function('return' + data))();
			if(json[0].param == 'no_u_username'){
				alert('이름이 존재하지 않습니다.');
			}else if(json[0].param=='no_u_email'){
				alert('이메일이 틀립니다.');
			}else{
				
				alert('회원님의 아이디는 '+json[1].u_id+'입니다.');			
				location.href='login_form';
			}
		}
	}
	</script>
</head>
<body class="bg-gray-50 flex items-center justify-center h-screen">
	<div class="bg-white shadow-lg rounded-lg p-8">
        <h1 class="text-3xl font-bold mb-6 text-center">아이디 찾기</h1>
	<form>
			<div class="mb-4">
                <label for="u_username" class="block text-gray-700 text-sm font-bold mb-2">이름</label>
                <input type="text" id="u_username" name="u_username" placeholder="이름을 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			 <div class="mb-6">
                <label for="u_email" class="block text-gray-700 text-sm font-bold mb-2">이메일</label>
                <input type="text" id="u_email" name="u_email" placeholder="이메일을 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			<div class="flex items-center justify-between mb-6">
                <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="아이디찾기"  onclick="send(this.form)"/>
                <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="뒤로가기"  onclick="location.href='login_form'"/>
            </div>
	</form>
	</div>
</body>
</html>
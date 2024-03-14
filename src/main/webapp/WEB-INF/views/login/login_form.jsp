<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<title>로그인</title>
	<script src="resources/js/HttpRequest.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        #body {
            font-family: 'Noto Sans KR', sans-serif;
             
        }
        #header{
        	padding-left: 100px;
        	padding-top: 25px;
        }
    </style>
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
		
		sendRequest(url,param,myCheck,"post");
	}
	
	function myCheck(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data= xhr.responseText;
			var json = (new Function('return' + data))();
			if(json[0].param == 'no_u_id'){
				alert('아이디가 존재하지 않습니다.');
			}else if(json[0].param=='no_u_pwd'){
				alert('비밀번호가 틀립니다.');
			}else if('${line}' != ''){
				alert('${line}로 이동')
				location.href='${line}';
				<%
					session.removeAttribute("line");
				%>
			}else{
				alert('로그인 성공')
				location.href='main';
			}		
		}
	}
</script>
</head>
	
<body>

	<!-- <h1 id="header" class="bg-gray-50 flex text-4xl font-bold"><a href="main">KoreaMall</a></h1> -->

	<div id="body" class="bg-gray-50 flex items-center justify-center h-screen">

	<div class="bg-white shadow-lg rounded-lg p-8">
	
        <h1 class="text-3xl font-bold mb-6 text-center">로그인</h1>
	<form>
			<div class="mb-4">
                <label for="u_id" class="block text-gray-700 text-sm font-bold mb-2">회원 아이디</label>
                <input type="text" id="u_id" name="u_id" placeholder="아이디를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			 <div class="mb-6">
                <label for="u_pwd" class="block text-gray-700 text-sm font-bold mb-2">비밀번호</label>
                <input type="password" id="u_pwd" name="u_pwd" placeholder="비밀번호를 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			<div class="flex items-center justify-between mb-6">
                <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="로그인하기"  onclick="send(this.form)"/>
           		<input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="메인으로"  onclick="location.href='main'"/> 		
            </div>
           
            
			 <div class="flex items-center justify-between">
                <a href="find_id_form" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" >아이디찾기</a>
                <a href="find_pwd_form" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" >비밀번호찾기</a>
                <a href="user_insert_form" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800" >회원가입</a>
            </div>
	</form>
	</div>
	
</div>
</body>
</html>
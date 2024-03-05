<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find pwd page</title>
<script src="resources/js/HttpRequest.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50 flex items-center justify-center h-screen">
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
                 <input type="button" id="button" value="인증번호 전송" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-1 px-1 rounded focus:outline-none focus:shadow-outline" onclick="check_email()">
             </div>   
                <input type="text" id="u_email" name="u_email" placeholder="이메일을 입력하세요" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline">
            </div>
			<div class="flex items-center justify-between mb-6">
                <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="비밀번호찾기"  onclick="send(this.form)"/>
                <input type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" value="뒤로가기"  onclick="location.href='login_form'"/>
            </div>
	</form>
	</div>
</body>
</html>
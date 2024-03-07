<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
    }
</style>
</head>
<script type="text/javascript">
	function check(){
		alert('로그인 후 이용바랍니다.')
	}
</script>
<body class="bg-gray-50">
	 <header class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8 flex justify-between items-center">
            <h1 class="text-3xl font-bold text-gray-900"><a href="main">KoreaMall</a></h1>
            <c:if test="${empty u_id}">
	           <nav class="flex space-x-4">
	               <a href="#" class="text-gray-500 hover:text-gray-900">Notice</a>
	               <a href="#" class="text-gray-500 hover:text-gray-900">Q & A</a>
	               <a href="#" class="text-gray-500 hover:text-gray-900">Review</a>
	               <a href="delay" class="text-gray-500 hover:text-gray-900">Delay</a>
	               <a href="search" class="text-gray-500 hover:text-gray-900">Search</a>
	               <a href="login_form" class="text-gray-500 hover:text-gray-900">Login</a>
	               <a href="login_form" onclick="check()" class="text-gray-500 hover:text-gray-900">Order</a>
	               <a href="login_form" onclick="check()" class="text-gray-500 hover:text-gray-900">My account</a>
	           </nav>
            </c:if>
            
            <c:if test="${not empty u_id}">
	           <nav class="flex space-x-4">
	               <a href="#" class="text-gray-500 hover:text-gray-900">Notice</a>
	               <a href="#" class="text-gray-500 hover:text-gray-900">Q & A</a>
	               <a href="#" class="text-gray-500 hover:text-gray-900">Review</a>
	               <a href="delay" class="text-gray-500 hover:text-gray-900">Delay</a>
	               <a href="search" class="text-gray-500 hover:text-gray-900">Search</a>
	               <a href="logout" class="text-gray-500 hover:text-gray-900">Logout</a>
	               <a href="orderhistory_page" class="text-gray-500 hover:text-gray-900">Order</a>
	               <a href="mypage" class="text-gray-500 hover:text-gray-900">My account</a>
	           </nav>
            </c:if>
        </div>
    </header>
</body>
</html>
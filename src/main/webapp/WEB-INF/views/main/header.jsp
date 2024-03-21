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

            <c:choose>
            	 <c:when test="${empty u_id}">
		    		<nav class="flex space-x-4">
		              <a href="board_list?type=notice" class="text-gray-500 hover:text-gray-900">Notice</a>
		              <a href="board_list?type=qna" class="text-gray-500 hover:text-gray-900">Q & A</a>
		              <a href="board_list?type=review" class="text-gray-500 hover:text-gray-900">Review</a>
		              <a href="delay" class="text-gray-500 hover:text-gray-900">Delay</a> <!-- 로그인이 안되어 있을 시 -->
		              <a href="search" class="text-gray-500 hover:text-gray-900">Search</a>
		              <a href="login_form" class="text-gray-500 hover:text-gray-900">Login</a>
		              <a href="login_form" onclick="check()" class="text-gray-500 hover:text-gray-900">Order</a>
		              <a href="login_form" onclick="check()" class="text-gray-500 hover:text-gray-900">My account</a>	
		         	</nav>
	         	</c:when>
	         	
	         	<c:when test="${u_id.u_id == 'admin'}">
            		<nav class="flex space-x-4">
		               <a href="board_list?type=notice" class="text-gray-500 hover:text-gray-900">Notice</a>
		               <a href="board_list?type=qna" class="text-gray-500 hover:text-gray-900">Q & A</a>
		               <a href="board_list?type=review" class="text-gray-500 hover:text-gray-900">Review</a>
		               <a href="delay" class="text-gray-500 hover:text-gray-900">Delay</a> <!-- 관리자로 로그인 했을 시 -->
		               <a href="search" class="text-gray-500 hover:text-gray-900">Search</a>
		               <a href="logout" class="text-gray-500 hover:text-gray-900">Logout</a>
		               <a href="user" class="text-gray-500 hover:text-gray-900">User</a>
		               <a href="pList_form" class="text-gray-500 hover:text-gray-900">Product</a>
		           </nav>
            	</c:when>
            	
            	<c:otherwise>
	            	<nav class="flex space-x-4">
		               <a href="board_list?type=notice" class="text-gray-500 hover:text-gray-900">Notice</a>
		               <a href="board_list?type=qna" class="text-gray-500 hover:text-gray-900">Q & A</a>
		               <a href="board_list?type=review" class="text-gray-500 hover:text-gray-900">Review</a>
		               <a href="delay" class="text-gray-500 hover:text-gray-900">Delay</a>	<!-- 로그인이 되어 있는 경우 -->
		               <a href="search" class="text-gray-500 hover:text-gray-900">Search</a>
		               <a href="logout" class="text-gray-500 hover:text-gray-900">Logout</a>
		               <a href="orderhistory_page" class="text-gray-500 hover:text-gray-900">Order</a>
		               <a href="mypage" class="text-gray-500 hover:text-gray-900">My account</a>
		           </nav>
            	</c:otherwise>
            </c:choose>
        </div>
    </header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function search(){
		let p_name = document.getElementById("p_name").value.trim();
		let p_id = document.getElementById("p_id").value.trim();
		
		if(p_name == ''){
			alert("상품을 입력하세요")
		}
		
		location.href = "p_search?p_name="+p_name+"&p_id="+p_id
	}
</script>
<style type="text/css">
	div.container{
		margin-bottom: 100%;
	}
</style>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body class="bg-gray-50">
<div class="relative h-full flex">
	<aside class="float-left w-64 bg-white p-6 shadow-md">
       <div class="flex flex-col space-y-4">
           <a href="main"><button class="text-gray-700 font-semibold">New</button></a>
           <a href="category?p_id=1"><button class="text-gray-700 font-semibold">Outer</button></a>
           <a href="category?p_id=2"><button class="text-gray-700 font-semibold">Top</button></a>
           <a href="category?p_id=3"><button class="text-gray-700 font-semibold">Bottom</button></a>
           <a href="category?p_id=4"><button class="text-gray-700 font-semibold">Suit</button></a>  
       </div>
       <br><br><br>
       <div>
       	<a href=""><button class="text-gray-700 font-semibold">Cart</button></a>
       </div>
  	</aside>
  	
	
	<div class="flex overscroll-auto">
		<div class="py-6 px-4 sm:px-6 lg:px-8">
			<div>
				<select id="p_id">
					<option value="1">Outer</option>
					<option value="2">Top</option>
					<option value="3">Bottom</option>
					<option value="4">Suit</option>
				</select>
		  		<input type="text" id="p_name" placeholder="상품">
				<input type="button" value="검색" onclick="search()">
		  	</div>
		  	<br>
		  	<hr>
		  	<br>
		  	<div class="grid gap-3 grid-cols-3 grid-rows-3">
			<c:forEach var="dto" items="${list}">
			<form action="detail" name="f" method="post">
			<input type="hidden" name="p_num" value="${dto.p_num}">
				<button>
			        <div class="grid grid-cols-6 gap-4">
			            <div class="w-24 h-24 bg-gray-200" style="width: 280px; height: 230px;">
			                <img src="resources/product_img/${dto.p_picture}">
			                <h2 class="text-sm mt-2" align="left">${dto.p_name}</h2>
			           		<p class="text-sm text-gray-600" align="left">${dto.p_price}원</p>
			            </div>
			        </div>
		        </button>
			</form>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
<div align="center">
	${pageMenu}
</div>
</body>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>

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
		
		if(p_name == ''){
			alert("상품을 입력하세요")
			return;
		}
		
		location.href = "p_searchPopup?p_name="+p_name+"&p_id="
	}
	
	function target(p_num , p_name , p_picture){
		console.log(p_num , p_name , p_picture)
		window.parent.document.getElementById("pNum").value = p_num;
// 		window.parent.document.getElementById("pImg").src = p_picture;
		window.parent.document.getElementById("pName").textContent = p_name;
		window.parent.document.getElementById("BtnModalClose").click();
		
	}
</script>
<style type="text/css">
	div.container{
		margin-bottom: 100%;
	}
</style>
</head>
<body class="bg-gray-50">
<div class="relative h-full flex">
	<div class="flex overscroll-auto">
		<div class="py-6 px-4 sm:px-6 lg:px-8">
			<div>
		  		<input type="text" id="p_name" placeholder="상품">
				<input type="button" value="검색" onclick="search()">
		  	</div>
		  	<br>
		  	<hr>
		  	<br>
		  	<div class="grid gap-3 grid-cols-3 grid-rows-3">
			<c:forEach var="dto" items="${list}">
			<input type="hidden" name="p_num" value="${dto.p_num}">
				<button>
			        <div class="grid grid-cols-6 gap-4">
			            <div class="w-24 h-24 bg-gray-200" onclick='target("${dto.p_num}" , "${dto.p_name}" , "${dto.p_picture}")'  style="width: 280px; height: 230px;">
			                <img src="resources/product_img/${dto.p_picture}">
			                <h2 class="text-sm mt-2" align="left">${dto.p_name}</h2>
			           		<p class="text-sm text-gray-600" align="left">${dto.p_price}원</p>
			            </div>
			        </div>
		        </button>
			</c:forEach>
			</div>
		</div>
	</div>
</div>
<div align="center">
	${pageMenu}
</div>
</body>
</html>

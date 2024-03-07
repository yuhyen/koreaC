<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<style>
    body {
        font-family: 'Roboto', sans-serif;
    }
    
    div.container{
		margin-bottom: 100%;
	}
</style>
</head>
<body class="bg-gray-50">
	<div class="relative h-full flex">
		<aside class="float-left w-64 bg-white p-6 shadow-md">
            <div class="flex flex-col space-y-4">
                <a href=""><button class="text-gray-700 font-semibold">New</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Top50</button></a>
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
		<div class="container">
			<c:forEach var="dto" items="${list}">
				<form action="detail" method="post">
				<input type="hidden" name="p_num" value="${dto.p_num}">
					<button>
		                <div class="grid grid-cols-6 gap-4">
		                    <div class="w-24 h-24 bg-gray-200" style="width: 280px; height: 230px;">
		                        <img src="resources/product_img/${dto.p_name}/${dto.p_picture}">
		                        <h2 class="text-sm mt-2" align="left">${dto.p_name}</h2>
	                    		<p class="text-sm text-gray-600" align="left">${dto.p_price}원</p>
		                    </div>
		                </div>
	               	</button>
	    		</form>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>
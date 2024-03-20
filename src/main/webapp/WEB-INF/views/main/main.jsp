<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KoreaMall</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
	body {
        font-family: 'Roboto', sans-serif;
   	}
   	
	.carousel-container {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    overflow: hidden;
	 }

	.carousel-slide {
	    display: flex;
	}

	.carousel-slide img {
	    max-width: 100%; /* 이미지의 최대 너비를 부모 요소의 너비에 맞춤 */
	    max-height: 100%; /* 이미지의 최대 높이를 부모 요소의 높이에 맞춤 */
	    width: auto; /* 가로 크기를 유지하면서 세로 크기에 맞춤 */
	    height: auto; /* 세로 크기를 유지하면서 가로 크기에 맞춤 */
	}
	
	 /* 화살표 버튼 스타일 */
    .arrow {
        cursor: pointer;
        opacity: 1; /* 화살표 버튼이 투명하지 않도록 설정 */
        top: 50%; /* 상위 요소의 50% 위치에 배치 */
        transform: translateY(-50%); /* 상위 요소의 50% 위로 이동하여 정확한 중앙 정렬 */
        z-index: 1; /* 다른 요소 위에 배치 */
        background-color: rgba(0, 0, 0, 0.5); /* 배경색 지정 */
        color: white; /* 텍스트 색상 지정 */
        padding: 10px; /* 내부 여백 지정 */
    }
</style>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body class="bg-gray-50"></body>
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
            <br><br><br>
            <div>
	          	<a href="basket_page">
		           	<button class="text-gray-700 font-semibold">
		           		<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
						  <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 0 0-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 0 0-16.536-1.84M7.5 14.25 5.106 5.272M6 20.25a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Zm12.75 0a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
						</svg>
		           	</button>
	          	</a>
            </div>
        </aside>
        <main class="flex overscroll-auto">
            <div class="py-6 px-4 sm:px-6 lg:px-8">
		       	<div class="grid grid-cols-1">
					<div class="carousel-container">
					    <div class="arrow" onclick="moveSlide(-1)">&#10094;</div>
							<div id="carousel" class="carousel-slide">
						      	<img src="https://m.ycloset.com/web/product/big/202302/86b7ec1346401cc8539aaa2839d445ca.jpg">
			        			<img src="https://m.ycloset.com/web/product/big/202208/d64b176c305fd8b0417cced1e6b35bc1.jpg">
			        			<img src="https://m.ycloset.com/web/product/big/202302/86b7ec1346401cc8539aaa2839d445ca.jpg">
				        		<img src="https://m.ycloset.com/web/product/big/202208/d64b176c305fd8b0417cced1e6b35bc1.jpg"> 
				        		<img src="https://m.ycloset.com/web/product/big/202302/86b7ec1346401cc8539aaa2839d445ca.jpg">
				        		<img src="https://m.ycloset.com/web/product/big/202208/d64b176c305fd8b0417cced1e6b35bc1.jpg">
				        		<img src="https://m.ycloset.com/web/product/big/202302/86b7ec1346401cc8539aaa2839d445ca.jpg">
				        		<img src="https://m.ycloset.com/web/product/big/202208/d64b176c305fd8b0417cced1e6b35bc1.jpg">
						    </div>
					    <div class="arrow" onclick="moveSlide(1)">&#10095;</div>
				  	</div>
				</div>
            	<br>
                <h2 class="text-2xl font-bold text-gray-900 mb-6">New</h2>
                <div class="grid gap-3 grid-cols-3 grid-rows-3">
                <c:forEach var="dto" items="${list}">
					<form action="detail" name="f" method="post">
						<input type="hidden" name="p_num" value="${dto.p_num}">
		                <div class="grid gap-3 grid-cols-3 grid-rows-2">
							<button>
			                    <div class="w-24 h-24 bg-gray-200" style="width: 280px; height: 230px;">
			                        <img src="resources/product_img/${dto.p_picture}">
			                        <h2 class="text-sm mt-2" align="left">${dto.p_name}</h2>
		                    		<p class="text-sm text-gray-600" align="left">${dto.p_price}원</p>
			                    </div>
                			</button>
		                </div>
		    		</form>
				</c:forEach>
				</div>
            </div>
        </main>
    </div>
    <div align="center">
    	${pageMenu}
    </div>
    <jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
<script>
    var currentSlide = 0;
    var totalSlides = document.querySelectorAll('#carousel img').length;
    var carouselWidth = document.querySelector('.carousel-slide').offsetWidth;

    function moveSlide(direction) {
        currentSlide += direction;
        
        if (currentSlide >= totalSlides) {
            currentSlide = 0; // 마지막 이미지에서 다음 버튼을 클릭한 경우, 첫 번째 이미지로 이동
        } else if (currentSlide < 0) {
            currentSlide = totalSlides - 1; // 첫 번째 이미지에서 이전 버튼을 클릭한 경우, 마지막 이미지로 이동
        }
        
        var displacement = -currentSlide * carouselWidth;
        
        document.getElementById('carousel').style.transition = 'transform 0.5s ease';
        document.getElementById('carousel').style.transform = 'translateX(' + displacement + 'px)';
    }
</script>
</body>
</html>

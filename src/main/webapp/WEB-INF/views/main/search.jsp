<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		}
		
		let url = "p_search";
		let param = "p_name="+p_name;
		
		sendRequest(url, param, searchFn, "post")
	}
	
	function searchFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			
			let json = (new Function('return'+data))()
			
			console.log(json)
			
			if(json[0].search == 'no_product') {
				alert("없는 상품이니 다시 입력해주세요")
				return
			}
			
			if(json[0].search == 'yes_product') {
				
			}
		}
	}
</script>
<style type="text/css">
	div.container{
		margin-bottom: 100%;
	}
</style>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body>
	<aside class="float-left w-64 bg-white p-6 shadow-md">
            <div class="flex flex-col space-y-4">
                <a href=""><button class="text-gray-700 font-semibold">New</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Top50</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Outer</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Top</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Bottom</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Suit</button></a>
                <a href=""><button class="text-gray-700 font-semibold">Cart</button></a>
            </div>
        </aside>
       	<div class="container">
		<div class="relative" align="center">
			<input type="text" id="p_name" value="${p_name}">
			<input type="button" value="검색" onclick="search()">
		</div>
		</div>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>

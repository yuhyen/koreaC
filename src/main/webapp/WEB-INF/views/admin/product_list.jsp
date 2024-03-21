<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	function modify(p_num){
		location.href="modify?p_num="+p_num;
	}
	
	function del(p_num){
		
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		let url = "delete";
		let param = "p_num="+p_num;
		
		sendRequest(url, param, deleteFn, "POST")
	}
	
	function deleteFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return' + data))();
			
			if(json[0].del == 'no'){
				alert('삭제 실패')
				return;
			}
			
			alert('삭제 성공')
			location.href="pList_form";
		}
	}
</script>

</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body>
<div class="container mx-auto p-6">
	<div class="divide-x-2 divide-black flex justify-around mb-4">
		<a href="pList_form"><button>All</button></a>
		<a href="product_category?p_id=1"><button>Outer</button></a>
		<a href="product_category?p_id=2"><button>Top</button></a>
		<a href="product_category?p_id=3"><button>Bottom</button></a>
		<a href="product_category?p_id=4"><button>Suit</button></a>
		<a href="p_add_form"><button>상품 등록</button></a>
	</div>
	<hr>
	<div class="bg-white shadow-md rounded my-6">
	<table class="divide-y divide-black text-center w-full">
		<thead>
		<tr class="divide-x divide-black">
			<th>상품번호</th>
			<th>상품명</th>
			<th>재고</th>
			<th></th>
		</tr>
		</thead>
		<c:forEach var="dto" items="${list}">
		<tbody>
		<tr class="divide-x divide-black">
			<td>${dto.p_num}</td>
			<td>${dto.p_name}</td>
			<td>${dto.p_stock}</td>
			<td>
				<input type="button" value="수정" onclick="modify(${dto.p_num})">
			</td>
			<td>
				<input type="button" value="삭제" onclick="del(${dto.p_num})">
			</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
	</div>
</div>
<div align="center">
	${pageMenu}
</div>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
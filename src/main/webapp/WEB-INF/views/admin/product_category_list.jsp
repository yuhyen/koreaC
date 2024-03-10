<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<style type="text/css">
	table{
		margin: 0 auto;
		border-style: solid black 1px;
	}
</style>
<script type="text/javascript">
	function send(f){
		
		f.action = "p_add_main";
		f.submit();
	}
	
	function del(f,p_num){
		let p = f.p_num.value;
		
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
	<div align="center">
		<a href="product_category?p_id=1"><button>Outer</button></a>
		<a href="product_category?p_id=2"><button>Top</button></a>
		<a href="product_category?p_id=3"><button>Bottom</button></a>
		<a href="product_category?p_id=4"><button>Suit</button></a>
	</div>
	<hr>
	<form>
		<table>
			<tr>
				<th>상품명</th>
				<th>상품설명</th>
				<th>원단</th>
				<th>가격</th>
			</tr>
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.p_name}</td>
				<td>${dto.p_explain}</td>
				<td>${dto.p_pabric}</td>
				<td>${dto.p_price}원</td>
				<td>
					<input type="hidden" name="p_num" value="${dto.p_num}">
					<input type="button" value="등록" onclick="send(this.form)">
					<input type="button" value="삭제" onclick="del(this.form , ${dto.p_num})">
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
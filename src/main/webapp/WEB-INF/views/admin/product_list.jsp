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
	function modify(p_num){
		location.href="modify?p_num="+p_num;
	}
	
	function send(p_num){
		
		if(!confirm("등록하시겠습니까")){
			return;
		}
		
		let url = "upload"
		let param = "p_num="+p_num;
		
		sendRequest(url, param, uploadFn, "post")
	}
	
	function uploadFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return' + data))();
			
			if(json[0].upload == 'no'){
				alert('등록 실패')
				return
			}
			
			alert('등록 성공')
			location.href="pList_form";
		}
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
	<div align="center">
		<a href="product_category?p_id=1"><button>Outer</button></a>
		<a href="product_category?p_id=2"><button>Top</button></a>
		<a href="product_category?p_id=3"><button>Bottom</button></a>
		<a href="product_category?p_id=4"><button>Suit</button></a>
	</div>
	<hr>
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
				<input type="button" value="등록" onclick="send(${dto.p_num})">
				<input type="button" value="수정" onclick="modify(${dto.p_num})">
				<input type="button" value="삭제" onclick="del(${dto.p_num})">
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
		<input type="hidden" name="p_num" value="${p_num}">
	<div>
		<img src="resources/product_img/${dto.p_name}/${dto.p_picture}">
	</div>
	<div>
		<strong>${dto.p_name}</strong><br>
		<strong>${dto.p_price}원</strong>
		<div>
			상품설명 : 
			${dto.p_explain}
		</div>
		<div>
			원단 : 
			${dto.p_pabric}
		</div>
		<div>
			색상 : 
			<select id="select_p_size">
				<option value="${dto.p_color}">black</option>	
				<option value="${dto.p_color}">white</option>	
				<option value="${dto.p_color}">red</option>	
				<option value="${dto.p_color}">green</option>	
			</select>  
		</div>
		<div>
			사이즈 : 
			<select id="select_p_size">
				<option value="${dto.p_size}">M</option>	
				<option value="${dto.p_size}">L</option>	
				<option value="${dto.p_size}">XL</option>	
			</select>  
		</div>
	</div>
</body>
</html>
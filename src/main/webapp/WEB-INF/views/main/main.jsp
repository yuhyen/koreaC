<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<div>
		<a href="p_add_form">등록</a>
	</div>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div align="center">
		<h1>New</h1>
	</div>
	<div>
		<c:forEach var="dto" items="${list}">
			<form action="detail" method="post">
			<input type="hidden" name="p_num" value="${dto.p_num}">
				<button>
				<div>
					<div>
						<img src="resources/product_img/${dto.p_picture}">
					</div>
					<div>
						<h2>${dto.p_name}</h2>
						<div>
							<p>${dto.p_price}원</p>
						</div>
					</div>
				</div>
				</button>
			</form>
		</c:forEach>	
	</div>
</body>
</html>
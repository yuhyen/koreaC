<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2>상품 수정하기</h2>
		<form action="" name="f" method="post" enctype="multipart/form-data">
			<input type="hidden" name="picture_count" value="-1">
			<input type="hidden" name="p_num" value="${dto.p_num}">
			<table border="1">
				<tr>
					<th>상품명</th>
					<td><input name="p_name" value="${dto.p_name}"></td>
				</tr>
				<tr>
					<th>상품유형</th>
					<td>
						<select id="select_p_id" name="p_id" onchange="change_p_id()">
						     <option value="1">Outer</option>
						     <option value="2">Top</option>
						     <option value="3">Bottom</option>
						     <option value="4">Suit</option>
					   	</select>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input name="p_price" value="${dto.p_price}">원</td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea name="p_explain" rows="10" cols="50" style="resize: none;">${dto.p_explain}</textarea></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>
						<select name="p_size">
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>색상</th>
					<td>
						<select name="p_color">
							<option value="black">black</option>
							<option value="black">white</option>
							<option value="black">red</option>
							<option value="black">green</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>원단</th>
					<td><input name="p_pabric" value="${dto.p_pabric}"></td>
				</tr>
				<tr>
					<th>재고</th>
					<td><input name="p_stock" value="${dto.p_stock}"></td>
				<tr>
					<th>사진</th>
					<td><input name="picture" value="${dto.p_picture}" type="file" multiple="multiple"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정" onclick="send_check()">
						<input type="button" value="취소" onclick="location.href='pList_form'">
					</td>			
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send_check(){
		let f = document.f;
		let name = f.p_name.value;
		let id = f.p_id.value;
		let price = f.p_price.value;
		let explain = f.p_explain.value;
		let size = f.p_size.value;
		let pabric = f.p_pabric.value;
		let stock = f.p_stock.value;
		let picture = f.picture.files.length;
		
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>상품 등록하기</h2>
		<form action="p_add" name="f" method="post" enctype="multipart/form-data">
			<input type="hidden" name="picture_count" value="-1">
			<table border="1">
				<tr>
					<th>상품명</th>
					<td><input name="p_name"></td>
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
					<td><input name="p_price">원</td>
				</tr>
				<tr>
					<th>설명</th>
					<td><textarea name="p_explain" rows="10" cols="50" style="resize: none;"></textarea></td>
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
					<td><input name="p_pabric"></td>
				</tr>
				<tr>
					<th>재고</th>
					<td><input name="p_stock"></td>
				<tr>
					<th>사진등록</th>
					<td><input name="picture" type="file" multiple="multiple"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="send_check()">
						<input type="button" value="취소" onclick="location.href='pList_form'">
					</td>			
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
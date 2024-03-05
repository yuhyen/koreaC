<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delay</title>
<style type="text/css">
	div.container{
		margin: 0 auto;
		width: 700px;
		height: 1000px;
		border: solid gray 5px;
		text-align: center;
	}
</style>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body>
	<div class="container">
		<div>
			<br>
			<h1>DELAY</h1>
			<h2>입고가 지연되고 있는 상품에 대해 안내드립니다.</h2>
			<p>최종 업데이트 날짜 : 2024-03-19</p>
		</div>
		<div>
			<h2>코리아몰</h2>
			<h2>입고 지연 품목 일정 안내</h2>
			<br>
			<p>입고가 지연되는 상품 출고 예정일 안내입니다.</p>
			<br>
			<p>해당 날짜는 거래처에서 안내해준 날짜로,</p>
			<b>실제 발송일은 더 빠르거나 미뤄질 수 있는 점</b>
			<p>참고하여 상품 구매 결정 해주시면 감사드리겠습니다.</p>
			<br><br>
			<p>입고 날짜는 매일 오전11시에</p>
			<p>리뉴얼 되어 안내되는 점 알려드립니다.</p>
			<br>
			<br>
			<b>Ctrl + F</b><p>단축키를 통해 원하는</p>
			<p>상품을 빠르게 찾아보실 수 있습니다.</p>
		</div>
		<br><br>
		<div>
			<h1>OUTER</h1>
		</div>
		<br><br><br>
		<div>
			<h1>TOP</h1>
		</div>
		<br><br><br>
		<div>
			<h1>BOTTOM</h1>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</body>
</html>
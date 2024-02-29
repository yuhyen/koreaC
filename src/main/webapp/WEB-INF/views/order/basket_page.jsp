<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="resources/js/HttpRequest.js"></script>
<script>
  function basket_del(b){
	  if(!confirm("삭제하시겠습니까?")){
			return;
		}
	let url = "basket_del";
	let param = "idx="+b;
	
	console.log("sendvalue " , param)
	
	sendRequest(url, param, delcallback, "POST");
  }
  function delcallback(){
	  if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return' + data))();
			
			if(json[0].param == 'yes'){
				alert("삭제 성공");
				location.href = 'basket_page';
			}
			if(json[0].param == 'no'){
				alert("삭제 실패");
			}
			
			
	  }
  }
</script>
<style>
  .checkbox:checked + .check-icon {
    display: flex;
  }
</style>
</head>
<body class="bg-gray-100">
<div id="app" class="container mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
  <div class="flex items-center mb-4">
    <h1 class="text-xl font-semibold mr-auto">장바구니</h1>
    <span class="text-gray-600">${user.u_username }님</span>
  </div>
  <table class="min-w-full table-fixed">
    <thead>
      <tr class="bg-gray-200">
        <th class="w-1/12 px-4 py-2">체크</th>
        <th class="w-2/12 px-4 py-2">이미지</th>
        <th class="w-3/12 px-4 py-2">상품정보</th>
        <th class="w-1/12 px-4 py-2">판매가</th>
        <th class="w-1/12 px-4 py-2">수량</th>
        <th class="w-1/12 px-4 py-2">배송비</th>
        <th class="w-1/12 px-4 py-2">합계</th>
        <th class="w-1/12 px-4 py-2">삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="basket" items="${basket }">
      <tr>
        <td class="border px-4 py-2 text-center">
          <input type="checkbox" class="checkbox" v-model="item.checked" @change="updateTotal">
          <span class="check-icon hidden justify-center items-center">
            ✔
          </span>
        </td>
        <td class="border px-4 py-2">
          <img :src="item.image" alt="" class="h-16 mx-auto">
        </td>
        <td class="border px-4 py-2">${basket.p_name }</td>
        <td class="border px-4 py-2">${basket.p_price }</td>
        <td class="border px-4 py-2 text-center">${basket.b_quantity }</td>
        <td class="border px-4 py-2">${basket.b_shipping }</td>
        <td class="border px-4 py-2">${basket.p_price + basket.b_shipping }</td>
        <td class="border px-4 py-2 text-center">
          <button onclick ="basket_del(${basket.b_idx})">X</button>
        </td>
      </tr>
      </c:forEach>	
    </tbody>
  </table>
  <div class="flex justify-end mt-4">
    <div class="text-lg font-semibold">
      총 가격: {{ total.toLocaleString() }}원
    </div>
  </div>
  <div class="flex justify-end mt-4 space-x-2">
    <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" >전체 상품 구매</button>
    <button class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-700" >선택 상품 구매</button>
  </div>
</div>

</body>
</html>
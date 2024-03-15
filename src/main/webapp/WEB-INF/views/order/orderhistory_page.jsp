<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
    <script src="https://cdn.tailwindcss.com"></script>
     <script src="resources/js/HttpRequest.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }
    </style>
     <script type="text/javascript">
    
    	function search(){
			let orderstatus = document.getElementById('order-status').value;
			let startdate = document.getElementById('start-date').value;
			let enddate = document.getElementById('end-date').value;
			let userid = document.getElementById('userid').value;
			
// 			let jsonString = {
// 					orderstatusjs : orderstatus,
// 					startdatejs : startdate,
// 					enddatejs : enddate,
// 					useridjs : userid		
// 			}
// 			let url = "histroy_search";
// 			let param = JSON.stringify(jsonString);
			
// 			sendRequestContent(url, param, searchCallback, "POST" , false , "application/json");	
// 		}    
    	
//     	function searchCallback(){
//     		if(xhr.readyState == 4 && xhr.status == 200){
//         		let data = xhr.responseText;
//     			let json = (new Function('return' + data))();
//     			if(json[0].param == 'yes'){
//     				alert("검색 완료");
//     			}
//     			if(json[0].param == 'no'){
//     				alert("검색 결과가 없습니다")
//     			}
//     		}

		location.href = "history_search?orderstatus=" + orderstatus+"&startdate=" + startdate + "&enddate=" + enddate + "&userid=" + userid;

    	}
    	
    	
    	
    </script>
</head>

<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <div class="mb-4">
                <h1 class="text-xl font-semibold mb-2">주문 내역</h1>
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <span class="mr-2"></span>
                        <span class="font-semibold">${user.u_username } 님</span>
                    </div>
                    <div class="flex items-center">
                        <label for="order-status" class="mr-2">주문 상태:</label>
                        <select id="order-status" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                            <option>--전체--</option>
                            <option>배송중</option>
                            <option>배송완료</option>
                        </select>
                    </div>
                </div>
                <div class="flex items-center justify-between mt-4">
                    <div class="flex items-center">
                        <label for="start-date" class="mr-2">From:</label>
                        <input type="date" id="start-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                    </div>
                    <div class="flex items-center">
                        <label for="end-date" class="mr-2">To:</label>
                        <input type="date" id="end-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                    </div>
                    <input type="hidden" id="userid" value="${user.u_id }">
                    <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" onclick="search()">
                        조회
                    </button>
                </div>
            </div>
            <div class="mt-6">
                <div class="flex flex-col">
                    <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                            <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg" >
                                <table class="min-w-full divide-y divide-gray-200" id="tableid">
                                    <thead class="bg-gray-50">
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                상품 번호
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                이미지
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                상품 정보
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                수량
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                상품구매금액
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                배송지
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                주문날자
                                            </th>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                주문처리상태
                                            </th>
                                        </tr>
                                    </thead>
                                    
                                    <c:forEach items="${order }" var="arr" varStatus="i">
                                    		
                                    <tbody class="bg-white divide-y divide-gray-200" class="tbody">
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_ordernum }</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <img src="https://source.unsplash.com/random/128x128?clothes" alt="Product Image" class="h-12 w-12 rounded-full">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_proname },
                                                									${arr.o_size },
                                                									${arr.o_pabrice }
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_quantity }</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_price } 원</div>
                                            </td>
                                             <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_addres } 원</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_order_date}</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                                    ${arr.o_state}
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                     <c:if test="${order[i.index].o_ordernum < order[i.index + 1].o_ordernum }">
            							<thead class="bg-gray-50"> 
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" colspan="8">
                                           	<br>
                                            </th>
                                        </tr>
                                    </thead>
                              		</c:if>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                     
                </div>
                
             
            </div>
             
        </div>
							 <div>
                               	<button id="moreView" class = "bb"><span>더보기</span></button>
                               </div>    
    </div>
    
    <script type="text/javascript">
    let startNum = $("#tableid tbody").length;
    let addListHTML = "";
	console.log(startNum);
    
	
    </script>
</body>
</html>


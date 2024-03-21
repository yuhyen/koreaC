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

<body class="bg-gray-100" id = "body">
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
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
                            <c:if test="${serdto.orderstatus != null }"><option>${serdto.orderstatus }</option></c:if>
                            <option>--전체--</option>
                            <option>배송중</option>
                            <option>배송완료</option>
                        </select>
                    </div>
                </div>
                <div class="flex items-center justify-between mt-4">
                    <div class="flex items-center">
                        <label for="start-date" class="mr-2">From:</label>
                        <c:choose>
                        	<c:when test="${serdto.startdate != ''}">
                        		<input type="date" id="start-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" value = "${serdto.startdate}">
                        	</c:when>
                        	<c:otherwise>
                        <input type="date" id="start-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
   							</c:otherwise>
                    	</c:choose>
                    </div>
                    <div class="flex items-center">
                        <label for="end-date" class="mr-2">To:</label>
                        <c:choose>
                        	<c:when test="${serdto.enddate != '' }">
                        <input type="date" id="end-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" value="${serdto.enddate }">	
                        	</c:when>
                        <c:otherwise>
                        <input type="date" id="end-date" class="bg-gray-200 border border-gray-200 text-gray-700 py-2 px-4 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                    	</c:otherwise>
                    	</c:choose>
                    </div>
                    <input type="hidden" id="userid" value="${user.u_id }">
                    <button class="bg-black hover:bg-gray-500 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" onclick="search()">
                        조회
                    </button>
                </div>
            </div>
            <div class="mt-6">
                <div class="flex flex-col">
                    <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                            <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg" >
                                <table class="min-w-full divide-y divide-gray-200" id="table">
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
                                    		
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        <tr id="liad_id_list" class="load_list">
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_ordernum }</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <img src="resources/product_img/${dto.p_picture}" class="h-12 w-12 rounded-full">
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${arr.o_proname }<br>
                                                									${arr.o_size }<br>
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
                                                <div class="text-sm text-gray-900">${arr.o_addres }</div>
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
                                     <c:if test="${order[i.index].o_ordernum > order[i.index + 1].o_ordernum }">
            							<thead>     <!-- class="bg-gray-50"  --> 
                                        <tr>
                                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" colspan="8">
                                           	<br>
                                           	<br>
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
        							<input type="hidden" id ="count" value="${count }">
        							<div class="flex justify-center mt-4 space-x-2" id="morebtndiv">
									<input type="button" value="더보기" id = "morebtn"  class="px-10 py-2 bg-black text-white rounded hover:bg-gray-500">		    
    								</div>
    </div>
    
    <script type="text/javascript">

  /*   let idNum = 0;
	let newNode = null; */
	
	let morenum = 0;
    
    let morebtn = document.getElementById('morebtn');
    
   	//만약 첫 조회가 4개 이상이 아닐떄 버튼 삭제
    let countdel = document.getElementById('count').value.trim();
    if(countdel <= 4){
		morebtn.remove();
	}
    
    
   morebtn.addEventListener('click', function(){
	   		
	   	/* 	if(newNode != null){
	   		 let testDiv = document.getElementById('body');
	   		 testDiv.after(newNode);
	   		 testDiv.remove();
	   		} */
	   
	   		let count = document.getElementById('count').value.trim();
    		let orderstatus = document.getElementById('order-status').value;
			let startdate = document.getElementById('start-date').value;
			let enddate = document.getElementById('end-date').value;
			
			let jsonString = {
					countjs : count,
					orderstatusjs : orderstatus,
					startdatejs : startdate,
					enddatejs : enddate
	    	}
			
			let param = JSON.stringify(jsonString);
			let url = "moreClick";
			
    		//location.href = "moreClick?count=" + count + "&orderstatus=" + orderstatus+"&startdate=" + startdate + "&enddate=" + enddate;
    		

    		sendRequestContent(url, param, moreCallback, "POST" , false , "application/json");
		
   }); //클릭 이벤트 
    	
    	function moreCallback(){
    		if(xhr.readyState == 4 && xhr.status == 200){
    			let list = JSON.parse(xhr.response);
        		let order = list.ordermore;
    			
    			
    			
    			//카운트 value바꾸기
    			 let c = document.getElementById('count');
    			 c.value = list.count;
    			 
				// 버튼 삭제 
    	        	if(c.value <= 5){
    	        		morebtn.remove();
    	        	}
    			
    			// 구분선 
    			let startorderadd = `
        			<thead> 
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" colspan="8">
                       	<br>
                       	<br>
                       	<br>
                        </th>
                    </tr>
                </thead>
        		`;
    			
        		document.querySelector("#table").insertAdjacentHTML("beforeend", startorderadd);
    			
        		
    			if(morenum != 0){
    				morenum++;
    			}
    			
    		
    		
    		// 더보기 눌렀을떄 나올 태그들 
    		for (let i = 0; i < order.length; i++) {
    		
    		let orderadd = `
    			
    			<tbody class="bg-white divide-y divide-gray-200" name="tbody">
                <tr id="liad_id_list" class="load_list">
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name = "ordernum"></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <img src="https://source.unsplash.com/random/128x128?clothes"  class="h-12 w-12 rounded-full" name="imgg">
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name = "proname_size_pabrice">
                        									
                        </div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name="quantity"></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name="price"></div>
                    </td>
                     <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name="addres"></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <div class="text-sm text-gray-900" name="date"></div>
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800" name="state">
                           
                        </span>
                    </td>
                </tr>
            </tbody>
    		
    		`;
    		document.querySelector("#table").insertAdjacentHTML("beforeend", orderadd);
			
    		let img = document.getElementsByName('imgg')[morenum];
    		let ordernum = document.getElementsByName('ordernum')[morenum];
    		let proname_size_pabrice = document.getElementsByName('proname_size_pabrice')[i];
    		let quantity = document.getElementsByName('quantity')[morenum];
    		let price = document.getElementsByName('price')[morenum];
    		let addres = document.getElementsByName('addres')[morenum];
    		let date = document.getElementsByName('date')[morenum];
    		let state = document.getElementsByName('state')[morenum];
    		
    		ordernum.innerHTML = order[i].o_ordernum;
    		proname_size_pabrice.innerHTML = order[i].o_proname + "<br>" + order[i].o_size + "<br>" + order[i].o_pabrice;
    		quantity.innerHTML = order[i].o_quantity;
    		price.innerHTML = order[i].o_price + " 원";
    		addres.innerHTML = order[i].o_addres;
    		date.innerHTML = order[i].o_order_date;
    		state.innerHTML = order[i].o_state;
    		img.src = "resources/product_img/" + order[i].o_picture;
    	
    		//주문번호가 다를시 구분선 추가 
    		if(order[i].o_ordernum != order[i+1].o_ordernum){
    			let head = `
    				<thead> 
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" colspan="8">
                       	<br>
                       	<br>
                       	<br>
                        </th>
                    </tr>
                </thead>
    			`;
    			document.getElementsByName('tbody')[morenum].insertAdjacentHTML("beforeend", head);
    			
    		} 
   
    		
    	morenum++;	
    		
    	}//for문
    		
    }//xhr if

    	/* 	 // 'test' node 선택
  		  let testDiv = document.getElementById('body');
  		  
  		  // 노드 복사하기 (deep copy)
  		  newNode = testDiv.cloneNode(true); */
    		// 마지막일경우 삭제 로직
  		  
  		  
  }//callback 
    	
    
    </script>
    
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>


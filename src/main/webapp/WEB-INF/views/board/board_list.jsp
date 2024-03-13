<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.3/dist/full.min.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<script src="resources/js/HttpRequest.js"></script>
<style>
 body {
 	font-size: 11px;
 	font-family: 'Open Sans', sans-serif;
 }
    display: flex;
  }
</style>
</head>
<body class="bg-gray-100">
<div id="app" class="container mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
  <div class="flex justify-between items-center mb-6">
    <a id="boardName" href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800">게시판종류</a>
    <span id="userName" class="text-gray-600">로그인아이디넣기</span>
  </div>
  <table class="min-w-full table-fixed">
    <thead>
      <tr class="bg-gray-200">
        <th class="w-20 px-4 py-2">NO</th>
        <th class="w-40 px-4 py-2">PRODUCT</th>
        <th class="w-80 px-4 py-2">SUBJECT</th>
        <th class="w-20 px-4 py-2">NAME</th>
        <th class="w-40 px-4 py-2">DATE</th>        
      </tr>
    </thead>
    <tbody>
      <tr v-for="(item, index) in boardItems" :key="index">
        <td class="border px-1 py-2 text-center"> {{ item.no }}</td>
        <td class="border px-4 py-2">
          <img :src="item.product" alt="" class="h-16 mx-auto">
        </td>
        <td class="border px-6 py-2 text-left" @click="subjectClicked(item.no)">{{ item.subject }}</td>
        <td class="border px-4 py-2 text-center">{{ item.name }}</td>
        <td class="border px-6 py-2 text-center" >{{ item.date }}</td>
      </tr>
    </tbody>
  </table>
<!--   <div class="flex justify-end mt-4"> -->
<!--     <div class="text-lg font-semibold"> -->
<!--       총 가격: {{ total.toLocaleString() }}원 -->
<!--     </div> -->
<!--   </div> -->
<!--   <div class="flex justify-end mt-4 space-x-2"> -->
<!--     <button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" @click="purchaseAll">전체 상품 구매</button> -->
<!--     <button class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-700" @click="purchaseSelected">선택 상품 구매</button> -->
<!--   </div> -->
	<div class="flex px-4 py-2 justify-center">
		<div class="inline-flex items-center" v-for="(item, index) in pageNumList" :key="index">
	        <button v-if="item === startPage" class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-l"  @click="prevPage">
	            <
	        </button>
	        <button  class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4" @click="pageMove(item)">
	        	
	            <span v-if="item === nowPage" class="text-blue-600"> {{ item }}</span>  
	            <span v-if="item !== nowPage" > {{ item }}</span>
	            
	        </button>
	        <button v-if="item === endPage"  class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-r"  @click="nextPage">
	            >
	        </button>
	        
	    </div>
    </div>
<!-- 	<div class="flex px-4 py-2 justify-center"> -->
<!-- 		<div class="inline-flex items-center" v-for="(item, index) in pageItems" :key="index"> -->
<!-- 	        <button v-if="item.no === 0" class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-l"> -->
<!-- 	            < -->
<!-- 	        </button> -->
<!-- 	        <button  class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4"> -->
<!-- 	            {{ item.no }}   -->
<!-- 	        </button> -->
<!-- 	        Repeat for other page numbers -->
<!-- 	        <button v-if="item.no === 2"  class="text-sm bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded-r"> -->
<!-- 	            > -->
<!-- 	        </button> -->
<!-- 	    </div> -->
<!--     </div> -->
  <div class="flex mt-4 space-x-2">
<!--   	<div class="mb-4"> -->
<!--          <label for="search" class="block text-gray-700 text-sm font-semibold mb-2">검색조건</label> -->
         <select id="searchType" class="block w-100 bg-gray-50 border border-gray-300 text-gray-700 py-2 px-3 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
             <option>SUBJECT</option>
             <option>NAME</option>
         </select>
         <input id="searchKey"type="text" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"/>
<!--     </div> -->
	
	<button id="searchBtn" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" @click="searchBoard">검색</button>
    <button id="regBtn" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" @click="registBoard">글쓰기</button>
  </div>
</div>

<script>
	let typeCategory;
	window.onload = () => { 
		const qa =  location.search
		const urlParam = new URLSearchParams(qa);
		typeCategory = urlParam.get("type") 
		console.log(typeCategory);
		getBoardName(urlParam.get("type"))
		let uid = pageLoad(1 , typeCategory , "" , "");
//   		document.getElementById("userName").textContent = uid;
		
	}
	
	let pageLoad = (pageNo , typeCategory , searchType ,searchKey ) =>{
		
		let output;
		let sendObj = setSendObj( pageNo ,typeCategory , searchType , searchKey);
// 		sendRequestContent("board_list.json" , JSON.stringify(sendObj) , "" ,"POST" , true , "application/json");
		sendRequestContent("board_page.json" , JSON.stringify(sendObj) , "" ,"POST" , true , "application/json");
		if(xhr.status == "200"){
      		let returnObj = JSON.parse(xhr.response);
      		console.log(returnObj);
      		let data = returnObj.data.list;
      		data.forEach( (obj) =>{
      			let date = new Date(Number(obj.B_MOD_DATE));
      			obj.no = obj.B_SEQ
      		    obj.product = ''
      		    obj.subject = obj.B_TITLE
      		    obj.name = obj.B_USER
      		    obj.date = date.toISOString().substring(0,10)
      		});
      		vueObj.boardItems = [];
      		vueObj.boardItems = data;
      		
      		//아이디
      		output = returnObj.u_id;

			//페이징용
			let page = returnObj.data.page;
      		console.log(page);
			vueObj.total = page.total;
			vueObj.startPage = page.startPage;
			vueObj.endPage = page.endPage;
			vueObj.lastPage = page.lastPage;
			vueObj.nowPage = page.nowPage;
			
			vueObj.pageNumList =  []
			for(let i=page.startPage ; i <=page.endPage ; i++){
				vueObj.pageNumList.push(i);
			}
						
			
      	}else{
      		console.log("오류처리")
      		alert("select 실패")
      	}
		return output;
	}
	
	let setSendObj = (pageNo , typeCategory , searchType , searchKey) =>{
    	sendObj = {
   	            pageNo : pageNo
   	           ,category : typeCategory 
   	           ,searchType : searchType
   	           ,searchKey : searchKey
    		}
    	
    	return sendObj;
	}
	  
	
	let getBoardName = (type) =>{
    	let nameEl = document.getElementById("boardName")
    	let name = "";
    	let url = "";
    	switch (type) {
    	  case 'qna':
    		name = "Q&A"
    		url = "";
    	  	break;
    	  case 'review':
    		name = "REVIEW"
    	    url = "";
      	  	break;
    	  case 'notice':
    		name = "NOTICE"
    	    url = "";
        	break;
    	  default:
    		  name = "게시판"
    	}
    	
		nameEl.text = name;
		nameEl.href = "/mall/board_list?type="+type
		
		return name;
    } 

   let vueObj = new Vue({
    el: '#app',
    data: {
      boardItems: []
      ,
      pageNumList: []
      ,
      startPage : 0
      , 
      lastPage : 0
      ,
      nowPage : 0
      ,
      total: 0,
      
    },
    methods: {
        subjectClicked :function (seq) {
        	alert("게시판 클릭");
        	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
          	let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
          	let path = contextPath+"/board_view?seq="+seq;
          	location.href=path;
        },
        searchBoard:function(){
        	alert("검색 클릭");
        	pageLoad(1 , typeCategory , document.getElementById("searchType").value , document.getElementById("searchKey").value);
        	
        },
        registBoard:function(){
          	alert("글쓰기 클릭");
          	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
          	let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
          	let path = contextPath+"/board_reg"
          	location.href=path;
        },
        prevPage:function(){
          	if(vueObj.startPage == 1 ){
          		alert("첫번째 입니다.");
          		return;
          	}
          	pageLoad(vueObj.startPage-1 , typeCategory , "" , "");
        },
        nextPage:function(){
        	
          	if(vueObj.lastPage == vueObj.endPage ){
          		alert("마지막 입니다.");
          		return;
          	}
        	pageLoad(vueObj.endPage+1 , typeCategory , "" , "");
        	
			          	
          	
        },
        pageMove:function(pageNo){
        	console.log("현제 페이지 " , vueObj.nowPage )
        	console.log("이동할페이지 " , pageNo )
        	if(vueObj.nowPage == pageNo ){
          		alert("현재 페이지 입니다.");
          		return;
          	}
        	
        	pageLoad(pageNo , typeCategory , "" , "");
        	
        	
        }
        
      
    }
  });
</script>
</body>
</html>
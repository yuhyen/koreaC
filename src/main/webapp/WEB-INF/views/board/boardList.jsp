<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping Cart</title>
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
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
  <div class="flex items-center mb-4">
    <h1 class="text-xl font-semibold mr-auto">게시판종류아이디넣기</h1>
    <span class="text-gray-600">로그인아이디넣기</span>
  </div>
  <table class="min-w-full table-fixed">
    <thead>
      <tr class="bg-gray-200">
        <th class="w-20 px-4 py-2">NO</th>
        <th class="w-40 px-4 py-2">PRODUCT</th>
        <th class="w-80 px-4 py-2">SUBJECT</th>
        <th class="w-20 px-4 py-2">NAME</th>
        <th class="w-40 px-4 py-2">DATE</th>
        <th class="w-20 px-4 py-2">HIT</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(item, index) in boardItems" :key="index">
        <td class="border px-1 py-2 text-center"> {{ item.no }}</td>
        <td class="border px-4 py-2">
          <img :src="item.product" alt="" class="h-16 mx-auto">
        </td>
        <td class="border px-6 py-2 text-left" @click="subjectClicked">{{ item.subject }}</td>
        <td class="border px-4 py-2 text-center">{{ item.name }}</td>
        <td class="border px-6 py-2 text-center" >{{ item.date }}</td>
        <td class="border px-4 py-2 text-center">{{ item.hit }}</td>
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
  <div class="flex mt-4 space-x-2">
<!--   	<div class="mb-4"> -->
<!--          <label for="search" class="block text-gray-700 text-sm font-semibold mb-2">검색조건</label> -->
         <select id="search" class="block w-100 bg-gray-50 border border-gray-300 text-gray-700 py-2 px-3 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
             <option>SUBJECT</option>
             <option>NAME</option>
         </select>
         <input type="text" class="block flex-1 border-0 bg-transparent py-1.5 pl-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"/>
<!--     </div> -->
	<button id="searchBtn" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" @click="searchBoard">검색</button>
    <button id="regBtn" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700" @click="registBoard">글쓰기</button>
  </div>
</div>

<script>
  new Vue({
    el: '#app',
    data: {
      boardItems: [
        {
          no: '공지',
          product: '',
          subject: '공지사항',
          name: '손종욱',
          date: '2024-01-01',
          hit: 3000,
        },
        {
          no: 1,
          product: 'https://source.unsplash.com/random/200x200?product',
          subject: '상품1',
          name: '손종욱',
          date: '2024-01-01',
          hit: 3000,
        },
        {
          no: 2,
          product: 'https://source.unsplash.com/random/200x200?product',
          subject: '상품2',
          name: '손종욱',
          date: '2024-01-01',
          hit: 3000,
        }
      ],
      total: 0,
    },
    methods: {
//       updateTotal() {
//         this.total = this.boardItems.reduce((acc, item) => {
//           return item.checked ? acc + item.price * item.quantity + item.shipping : acc;
//         }, 0);
//       },
//       removeItem(index) {
//         this.boardItems.splice(index, 1);
//         this.updateTotal();
//       },
//       purchaseAll() {
//         alert('전체 상품을 구매합니다.');
//       },
//       purchaseSelected() {
//         if (this.boardItems.some(item => item.checked)) {
//           alert('선택한 상품을 구매합니다.');
//         } else {
//           alert('구매할 상품을 선택해주세요.');
//         }
//       },
        subjectClicked :function () {
        	alert("게시판 클릭");
          },
          registBoard:function(){
          	alert("글쓰기 클릭");
          	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
          	let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
          	let path = contextPath+"/board_reg"
          	location.href=path;
          }
      
    }
  });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }
        .grid-cell {
            width: 100px;
            height: 100px;
        }
        .border-b-4 {
            border-bottom-width: 4px;
        }
      	
    </style>
</head>
<body class="bg-white text-gray-800">
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-6">
            <div class="text-lg font-semibold">마이페이지</div>
            <div class="text-lg">${user.u_username } 님</div>
        </div>
        <br>
        <br>
        <br>
        <div class="flex justify-between items-center mb-6">
            <div class="flex-1 text-center border-r-4 border-gray-300">
                <div class="text-sm text-gray-500">회원 등급</div>
                <div class="text-2xl font-semibold">
				<c:choose>
				<c:when test="${user.u_total >= 5000000}">diamond</c:when>
				<c:when test="${user.u_total <= 4999999 && user.u_total >= 4000000 }">Platinum</c:when>
				<c:when test="${user.u_total <= 3999999 && uesr.u_total >= 3000000 }">Gold</c:when>
				<c:when test="${user.u_total <= 2999999 && user.u_total >= 2000000 }">Silver</c:when>
				<c:when test="${user.u_total <= 1999999 && user.u_total >= 1000000 }">Bronze</c:when>
				<c:when test="${user.u_total <= 999999 }">Iron</c:when>
				
				</c:choose>
                </div>
            </div>
            <div class="flex-1 text-center">
                <div class="text-sm text-gray-500">적립금</div>
                <div class="text-2xl font-semibold">${user.u_reserve } point</div>
            </div>
        </div>
        <br>
        <br>
        <hr style="border-width:2px 0 0 0; border-color:#000;">
        <br>
        <br>
        <br>
        <div class="flex justify-center space-x-4">
            <a href="/mall/orderhistory_page" class="flex-1">
                <div class="border-2 border-black p-4 text-center">
                    <div class="text-lg font-semibold">order</div>
                </div>
            </a>
            <a href="/mall/user_update" class="flex-1">
                <div class="border-2 border-black p-4 text-center">
                    <div class="text-lg font-semibold">profile</div>
                </div>
            </a>
            <a href="/mall/basket_page" class="flex-1">
                <div class="border-2 border-black p-4 text-center">
                    <div class="text-lg font-semibold">cart</div>
                </div>
            </a>
        </div>
    </div>
</body>
</html>
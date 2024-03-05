<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="text-2xl font-semibold">Silver</div>
            </div>
            <div class="flex-1 text-center">
                <div class="text-sm text-gray-500">적립금</div>
                <div class="text-2xl font-semibold">9000 point</div>
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
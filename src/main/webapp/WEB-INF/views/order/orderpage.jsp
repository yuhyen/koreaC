<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50 p-8">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-3xl font-semibold mb-6">Order</h1>
        <div class="bg-white shadow rounded-lg p-6 mb-6">
            <h2 class="text-xl font-semibold mb-4">배송지</h2>
            <div class="mb-4">
                <label for="recipient" class="block text-sm font-medium text-gray-700">받는사람</label>
                <input type="text" id="recipient" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" placeholder="Enter recipient's name">
            </div>
            <div class="mb-4">
                <label for="address" class="block text-sm font-medium text-gray-700">주소</label>
                <input type="text" id="address" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" placeholder="Enter address">
            </div>
            <div class="mb-4">
                <label for="phone" class="block text-sm font-medium text-gray-700">핸드폰 번호</label>
                <input type="tel" id="phone" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" placeholder="Enter phone number">
            </div>
            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="email" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm" placeholder="Enter email">
            </div>
            <div class="mb-4">
                <label for="message" class="block text-sm font-medium text-gray-700">Message</label>
                <select id="message" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                    <option>--메시지 선택 (선택사항)--</option>
                    <option>배송전에 미리 연락 부탁드립니다.</option>
                    <option>부재 시 경비실에 맡겨주세요.</option>
                    <option>부재 시 문 앞에 놓아주세요.</option>
                    <option>빠른 배송 부탁드립니다.</option>
                    <option>택배함에 보관해주세요.</option>
                </select>
            </div>
        </div>

        <div class="bg-white shadow rounded-lg p-6 mb-6">
            <h2 class="text-xl font-semibold mb-4">Order Details</h2>
            <div class="flex items-center mb-4">
                <img src="https://source.unsplash.com/random/100x100?product" alt="Product Image" class="w-24 h-24 object-cover rounded mr-4">
                <div>
                    <p class="font-semibold">Product Name</p>
                    <p>Product Option</p>
                    <p>Quantity: 1</p>
                    <p class="font-semibold">Price: 87,000₩</p>
                </div>
            </div>
        </div>

        <div class="bg-white shadow rounded-lg p-6 mb-6">
            <h2 class="text-xl font-semibold mb-4">Payment Information</h2>
            <div class="flex justify-between items-center mb-4">
                <p>Order Products</p>
                <p>87,000₩</p>
            </div>
            <div class="flex justify-between items-center mb-4">
                <p>Shipping Fee</p>
                <p>3,000₩</p>
            </div>
            <div class="flex justify-between items-center font-semibold mb-4">
                <p>Total Payment Amount</p>
                <p>90,000₩</p>
            </div>
            <div class="mb-4">
                <label for="payment-method" class="block text-sm font-medium text-gray-700">Payment Method</label>
                <select id="payment-method" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                    <option></option>
                    <option></option>
                    <option>Bank Transfer</option>
                    <option>PayPal</option>
                </select>
            </div>
            <button class="w-full bg-blue-600 text-white rounded-md py-3 font-semibold hover:bg-blue-700">Pay 90,000₩</button>
        </div>
    </div>
</body>
</html>
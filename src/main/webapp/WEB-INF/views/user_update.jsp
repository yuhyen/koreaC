<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile Edit</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="resources/js/HttpRequest.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Additional styles if needed */
    </style>
    <script type="text/javascript">
    function u_update(f){
    	let u_username = f.name.value.trim();
    	let u_pwd = f.pwd.value.trim();
    	let u_id = f.id.value.trim();
    	let u_ip = f.u_ip.value.trim() + f.u_ipExtraAddr.value.trim();
    	let u_email = f.email.value.trim();
    	let u_tel = f.p_num.value.trim();
    	let u_idx = f.idx.value.trim();
    	
    	
    	let pwdcheck = f.pwdcheck;
    	
    	if(u_pwd != pwdcheck.value){
    		alert("비밀번호 와 비밀번호 확인이 틀립니다.");
    		return;
    	}
    		let url= "user_db_update";
    		let param = "u_idx=" + u_idx + "&u_username=" + u_username + "&u_id=" + u_id + "&u_pwd=" + u_pwd + "&u_ip=" + u_ip + "&u_tel=" + u_tel + "&u_email=" + u_email;
    		
    		sendRequest(url, param, userUpdate, "POST");
    	}
    	function userUpdate(){
    		if(xhr.readyState == 4 && xhr.status == 200){
    			let data = xhr.responseText;
    			let json = (new Function('return' + data))();
    			
    			if(json[0].param == 'in'){
    				alert("수정 완료");
    				location.href = 'mypage';
    			}
    			if(json[0].param == 'notin'){
    				alert("수정 실패");
    			}
    		}
    	}
    	
    	function ipsearch(f){
    		
    		 new daum.Postcode({
    		        oncomplete: function(data) {
    		        	
    		        	console.log(data);
    		        	let u_ipNumber='';
    		        	let u_ipAddr='';
    		        	let u_ipExtraAddr='';
    		        	u_ipNumber = data.zonecode;
    		        	
    		        	if(data.userSelectedType === 'R'){
    		        		u_ipAddr = data.roadAddress;
    		        	}else{
    		        		u_ipAddr = data.jibunAddress;
    		        	}
    		        	
    		        	if(data.userSelectedType =='R'){
    		        		if(data.bname !== ''){
    		        			u_ipExtraAddr += data.bname;
    		        		}
    		        		if(data.buildingName !==''){
    		        			u_ipExtraAddr += (u_ipExtraAddr !== '' ?',' + data.buildingName : data.buildingName);	
    		        		}
    		        		u_ipAddr += (u_ipExtraAddr !=='' ?'(' + u_ipExtraAddr + ')' : '');	
    		        	}        	
    		   	
    		        	f.u_ip.value = '('+u_ipNumber+')' + u_ipAddr;
    		        	
    		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    		        }
    		    }).open();
    	}
    </script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-8">
        <div class="max-w-2xl mx-auto bg-white p-6 rounded-md shadow-md">
            <h1 class="text-xl font-semibold mb-6">회원정보수정</h1>
            <form>
                <div class="mb-4">
                <input type="hidden" name="idx" value="${dto.u_idx} ">
                    <label for="username" class="block text-sm font-medium text-gray-700">이름</label>
                    <input type="text" id="username" name="name" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" value="${dto.u_username }">
                </div>
                <div class="mb-4">
                    <label for="userid" class="block text-sm font-medium text-gray-700">아이디</label>
                    <input type="text" id="userid" name ="id" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" value="${dto.u_id }" readonly>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700">비밀번호</label>
                    <input type="password" id="password" name="pwd" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" placeholder="비밀번호 입력">
                </div>
                <div class="mb-4">
                    <label for="password-confirm" class="block text-sm font-medium text-gray-700">비밀번호확인</label>
                    <input type="password" id="password-confirm" name="pwdcheck" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" placeholder="비밀번호 확인 입력">
                </div>
                <div class="mb-4">
                    <label for="address" class="block text-sm font-medium text-gray-700">주소</label>
                    <input type="text" id="address" name="u_ip" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" value="${dto.u_ip }">
                    <button type="button" class="mt-2 text-indigo-600 hover:text-indigo-900 text-sm" onclick="ipsearch(this.form)">주소 찾기</button>
                </div>
                <div class="mb-4">
                    <label for="phone" class="block text-sm font-medium text-gray-700">상세주소</label>
                    <input type="text" name="u_ipExtraAddr" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" placeholder="상세주소">
                </div>
                <div class="mb-4">
                    <label for="phone" class="block text-sm font-medium text-gray-700">휴대폰번호</label>
                    <input type="tel" id="phone" name="p_num" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" value="${dto.u_tel }">
                </div>
                <div class="mb-6">
                    <label for="email" class="block text-sm font-medium text-gray-700">이메일</label>
                    <input type="email" name="email" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" value="${dto.u_email }">
                </div>
                <div class="flex justify-end space-x-4">
                	<input type="button" value="취소하기"  class="py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" onclick="location.href='mypage'">
                	<input type="button" value="수정하기"  class="py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" onclick="u_update(this.form)">
                	
                </div>
            </form>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
<script type="text/javascript">
	function send_check(){
		let f = document.f;
		let name = f.p_name.value;
		let id = f.p_id.value;
		let price = f.p_price.value;
		let explain = f.p_explain.value;
		let size = f.p_size.value;
		let pabric = f.p_pabric.value;
		let stock = f.p_stock.value;
		let picture = f.picture.files.length;
		
		f.submit();
	}
</script>
</head>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<body class="bg-gray-50">
<div class="container mx-auto p-6">
        <h1 class="text-2xl font-semibold text-gray-800 mb-6">상품 등록</h1>
        <form action="p_add" name="f" method="post" enctype="multipart/form-data">
        <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <table class="table-auto w-4/5 mb-4">
                <tbody>
                    <tr class="mb-4">
                        <td class="pb-4">
                            상품명 : 
                            <input class="shadow appearance-none border rounded w-2/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="p_name" type="text" placeholder="Enter text">
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            상품 유형 : 
                            <select id="select_p_id" name="p_id" onchange="change_p_id()">
							     <option value="1">Outer</option>
							     <option value="2">Top</option>
							     <option value="3">Bottom</option>
							     <option value="4">Suit</option>
						   	</select>
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            가격 : 
                            <input class="shadow appearance-none border rounded w-1/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="p_price" type="text" placeholder="Enter text">
                            원
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            <label class="block text-gray-700 text-sm mb-2">
                                설명
                            </label>
                            <textarea class="shadow appearance-none border rounded w-3/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="p_explain" placeholder="Enter more text"></textarea>
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                          	사이즈 : 
                            <select name="p_size">
								<option value="M">M</option>
								<option value="L">L</option>
								<option value="XL">XL</option>
							</select>
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                           	색상 : 
                            <select name="p_color">
								<option value="black">black</option>
								<option value="black">white</option>
								<option value="black">red</option>
								<option value="black">green</option>
							</select>
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            원단 : 
                            <input class="shadow appearance-none border rounded w-2/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="p_pabric" type="text" placeholder="Enter text">
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            재고 : 
                            <input class="shadow appearance-none border rounded w-1/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="p_stock" type="text" placeholder="Enter text">
                        </td>
                    </tr>
                    <tr class="mb-4">
                        <td class="pb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="field3">
                                이미지
                            </label>
                            <input class="shadow appearance-none border rounded w-2/5 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" name="picture" type="file" multiple="multiple">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div align="center">
            <button class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button" onclick="send_check()">
               	등록
            </button>
            <button class="bg-white-500 hover:bg-white-700 text-black font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="button" onclick="location.href='pList_form'">
               	취소
            </button>
            </div>
        </div>
        </form>
    </div>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
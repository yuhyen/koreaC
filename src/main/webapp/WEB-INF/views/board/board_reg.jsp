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
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="resources/js/HttpRequest.js"></script>
<body>
<div id="app" class="container mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
	  <div class="flex justify-between items-center mb-6">
            <div class="space-x-4">
                <a href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800">게시판종류</a>
            </div>
<!--             <button class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded">신규등록</button> -->
        </div>
  	<div id=regGrp>
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <div id="content">
	    
	    </div>
	    
	    <div id="fileupload">
<!-- 	    <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="file_input">Upload file</label> -->
		<input class="px-4 py-2 text-black rounded" id="file_input" type="file" multiple="multiple" @change="fileListChange">
		<input class="px-4 py-2 text-black rounded" id="chk" type="checkbox">
	    </div>
  	</div>
    
    <div id="viewer">
    
    </div>
    <div id="fileGrp" class="flex justify-end mt-4 space-x-2">
    	
    </div>
    <div id="regBtnGrp" class="flex justify-end mt-4 space-x-2">
    	<button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="registBoard">등록</button>
    	<button class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="cancel">취소</button>
    </div>
</div>
    <!-- TUI 에디터 JS CDN -->
    <script>
    
    //파일업로드기능
    let fileUpload = () =>{
    	let url = "board_fileUpload.ajax"
        const formData = new FormData();
    	const files = document.getElementById("file_input").files;
    	let fileList = Array.from(files);
    	console.log(fileList);
    	fileList.forEach( (obj) =>{
    		formData.append('files', obj);
    	});
// 		formData.append('files' , fileList);
    	
        
        console.log(formData);
        console.dir(formData);
        console.log(formData.values());
    	sendRequest(url, formData, fileUploadAfter,"POST" , true);
    };
    
    let fileUploadAfter = () =>{
    	console.log("완료");
    }

    new Vue({
        el: '#app',
        methods: {
              registBoard:function(){
              	alert("글쓰기 클릭");
              },
              cancel:function(){
            	alert("취소 클릭")  
              },
              fileListChange:function(obj){
            	  
            	alert("파일변경");  
	            const dataTransfer = new DataTransfer(); //TODO:이걸로 표시할지 결정해야함.
//             	let files = document.getElementById("file_input");
            	fileUpload();
	            
	            
              }
        }
      });
    
        const editor = new toastui.Editor({
            el: document.querySelector('#content'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'wysiwyg',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
        });
        
//         const viewer = toastui.Editor.factory({
//             el : document.querySelector("#viewer"),
//             viewer : true,
//             initialValue : "Hello toast ui viewer~!"
//         }); 
        
        
         
    </script>
</body>
</html>
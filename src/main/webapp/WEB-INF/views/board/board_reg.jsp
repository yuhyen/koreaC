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
                <a id="boardName" href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800">게시판종류</a>
            </div>
            <input class="w-9/12 px-4 py-2 text-black rounded" id="title" type="text" placeholder="제목을 입력하세요" />
			<label class="text-sm font-semibold text-blue-600"> 공지 </label><input class="w-1/12 px-1 py-1 text-black rounded" id="noticeYn" type="checkBox"/>
        </div>

  	<div id=regGrp>
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <div id="content">
	    
	    </div>
	    
	    <div id="fileupload">
			<input class="px-4 py-2 text-black rounded" id="file_input" type="file" multiple="multiple" @change="fileListChange">
	    </div>
  	</div>
    
    <div id="viewer">
    
    </div>
    <div id="fileGrp" class="flex justify-end mt-4 space-x-2">
    	
    </div>
    <div id="regBtnGrp" class="flex justify-end mt-4 space-x-2">
    	<button id="btnReg" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="registBoard">등록</button>
    	<button id="btnUpd" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="updateBoard">수정</button>
    	<button id="btnCel" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="cancel">취소</button>
    </div>
</div>
    <!-- TUI 에디터 JS CDN -->
    <script>
    
    let typeCategory = "";
    
    window.onload = () => { 
    	const qa =  location.search
    	const urlParam = new URLSearchParams(qa);
    	typeCategory = urlParam.get("type") 
    	console.log(typeCategory);
    	getBoardName(urlParam.get("type"))
    }
    
    let sendObj = {
    		
            seq : ""
    	 ,  category : ""
    	 ,	noticeYn : "N"
		 ,  files : "files"
		 ,  title : "title"
		 ,  contents : "content"
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
		nameEl.href = "http://naver.com"
		
		return name;
    } 
    
    let setSendObj = (seq , category , noticeYn , files , title , contents) =>{
    	sendObj = {
    	            seq : seq
    	    	 ,  category : category
    	    	 ,	noticeYn : noticeYn
    			 ,  files : files
    			 ,  title : title
    			 ,  contents : contents
    		}
    	
    	return sendObj;
    }
    
    
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
    	sendRequestFile(url, formData, fileUploadCallback,"POST" , true);
    };
    
    let fileUploadCallback = (e) =>{
    	console.log(e)
    	console.log(xhr.responseText)
//     	if(xhr.readyState == 4 && xhr.status == 200){
// 		var data= xhr.responseText;
    }
    	
    	
    let sendDate = (dvCd) =>{
    	sendRequestContent("board_"+dvCd , JSON.stringify(sendObj) , "" ,"POST" , true , "application/json");	
    }

    new Vue({
        el: '#app',
        methods: {
              registBoard:function(){
              	alert("글쓰기 클릭");
              	//공지사항여부 체크?
                let noticeYn = document.getElementById("noticeYn").checked ? "Y" : "N"; 
				//글제목 관련
				let title = document.getElementById("title").value;
				let contents = editor.getHTML();
              	setSendObj("" , typeCategory , noticeYn , "" , title , contents);
              	sendDate("insert");
              	console.log(xhr);
              	if(xhr.status == "200"){
              		let returnObj = JSON.parse(xhr.response);
              		console.log(returnObj.boardDTO)
					alert("insert end")
              	}else{
              		console.log("오류처리")
              		alert("insert 실패")
              	}
              },
              updateBoard:function(){
              	alert("수정 클릭");
              	sendDate("update");
				console.log("update end")
				
              },
              cancel:function(){
            	alert("취소 클릭")  
            	history.back()
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
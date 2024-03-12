<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardView</title>
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
                <a id="boardName" href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800"></a>
            </div>
            <input class="w-9/12 px-4 py-2 text-black rounded" id="title" type="text"/>
			<label class="text-sm font-semibold text-blue-600"> 공지 </label><input class="w-1/12 px-1 py-1 text-black rounded" id="noticeYn" type="checkBox"/>
        </div>
    
    <div id="viewer">
    
    </div>
    <div id="regBtnGrp" class="flex justify-end mt-4 space-x-2">
    	<button id="btnUpd" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="updateBoard">수정</button>
    	<button id="btnCel" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="cancel">뒤로가기</button>
    </div>
</div>
    <!-- TUI 에디터 JS CDN -->
    <script>
    
    let seq = "";
    
    window.onload = () => { 
    	const qa =  location.search
    	const urlParam = new URLSearchParams(qa);
    	seq = urlParam.get("seq") 
    	console.log(seq);
    	setSendObj(seq);
    	sendDate("detail");
    	console.log(xhr);
      	if(xhr.status == "200"){
      		let returnObj = JSON.parse(xhr.response);
      		console.log(returnObj.data);
      		let list = returnObj.data;
      		
      		list.forEach( (obj , idx)=>{
      			console.log(obj , idx);
      			let input = {
      					elName : "detail"+idx
      				 , content : obj.B_CONTENTS
      				 , index : idx
      					
      			}
      			if(document.getElementById("boardName").text == '' || document.getElementById("boardName").text === ''){
      				getBoardName(obj.B_CATEGORY);
      			}
      			
      			if(document.getElementById("title").value == '' || document.getElementById("title").text === ''){
      				document.getElementById("title").value = obj.B_TITLE;
      			}
      			createView(input);
      			
      		});
//       		
      		
      		
      		
			alert("detail end")
      	}else{
      		console.log("오류처리")
      		alert("detail 실패")
      	}

    	
    }
    
    let makeViewElement = (input) =>{
    	let viewDiv = document.getElementById("viewer");
    	let newSpan = document.createElement("span");
    	let outerDiv = document.createElement("div");
    	let newDiv = document.createElement("div");
    	let px = input.index * 4;
    	outerDiv.classList.add("px-"+px , "py-2");
    	
    	newSpan.textContent = "아이디자리";
    	
    	newDiv.id = input.elName
    	newDiv.classList.add("mx-auto", "mt-10" ,"p-6" ,"bg-white" ,"shadow-lg" ,"rounded-lg");
    	
    	outerDiv.appendChild(newSpan);
    	outerDiv.appendChild(newDiv);
    	viewDiv.appendChild(outerDiv);
    }
    
    let createView = (input) => {
   	 
   		let elName = input.elName;
   		let content = input.content;
   		
   		makeViewElement(input);
   	 
   	 	toastui.Editor.factory({
   	      el : document.querySelector("#"+elName),
   	      viewer : true,
   	      initialValue : content
   	   	});     
     }  
    
	let sendObj = {
    		
            seq : ""
	}
    
    let setSendObj = (seq) =>{
    	sendObj = {
    	            seq : seq
    		}
    	
    	return sendObj;
    }
    
    	
    let sendDate = (dvCd) =>{
    	output = sendRequestContent("board_"+dvCd , JSON.stringify(sendObj) , "" ,"POST" , true , "application/json");
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
		nameEl.href = "mall/board_list?type="+type;
		
		return name;
    } 

    new Vue({
        el: '#app',
        methods: {
              updateBoard:function(){
              	alert("수정 클릭");
              	
              	sendDate("update");
				console.log("update end")
				
              },
              cancel:function(){
            	alert("취소 클릭")  
            	history.back()
              },

    }
   });
   
    

    
      
//    const viewer = toastui.Editor.factory({
//       el : document.querySelector("#viewer"),
//       viewer : true,
//       initialValue : "view Test"
//    }); 
        
        
        
         
    </script>
</body>
</html>
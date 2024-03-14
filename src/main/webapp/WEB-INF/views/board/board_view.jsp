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

<div id="app" class="container mx-auto mt-10 p-6 bg-white rounded-lg">
	  <div class="flex justify-between items-center mb-6">
            <div class="space-x-4">
                <a id="boardName" href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800"></a>
            </div>
            <input class="w-9/12 px-4 py-2 text-black rounded" id="title" type="text" readOnly />
			<label class="text-sm font-semibold text-blue-600"> 공지 </label><input class="w-1/12 px-1 py-1 text-black rounded" id="noticeYn" type="checkBox" disabled/>
        </div>
    
    <div id="viewer" class="bg-gray-200 rounded-lg">
    
    </div>
    <div id="regBtnGrp" class="flex justify-end mt-4 space-x-2">
    	<button id="btnrel" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="reply">답글</button>
    	<button id="btnUpd" style="display:none;" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="update">수정</button>
    	<button id="btnCel" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="cancel">뒤로가기</button>
    </div>
</div>

    <!-- TUI 에디터 JS CDN -->
    <script>
    
    let seq = "";
    let chatIcon = document.getElementById("chatIcon");
    let list;
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
      		list = returnObj.data;
      		
      		list.forEach( (obj , idx)=>{
      			console.log(obj , idx);
      			let input = {
      					elName : "detail"+idx
      				 , content : obj.B_CONTENTS
      				 , index : idx
      				 , updateYn : returnObj.update
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
    let btnController = (input) =>{
    	
    	let index = input.index;
    	let updateYn = input.updateYn;
    	
    	//update가 Y일때만
    	if(updateYn == "Y"){
    		//수정버튼 활성화
    		document.getElementById("btnUpd").style.display = "";
    		
	    	//index가 0번이면 제목 , 공지여부 수정 가능 리드온니 변경
// 	    	if(input.index == 0){
	    		
// 	    		document.getElementById("title").readOnly = false;
// 	    		document.getElementById("noticeYn").disabled = false;
// 	    	}
    	}
    	
    	
    }
    
    
    let makeViewElement = (input) =>{
    	let viewDiv = document.getElementById("viewer");
    	let newSpan = document.createElement("span");
    	let outerDiv = document.createElement("div");
    	let newDiv = document.createElement("div");
    	let reDiv = document.createElement("div");
    	let px = 2+(input.index * 8);
    	
    	outerDiv.classList.add("pl-"+px , "py-2" , "pr-2");
	    	
    	reDiv.textContent = "↪";
    	
    	
      	newSpan.textContent = "아이디자리 ";
    	newDiv.id = input.elName
    	newDiv.classList.add("mx-auto", "mt-10" ,"p-6" ,"bg-white" ,"shadow-lg" ,"rounded-lg");
    	
    	if(input.index != 0 || input.index != "0") {
    		newSpan.textContent = "↪" + "아이디자리";
    	}
    	
    	outerDiv.appendChild(newSpan);
    	outerDiv.appendChild(newDiv);
    	viewDiv.appendChild(outerDiv);
    }
    
    let createView = (input) => {
   	 
   		let elName = input.elName;
   		let content = input.content;
   		
   		makeViewElement(input);
   		btnController(input);
   	 
   	 	toastui.Editor.factory({
   	      el : document.querySelector("#"+elName),
   	      viewer : true,
   	      initialValue : content
   	   	});     
     }  
    
	let sendObj = {
    		
            seq : ""
            
	}
    
    let setSendObj = (seq , reply) =>{
    	sendObj = {
    	            seq : seq
    	           ,reply : reply
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
    		  name = ""
    	}
    	
		nameEl.text = name;
		nameEl.href = "/mall/board_list?type="+type;
		
		return name;
    } 

    new Vue({
        el: '#app',
        methods: {
              update:function(){
              	alert("수정 클릭");
              	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
              	let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
              	let path = contextPath+"/board_reg?seq="+seq+"&reply="+list.length;
              	location.href = path;
              	
              },
              reply:function(){
               	alert("답글 클릭");
               	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
              	let contextPath = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
              	let path = contextPath+"/board_reg?seq="+seq;
              	location.href = path;
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
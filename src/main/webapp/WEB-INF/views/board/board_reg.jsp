<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/common.jsp"></jsp:include>
<style type="text/css">
	h2{
	    text-align: center;
	}
	.modal_btn {
	    display: block;
	    margin: 40px auto;
	    padding: 10px 20px;
	    background-color: royalblue;
	    border: none;
	    border-radius: 5px;
	    color: #fff;
	    cursor: pointer;
	    transition: box-shadow 0.2s;
	}
	.modal_btn:hover {
	    box-shadow: 3px 4px 11px 0px #00000040;
	}
	
	/*모달 팝업 영역 스타일링*/
	.modal {
	/*팝업 배경*/
		display: none; /*평소에는 보이지 않도록*/
	    position: absolute;
	    top:0;
	    left: 0;
	    width: 100%;
	    height: 100vh;
	    overflow: hidden;
	    background: rgba(0,0,0,0.5);
	    z-index: 1500;
	}
	.modal_popup {
		width: 100rem;
	    height: 50rem;
	}
	.modal .modal_popup {
	/*팝업*/
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    padding: 20px;
	    background: #ffffff;
	    border-radius: 20px;
	}
	.modal .modal_popup .close_btn {
	    display: block;
	    padding: 10px 20px;
	    background-color: rgb(116, 0, 0);
	    border: none;
	    border-radius: 5px;
	    color: #fff;
	    cursor: pointer;
	    transition: box-shadow 0.2s;
	}
</style>
<body>
	
    <div class="modal">
    <div class="modal_popup">
        <h3>모달 팝업</h3>
         <iframe id="innerFrame" src="" width="100%" height="100%"></iframe>
        <button id="BtnModalClose" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right">닫기</button>
    </div>
</div>


<div id="app" class="container mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
	  <div class="flex justify-between items-center mb-6">
            <div class="space-x-4">
                <a id="boardName" href="#" class="text-lg font-semibold text-blue-600 hover:text-blue-800"></a>
            </div>
            <input class="w-9/12 px-4 py-2 text-black rounded" id="title" type="text" placeholder="제목을 입력하세요" />
			<label class="text-sm font-semibold text-blue-600"> 공지 </label><input class="w-1/12 px-1 py-1 text-black rounded" id="noticeYn" type="checkBox"/>
        </div>

  	<div id=regGrp>
  	   <div id="pGrp" style="display:none;">
  	   			<input type="hidden" id="pNum" value="">
	 			<img id="pImg" src="https://source.unsplash.com/random/100x100?product" alt="Product Image" class="w-24 h-24 object-cover rounded mr-4">
<%-- 			                <img src="resources/product_img/${dto.p_picture}"> --%>
                <span id="pName" class="text-sm mt-2" align="left"></span>
		</div>
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <div id="content">
	    
	    </div>
	    
	    <div id="fileupload">
<!-- 			<input class="px-4 py-2 text-black rounded" id="file_input" type="file" multiple="multiple" @change="fileListChange"> -->
	    </div>
  	</div>
    
    <div id="viewer">
    
    </div>
    <div id="fileGrp" class="flex justify-end mt-4 space-x-2">
    	
    </div>
    <div id="regBtnGrp" class="flex justify-end mt-4 space-x-2">
       	<button id="btnModal" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right">상품선택</button>
    	<button id="btnReg" style="display:none;" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="registBoard">등록</button>
    	<button id="btnUpd" style="display:none;" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="updateBoard">수정</button>
    	<button id="btnCel" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-700 right" @click="cancel">취소</button>
    </div>
</div>
    <!-- TUI 에디터 JS CDN -->
    <script>
    
    //모달창은 vue로 구현하지않는다-> 외부에서 사용될수을듯.
    const modal = document.querySelector('.modal');
    
    let typeCategory = "";
    let seq ="";
    let reply ="";
    let noticeYn = "";
    let title = "";
    let contents = "";
    let product = ""; 
    
    window.onload = () => { 
	   	 document.getElementById("btnModal").addEventListener('click', function(){
   	        modal.style.display = 'block';
   	        document.body.style.overflowY = "hidden";
   	     	document.getElementById("innerFrame").src = "searchPopup" 
   	    });
	   	    
   	    document.getElementById("BtnModalClose").addEventListener('click',function(){
   	        modal.style.display = 'none';
   	        document.body.style.overflowY = "auto";
   	        if(document.getElementById("pNum").value != ""){
	   	     	document.getElementById("pGrp").style.display = "";
   	        }
	   	});
    	    
    	const qa =  location.search
    	const urlParam = new URLSearchParams(qa);
    	typeCategory =  urlParam.get("type");
    	product = urlParam.get("type"); 
    	seq = urlParam.get("seq")
    	reply = urlParam.get("reply")
    	if(typeCategory != undefined || typeCategory != "" || typeCategory != null){
	    	getBoardName(urlParam.get("type"))
    	}
    
    	if(product != null){
    		console.log("상품조회");
    		sendRequestContent("detail.json" , JSON.stringify({p_num : 123}) , "" ,"POST" , true , "application/json");
    	    console.log(xhr.response);
    	    product = JSON.parse(xhr.response).dto
    	    document.getElementById("pNum").value = product.p_num;
    	    document.getElementById("pName").textContent = product.p_name;
    	    if(document.getElementById("pNum").value != ""){
    		     	document.getElementById("pGrp").style.display = "";
    	    }
    	}
    	
    	if(seq != null){
	    	alert(seq);
	    	setSendObj(seq , reply , "" , "" , "" , "" , "");
	    	sendDate("detailOne");
	    	if(xhr.status == "200"){
	    		let returnObj = JSON.parse(xhr.response);
	    		let data = returnObj.data;
	    		typeCategory = data.B_CATEGORY;
// 	    		seq =data.B_SEQ;
// 	    		reply =data.B_REPLY;
	    		noticeYn =data.B_NOTICE_YN;
	    		title = data.B_TITLE;
	    		contents = data.B_CONTENTS;
	    		getBoardName(typeCategory);
	    		
	    		document.getElementById("title").value = data.B_TITLE;
	    		
	    		if(noticeYn == "Y"){
	    			document.getElementById("noticeYn").checked = true;
	    		} else if(noticeYn == "N"){
	    			document.getElementById("noticeYn").checked = false;
	    		}
		    		
	    		if(reply != null){
		    		editor.setHTML(contents);
	    		}
	    		if(reply != "1"){
	    		
	    			document.getElementById("title").readOnly = true;
	    			document.getElementById("noticeYn").disabled = true;
	    		}
	    	}
    	}
//     	seq가 있고 reply가 없으면 seq reply가 둘다 없을때 등록버튼 활성화
// 	   	btnReg
		if(seq !=null  && reply == null){
			document.getElementById("btnReg").style.display = ""; 
		}
	   	
// 	   	seq가 있고 reply있으면 수정 활성화
//     	btnUpd
	   	if(seq != null && reply != null){
			document.getElementById("btnUpd").style.display = "";
	   	}
	   	
	   	//또는 아무것도없을때도 등록버튼을 활성화
	   	if(seq ==null  && reply == null){
			document.getElementById("btnReg").style.display = ""; 
		}
    }
    
    let sendObj = {
    		
            seq : ""
         ,  reply : ""
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
    		  name = ""
    	}
    	
		nameEl.text = name;
		nameEl.href = "mall/board_list?type="+type;
		
		return name;
    } 
    
    let setSendObj = (seq , reply , category , noticeYn , files , title , contents , product) =>{
    	sendObj = {
    	            seq : seq
    	         ,  reply : reply
    	    	 ,  category : category
    	    	 ,	noticeYn : noticeYn
    			 ,  files : files
    			 ,  title : title
    			 ,  contents : contents
    			 ,  product : product
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
              	alert("insert reply");
              	//공지사항여부 체크?
                noticeYn = document.getElementById("noticeYn").checked ? "Y" : "N"; 
				//글제목 관련
				title = document.getElementById("title").value;
				contents = editor.getHTML();
              	setSendObj(seq , "" , typeCategory , noticeYn , "" , title , contents);
				
              	if(seq == null || seq == "" ){
	              	sendDate("insert");
              	}else if(seq != null || seq != "" ){
              		sendDate("reply");
              	}
              	
              	console.log(xhr);
              	if(xhr.status == "200"){
              		let returnObj = JSON.parse(xhr.response);
              		console.log(returnObj.boardDTO)
					alert("insert reply end")
					history.back()
              	}else{
              		console.log("오류처리")
              		alert("insert reply 실패")
              	}
              },
              updateBoard:function(){
              	alert("수정 클릭");
              	
                noticeYn = document.getElementById("noticeYn").checked ? "Y" : "N"; 
				title = document.getElementById("title").value;
				contents = editor.getHTML(); 
              		
              	setSendObj(seq , reply , typeCategory , noticeYn , "" , title , contents);
              	sendDate("update");
			 	if(xhr.status == "200"){
              		let returnObj = JSON.parse(xhr.response);
              		console.log(returnObj.boardDTO)
              		//성공시 페이지 이동
              		history.back()
              	}else{
              		alert("실패")
              	}
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
            placeholder: '내용을 입력하세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
        });
        
//         const viewer = toastui.Editor.factory({
//             el : document.querySelector("#viewer"),
//             viewer : true,
//             initialValue : "Hello toast ui viewer~!"
//         }); 
        
        
         
    </script>
</body>
<jsp:include page="/WEB-INF/views/main/footer.jsp"></jsp:include>
</html>
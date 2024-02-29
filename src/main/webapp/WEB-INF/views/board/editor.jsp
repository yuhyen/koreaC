<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<body>
<div id="app" class="container mx-auto mt-10 p-6 bg-white shadow-lg rounded-lg">
	<div id="content">
    </div>
</div>
    <!-- TUI 에디터 JS CDN -->
<script>
    
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
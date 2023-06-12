<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    
    <script>
    window.onload = init;
    
    function init(){
    	console.log('init');
    	document.getElementById("btnTest").addEventListener('click', makeRequest);
    };
    
    function makeRequest() {
		console.log("btn click!!");
		var httpRequest;
		httpRequest = new XMLHttpRequest();
		
		if(!httpRequest) {
			alert('XMLHttpRequest 생성 오류!!');
			return false;
		}
		
		httpRequest.onreadystatechange = function(){
			console.log('httpRequest.status', httpRequest.status);
			
			// 서버의 응답에 따른 로직을 여기에 작성합니다.
			if (httpRequest.status === 200) {
				console.log('이상 없음');
			} else if (httpRequest.status === 403) {
				console.log('권한 오류');
				location.href="http://localhost:8080/login?redirect_uri=http://localhost:8080/success";
			} else {
				console.log('기타 오류');
				// 요구를 처리하는 과정에서 문제가 발생되었음
				// 예를 들어 응답 상태 코드는 404 (Not Found) 이거나
				// 혹은 500 (Internal Server Error) 이 될 수 있음
			}
		};
		
		httpRequest.open('GET', 'http://localhost:8081/test', true);
		httpRequest.send();
	}
    </script>
    
</head>
<body>
    <h1>Home</h1>
    <button id="btnTest">Test</button>
</body>
</html>

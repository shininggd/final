<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://rtcmulticonnection.herokuapp.com/dist/RTCMultiConnection.min.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com/socket.io/socket.io.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js" ></script>
<style type="text/css">
	.mainGround{
		width: 1200px;
		height: 1300px;
		background-color: gray;
	}
	video{
		width: 400px;
		height: 300px;
		background-color: red;
		border-radius: 15px;
	}
</style>
</head>
<body>
<div class="mainGround">
	<h1>온라인 강의 페이지</h1>
	<h2>${room_id}</h2>


	<hr>

	<div id="local-videos-container">

	</div>

	<hr>
	<div id="remote-videos-container">

	</div>
	
	<div id="chat-container">
	<!-- 채팅 텍스트 입력 -->
	<input type="text" id="input-text-chat" placeholder="Enter Text Chat">
	
	<!-- 파일공유 -->
	<button id="share-file" >Share File</button>
             
    <!-- 채팅 입력시 출력창 -->         
    <div class="chat-output">
    
    </div>   
                
    <!-- 파일 업로드시 출력창 -->
    <div id="file-container">
    
    </div>
                
   <form action="" id="https_frm" method="post">
   		<input type="hidden" value="${room_id}" name="room_id">
   		<input type="hidden" value="${category}" name="category">
   </form>
    
</div>
</div>
<script type="text/javascript">

	if (document.location.protocol == 'http:') {
    var https = document.location.href.replace('http:', 'https:');

    $("#https_frm").prop("action", https);
    $("#https_frm").submit();
	}
	var connection = new RTCMultiConnection();
	// or a free signaling server
	connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
	
	connection.session = (
		audio = true,
		video = true
	);
	
	connection.sdpConstraints.mandatory = (
			OfferToReceiveAudio = true,
			OfferToReceiveVideo = true
	);
	
	/* var localVideosContainer = document.getElementById("local-videos-container");
	var remoteVideosContainer = document.getElementById("remote-videos-container");
		
	connection.onstream = function(event) {
		document.body.appendChild(event.mediaElement);
		
		var video = event.mediaElement;
		
		if(event.type =='local'){
			localVideosContainer.appendChild(video);
		}
		if(event.type =='remote'){
			remoteVideosContainer.appendChild(video);
		}
		
		}; */
		
		connection.onstream = function(event) {
			var video = event.mediaElement;
			
			if(event.type === 'local') {
				$("#videos_container").append(video);
			}
			if(event.type === 'remote') {
				$("#remote_videos_container").append(video);
			}
			
		};
		
		var roomid = '${room_id}';
		alert(roomid);
		connection.checkPresence(roomid, function(isRoomExist, roomid) {
		    if (isRoomExist == true) {
		        connection.join(roomid);
		    } else {
		        connection.open(roomid);
		    }
		});
	
	

</script>
</body>
</html>
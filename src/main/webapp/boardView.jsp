<%@page import="com.smhrd.model.Reply"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReplyDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Board"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
	background-image: url('./img/bg.jpg');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
}

.panel {
	margin: auto;
	width: 80%;
	margin-top: 80px;
}

.writeBtn {
	display: flex;
	justify-content: flex-end;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = new BoardDAO();
	Board board = dao.selectOneBoard(num);
	System.out.print(board.getNum());
	Member vo = (Member)session.getAttribute("loginVO");
	
	ReplyDAO rdao = new ReplyDAO();
	List<Reply> list = rdao.selectAllReply(num);
	System.out.print(list.size());
	%>
	<div class="panel panel-default">
		<div class="panel-heading">태빈쓰 :(</div>
		<div class="panel-body">
			<div class="container" style="margin: 0px; width: 100%">
				<ul class="list-group">
					<li class="list-group-item"><%=board.getName()%> / <%=board.getWriter()%> / <%=board.getUploadday()%></li>
					<li class="list-group-item"><img
						src="./img/<%=board.getFilename() %>"></li>
					<li class="list-group-item"><%=board.getContent()%></li>
					<li class="list-group-item"><div id="map" style="width:100%;height:350px;"></div></li>
				</ul>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3" onclick="addReply()">작성</button></li>
				</ul>
				<ul class="list-group list-group-flush" id="reply">
				<% for(Reply r:list){ %>
					<li class="list-group-item"><span>작성자 : <%=r.getWriter() %><br>내용 : <%= r.getContent() %></span></li>
				<%} %>
				</ul>
			</div>

		</div>
	</div>
	<!-- html 문서 내에 javascript 작성하는 영역 -->
	<script>
		function addReply() {
			//innerHTML, innerText => 태그사이 글씨/ 태그(html) 추가, 가져오기
			//html()	text() => jquery로 값 가져오기
			//html('가나다') text('가나다') => jquery값 설정
			// value => form 태그에 작성된 글씨 추가, 가지고오기
			//val() => jquery로 값가지고오기
			//val('가나다') => jquery로 값 설정
			
			// $(jquery 사용)
			// textarea에 작성된 텍스트 가지고오기
			// $(선택자)
			let ta = $('textarea').val();
 			
 			//비동기통신 (ajax)
 			$.ajax({
 				// 요청 경로
 				url : 'ReplyCon',
 				// 요청 데이터(사용자가 입력한 댓글)
 				data : {'num':<%= board.getNum() %>, 'reply':ta},
 				// 요청 방식(get/post)
 				type : 'post',
 				// 요청-응답 성공
 				success : function (data) {
 					// success 댓글출력 / fail 아무것도 출력안함
 					// 사용자가 작성한 댓글을 하단에 출력
 					if(data == 'success'){
 						let replyUL = $('#reply');
 						replyUL.prepend('<li class="list-group-item"><span>'+ta+'/<%=vo.getId()%></span></li>');
 						$('textarea').val('')
 					}
				},
				error : function () {
					alert('통신실패!')
				}
 			})
		}
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=161a875bc95e50d377a435859306775e&libraries=services"></script>
	<script>
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 키워드로 장소를 검색합니다
	ps.keywordSearch('<%= board.getAddress() %>', placesSearchCB); 
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'mouseover', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;"><img width="200px" height="200px" src="./img/<%=board.getFilename()%>"></div>');
	        infowindow.open(map, marker);
	    });
	    
	    kakao.maps.event.addListener(marker, 'mouseout', function(){
	    	infowindow.close();
	    });
	}
</script>
</body>
</html>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 80vh;
}

.panel {
	margin: auto;
	width: 80%;
	margin-top: 80px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">태빈쓰 :(</div>
		<%
		Member loginVO = (Member) session.getAttribute("loginVO");
		%>
		<div class="panel-body">
			<div>
				<%
				if (loginVO == null) {
				%>
				<form class="form-inline" action="LoginCon" method="post">
					<div class="form-group">
						<label for="id">Id:</label> <input type="text"
							class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pwd">Password:</label> <input type="password"
							class="form-control" id="pwd" name="pw">
					</div>
					<button type="submit" class="btn btn-default">로그인</button>
				</form>
				<%
				} else {
				//DB에 저장된 게시물 정보 가지고오기 
				BoardDAO dao = new BoardDAO();
				List<Board> list = dao.selectAllBoard();
				System.out.print(list.size());
				%>

				<div class="writeBtn">
					<button type="button" class="btn btn-primary"
						onclick="location.href='boardWrite.jsp'">글작성</button>
				</div>
				<div class="container" style="margin: 0px; width: 100%">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글 제목</th>
								<th>작성자</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><a href="boardView.jsp?num=<%=list.get(i).getNum()%>"><%=list.get(i).getName()%></a></td>
								<td><%=list.get(i).getWriter()%></td>
								<td><%=list.get(i).getUploadday()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

</body>
</html>
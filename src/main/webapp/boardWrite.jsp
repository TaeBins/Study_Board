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
	<div class="panel panel-default">
		<div class="panel-heading">태빈쓰 :(</div>
		<div class="panel-body">

			<form class="form-horizontal" action="BoardWriteCon"
				enctype="multipart/form-data" method= "post" accept-charset="UTF-8">
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">게시물 제목:</label>
					<div class="col-sm-10">
						<input type="text" name="name" class="form-control" id="title"
							placeholder="Enter title">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="img">이미지 첨부:</label>
					<div class="col-sm-10">
						<input type="file" name="filename" class="form-control" id="img">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="addr">주소 : </label>
					<div class="col-sm-10">
						<input type="text" name="address" class="form-control" id="addr">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cont">내용 : </label>
					<div class="col-sm-10">
						<input type="text" name="content" class="form-control" id="cont">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
			</form>

		</div>
	</div>

</body>
</html>
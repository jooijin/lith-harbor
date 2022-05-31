<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
<link href="../resources/css/board/writeform.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="board.js"></script>
</head>
<body>
<!-- 로그인 세션 확인 -->
<%
	if (session.getAttribute("id") == null) {
%>
<script>
	alert("로그인 후 이용해주세요.");
	location.href = "../signIn.jsp";
</script>
<%
	}
%>
<input type="button" value="Sign Out" id="sign_out">
<div class="wrapper">
	<div class="header">
		<span>Lith Harbor</span>
	</div>
	<form action="write.jsp" method="post" id="writeform">
		<div class="titleWrap">
			<div>제목</div>
			<div><input type="text" name="title" id="title"></div>
		</div>
		<div class="contentWrap">
			<div><textarea rows="5" cols="30" name="content" id="content"></textarea></div>
		</div>
		<div class="buttonGroup">
			<div id="btn_write">등록</div>
			<div id="backtolist">취소</div>
		</div>
	</form>
	<div class="footer">Copyright © 2022 Ijin Joo</div>
</div>

<script>
	$('#sign_out').on('click', function(){
		location.href = "../signOut.jsp";
	});
	
	$('#backtolist').on('click', function(){
		location.href = "list.jsp?num=1&pg=1";
	});
</script>
</body>
</html>
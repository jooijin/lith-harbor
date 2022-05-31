<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int pg = 1; int num = 1; //인기글에서 넘어오는 경우 그냥 첫페이지로 가게
	String strPg = request.getParameter("pg"); // read.jsp?num=304&pg=1
	if(!strPg.equals(""))
		pg = Integer.parseInt(strPg);
	String strNum = request.getParameter("num"); // read.jsp?num=2
	if(!strNum.equals(""))
		num = Integer.parseInt(strNum); // "2" ==> 2
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>
<link href="../resources/css/board/deleteform.css" rel="stylesheet" type="text/css">
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
	<c:set var="num" value="<%=num%>" />
	<c:set var="pg" value="<%=pg%>" />
	<input type="button" value="Sign Out" id="sign_out">
	<div class="wrapper">
		<div class="header">
			<span>Lith Harbor</span>
		</div>
		<br>
		<form action="delete.jsp" method="post" id="deleteform">
			<div class="contentWrap">
				<input type="hidden" name="num" value="${num}"> 
				<input type="hidden" name="pg" value="${pg}"> 
				<div>비밀번호</div>
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="buttonGroup">
				<input type="button" value="삭제" id="btn_del"> 
				<input type="button" value="취소" id="back">
			</div>
		</form>
		<div class="footer">Copyright © 2022 Ijin Joo</div>
	</div>
	
<script>
	$('#sign_out').on('click', function(){
		location.href = "../signOut.jsp";
	});
</script>
</body>
</html>
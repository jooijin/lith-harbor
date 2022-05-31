<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	int pg = 1; int num = 1; //인기글에서 넘어오는 경우 그냥 첫페이지로 가게
	try{
		String strPg = request.getParameter("pg"); // read.jsp?num=304&pg=1
		if(!strPg.equals("") && strPg != null)
			pg = Integer.parseInt(strPg);
		String strNum = request.getParameter("num"); // read.jsp?num=2
		if(!strNum.equals("") && strNum != null)
			num = Integer.parseInt(strNum); // "2" ==> 2
	} catch(Exception e){
		//
	}
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.boardRead(num);
%>
<c:set var="b" value="<%=dto%>" />
<c:set var="pg" value="<%=pg%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link href="../resources/css/board/updateform.css" rel="stylesheet" type="text/css">
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
<form action="update.jsp" method="post" id="updateform">
	<div class="titleWrap">
		<div>제목</div>
		<div>
			<input name="title" id="title" value="${b.title}">
			<input type="hidden" name="num" id="num" value="${b.num}">
			<input type="hidden" name="pg" id="pg" value="${pg}">
		</div>
	</div>
	<div class="idWrap">
		<div>ID</div>
		<div><input name="id" id="id" value="${b.id}" disabled></div>
	</div>
	<div class="contentWrap">
		<div><textarea rows="5" cols="30" name="content" id="content">${b.content}</textarea></div>
	</div>
	<div class="buttonGroup">
		<div id="btn_up">수정</div>
		<div id="back">취소</div>
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


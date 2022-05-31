<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	int pg = 1; int num = 1; //인기글에서 넘어오는 경우 그냥 첫페이지로 가게
	String strPg = request.getParameter("pg"); // read.jsp?num=304&pg=1
	if(!strPg.equals(""))
		pg = Integer.parseInt(strPg);
	String strNum = request.getParameter("num"); // read.jsp?num=2
	if(!strNum.equals(""))
		num = Integer.parseInt(strNum); // "2" ==> 2
	BoardDAO dao = new BoardDAO();
	dao.updateHit(num); // 조회수 증가
	BoardDTO dto = dao.boardRead(num); // 글 읽기
%>
<c:set var="b" value="<%=dto%>" />
<c:set var="pg" value="<%=pg%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/board/read.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<title>Content</title>
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
		<div class="titleWrap">
			<div>글번호</div>
			<div>${b.num} <input type="hidden" name="num" value="${b.num}" id="num"> <input type="hidden" name="pg" value="${pg}" id="pg"></div>
		</div>
		<div class="titleWrap">
			<div>제목</div>
			<div>${b.title}</div>
		</div>
		<div class="titleWrap">
			<div>이름</div>
			<div>${b.id}</div>
		</div>
		<div class="contentWrap">
			<div>내용</div>
			<div><p>${b.content}</p></div>
		</div>
		<div class="titleWrap">
			<div>날짜</div>
			<div><fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd" /></div>
		</div>
		<div class="titleWrap">
			<div>조회수</div>
			<div>${b.hit}</div>
		</div>
		<div class="buttonGroup">
			<input type="button" value="수정" id="btn_update">
			<input type="button" value="삭제" id="btn_delete">
			<input type="button" value="목록으로" id="back">
		</div>
		<div class="footer">Copyright © 2022 Ijin Joo</div>
	</div>
	
<script>
	$('#sign_out').on('click', function(){
		location.href = "../signOut.jsp";
	});
</script>
</body>
</html>



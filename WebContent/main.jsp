<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="member.*"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<!-- 로그인 세션 확인 -->
	<%
	if (session.getAttribute("id") == null) {
	%>
	<script>
		alert("로그인 후 이용해주세요.");
		location.href = "signIn.jsp";
	</script>
	<%
	} else {
	String id = (String) session.getAttribute("id");
	String nickname = (String) session.getAttribute("nickname");
	int level = (int) session.getAttribute("level");
	int meso = (int) session.getAttribute("meso");
	%>
	<!-- 오늘의 팁 가져오기 -->
	<%
	ArrayList<String> todaytip = new ArrayList<>();
	MemberDAO dao = new MemberDAO();
	todaytip = dao.selectTodayTip();
	int random_idx = (int) Math.floor(Math.random() * todaytip.size());
	%>
	<!-- 인기글 가져오기 -->
	<%
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardDTO> list = bdao.popularList();
	%>
	<!-- 메인 페이지 -->
	<input type="button" value="Sign Out" id="sign_out">
	<div class="wrapper">
		<div class="header">
			<span id="welcome">Welcome to Lith Harbor</span>
		</div>
		<div class="uppermenu">
			<div class="userInfo">
				<img src="./resources/image/loginIcon.png" style="width: 80px"><br>
				<b><%=nickname%></b><br> <b>lv.<%=level%></b><br> <b><%=meso%>
					메소</b>
			</div>
			<div class="todaymaple">
				<span class="tiptitle"><b>오늘의 팁</b></span><br> <span
					class="tipcontent"><%=todaytip.get(random_idx)%></span>
			</div>
			<div class="recommend">
				<img src="./resources/image/recom.png" alt="" class="recom"> <img
					src="./resources/image/recom_hover.png" alt="" class="recom_hover">
				<p>메이플 직업 추천!</p>
			</div>
		</div>
		<div class="board">
			<div class="boardTitle">현재 조회수 TOP 인기글!</div>
			<div class="boardLink">
				<a href="board/list.jsp">자유게시판</a>
				<a href="board/writeform.jsp">글쓰기</a>
			</div>
			<table border="1">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
				<c:set var="list" value="<%=list%>" />
				<c:forEach var="b" items="${list}">
				<tr>
					<td>${b.num}</td>
					<td><a href="board/read.jsp?num=${b.num}&pg=${pg}">${b.title}</a></td>
					<td>${b.hit}</td>
					<td><fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="bottommenu">
			<div class="gameplay">지금 바로 게임하러가기!</div>
			<div class="lucky">I'm Feeling Lucky!</div>
			<div id="my_modal">
				<a class="modal_close_btn">닫기</a>
			</div>
		</div>
		<div class="footer">Copyright © 2022 Ijin Joo</div>
	</div>
	<%
	}
	%>
	<script>
		$(".recommend").click(function() {
			location.href = "jobRecomm.jsp";
		});

		function modal(id) {
			var zIndex = 9999;
			var modal = $('#' + id);
			var bg = $('<div>').css({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				backgroundColor : 'rgba(0,0,0,0.4)'
			}).appendTo('body');

			modal.css({
				position : 'fixed',
				boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
				zIndex : zIndex + 1,
				// div center 정렬
				top : '50%',
				left : '50%',
				transform : 'translate(-50%, -50%)',
				msTransform : 'translate(-50%, -50%)',
				webkitTransform : 'translate(-50%, -50%)'
				}).show()
				.find('.modal_close_btn').on('click', function() {
					bg.remove();
					modal.hide();
			});
		}

		$('.lucky').on('click', function() {
			// 모달창 띄우기
			var randMeso = Math.floor(Math.random() * 1000);
			document.getElementById('my_modal').innerHTML = '<form action="mesoPlus.jsp" method="post"><input type="hidden" name="mesoPlus" value="' + randMeso + '">' + randMeso + " 메소 당첨!" + '<input type="submit" class="modal_close_btn" value="닫기"></form>';
			modal('my_modal');
		});

		$(".recommend").click(function() {
			location.href = "jobRecomm.jsp";
		});
		
		$(".gameplay").on('click', function(){
			window.location.href = 'https://maplestory.nexon.com/Home/Main';
		});
		
		$('#sign_out').on('click', function(){
			location.href = "signOut.jsp";
		});
	</script>
</body>
</html>
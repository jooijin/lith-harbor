<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.*"%>
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
	<!-- 메인 페이지 -->
	<div class="wrapper">
		<div class="header">
			<span id="welcome">Welcome to Lith Harbor</span><br> <span
				id="info">메이플스토리 유저들을 위한 커뮤니티</span>
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
		<div class="board"></div>
		<div class="bottommenu">
			<div class="market">sdfsdfsdf</div>
			<div class="lucky"></div>
			<div id="my_modal">
				Lorem ipsum, dolor sit amet consectetur adipisicing elit. Expedita
				dolore eveniet laborum repellat sit distinctio, ipsa rem dicta alias
				velit? Repellat doloribus mollitia dolorem voluptatum ex reiciendis
				aut in incidunt? <a class="modal_close_btn">닫기</a>
			</div>
			<div class="calculator"></div>
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

			// 모달 div 뒤에 희끄무레한 레이어
			var bg = $('<div>').css({
				position : 'fixed',
				zIndex : zIndex,
				left : '0px',
				top : '0px',
				width : '100%',
				height : '100%',
				overflow : 'auto',
				// 레이어 색갈은 여기서 바꾸면 됨
				backgroundColor : 'rgba(0,0,0,0.4)'
			}).appendTo('body');

			modal
					.css(
							{
								position : 'fixed',
								boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

								// 시꺼먼 레이어 보다 한칸 위에 보이기
								zIndex : zIndex + 1,

								// div center 정렬
								top : '50%',
								left : '50%',
								transform : 'translate(-50%, -50%)',
								msTransform : 'translate(-50%, -50%)',
								webkitTransform : 'translate(-50%, -50%)'
							}).show()
					// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
					.find('.modal_close_btn').on('click', function() {
						bg.remove();
						modal.hide();
					});
		}

		$('.lucky').on('click', function() {
			// 모달창 띄우기
			modal('my_modal');
		});

		$(".recommend").click(function() {
			location.href = "jobRecomm.jsp";
		});
	</script>
</body>
</html>
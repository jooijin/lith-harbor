<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
	<!-- 로그인 세션 확인 -->
	<%
		if(session.getAttribute("id") == null){
	%>
		<script>
			alert("로그인 후 이용해주세요.");
			location.href = "signIn.jsp";
		</script>
	<%
		} else{
			String id = (String)session.getAttribute("id");
			String nickname = (String)session.getAttribute("nickname");
			int level = (int)session.getAttribute("level");
			int meso = (int)session.getAttribute("meso");
	%>
	<!-- 메인 페이지 -->
	<div class="header">
		<span id="welcome">Welcome to Lith Harbor</span><br>
		<span id="info">메이플스토리 유저들을 위한 커뮤니티</span>
	</div>
	<div class="userInfo">
		<img src="./resources/image/loginIcon.png" style="width: 80px"><br>
		<b><%=nickname %></b><br>
		<b>lv.<%=level %></b><br>
		<b><%=meso %> 메소</b>
	</div>
	<%
		}
	%>
</body>
</html>
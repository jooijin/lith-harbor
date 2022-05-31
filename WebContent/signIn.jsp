<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/signIn.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Sign In</title>
</head>
<body>
<div class="wrapper">
	<div class="logo">
		<img src="./resources/image/pinkbin.gif" alt="main_logo" style="width:400px">
	</div>
	<form action="loginVerify.jsp" method="post" id="loginform">
		<div class="loginInfo">
			<input type="text" id="id" name="id" placeholder="ID"><br>
			<input type="password" id="pwd" name="pwd" placeholder="Password"><br>
		</div>
		<div class="buttonGroup">
			<input type="button" value="Sign In" id="sign_in">
		</div>
	</form>
</div>

<script>
	$('#sign_in').on('click', function(){
		if( $("#id").val() == "" ) {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if( $("#pwd").val() == "" ) {
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return;
		}
		$("#loginform").submit();
	});
	$('#sign_up').on('click', function(){
		location.href = "signUp.jsp";
	});
</script>
</body>
</html>
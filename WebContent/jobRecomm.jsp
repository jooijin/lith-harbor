<!-- https://codepen.io/tobiasdev/pen/XgegoO 참고하여 작성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/jobRecomm.css" rel="stylesheet"
	type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Recommendations for YOU</title>
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
	<div class="rb-box">
		<a href="main.js" style="color:black;">메인화면으로 돌아가기</a>
		<!-- Radio Button Module -->
		<p>1. 장거리 공격 VS 단거리 공격 중 어느 것을 선호하시나요? (1:단거리 ~ 5:장거리)</p>
		<div id="rb-1" class="rb">
			<div class="rb-tab rb-tab-active" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
				</div>
			</div>
			<div class="rb-tab" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
		</div>

		<!-- Radio Button Module -->
		<p>2. 기동성 VS 버프효과 중 어느 것을 선호하시나요? (1:기동성 ~ 5:버프효과)</p>
		<div id="rb-2" class="rb">
			<div class="rb-tab" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab rb-tab-active" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
				</div>
			</div>
			<div class="rb-tab" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
		</div>

		<!-- Radio Button Module -->
		<p>3. 보스전  VS 일반 사냥 중 어느 것을 더 중요하게 생각하시나요?(1:보스전 ~ 5:일반사냥)</p>
		<div id="rb-3" class="rb">
			<div class="rb-tab" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab rb-tab-active" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
				</div>
			</div>
			<div class="rb-tab" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
		</div>

		<!-- Radio Button Module -->
		<p>4. 대중적인 캐릭터 VS 특이한 캐릭터 중 어느 것을 더 선호하시나요? (1:대중적인 ~ 5:특이한)</p>
		<div id="rb-4" class="rb">
			<div class="rb-tab" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
				</div>
			</div>
			<div class="rb-tab rb-tab-active" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
		</div>

		<!-- Radio Button Module -->
		<p>5. 난이도가 낮은 것과 난이도가 높은 것 중 어느것을 더 선호하시나요? (1:낮음 ~ 5:높음)</p>
		<div id="rb-5" class="rb">
			<div class="rb-tab" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
				</div>
			</div>
			<div class="rb-tab" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab rb-tab-active" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
		</div>

		<!-- Button -->
		<div class="button-box">
			<button class="button trigger">Submit!</button>
		</div>

	</div>

	<script>
		var survey = []; //Bidimensional array: [ [1,3], [2,4] ]

		//Switcher function:
		$(".rb-tab").click(function() {
			//Spot switcher:
			$(this).parent().find(".rb-tab").removeClass("rb-tab-active");
			$(this).addClass("rb-tab-active");
		});

		//Save data:
		$(".trigger").click(
				function() {
					//Empty array:
					survey = [];
					//Push data:
					for (i = 1; i <= $(".rb").length; i++) {
						var rb = "rb" + i;
						var rbValue = parseInt($("#rb-" + i).find(
								".rb-tab-active").attr("data-value"));
						//Bidimensional array push:
						survey.push([ i, rbValue ]); //Bidimensional array: [ [1,3], [2,4] ]
					}
					;
					//Debug:
					calculate();
				});

		//Debug:
		function calculate() {
			var score = 0;
			for (i = 0; i < survey.length; i++) {
				score += survey[i][1];
			}
			
			if(score<=8)
				alert("당신에게 추천드리는 직업은 궁수/전사~");
			else if(score<=16)
				alert("당신에게 추천드리는 직업은 해적입니다!");
			else
				alert("당신에게 추천드리는 직업은 마법사입니다!");
		};
		
		$('#sign_out').on('click', function(){
			location.href = "signOut.jsp";
		});
	</script>
</body>
</html>
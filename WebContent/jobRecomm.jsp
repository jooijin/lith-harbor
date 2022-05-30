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
	<div class="rb-box">

		<!-- Radio Button Module -->
		<p>1.</p>
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
		<p>2. On a scale of 1 to 5 how would you rate the universe?</p>
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
		<p>3. On a scale of 1 to 5 how much do you like stalactites?</p>
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
		<p>4. On a scale of 1 to 5 what is your favorite color in the
			alphabet?</p>
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
		<p>5. On a scale of one to shrimp, how random are you?</p>
		<div id="rb-5" class="rb">
			<div class="rb-tab" data-value="4">
				<div class="rb-spot">
					<span class="rb-txt">4</span>
				</div>
			</div>
			<div class="rb-tab" data-value="2">
				<div class="rb-spot">
					<span class="rb-txt">2</span>
				</div>
			</div>
			<div class="rb-tab" data-value="5">
				<div class="rb-spot">
					<span class="rb-txt">5</span>
				</div>
			</div>
			<div class="rb-tab" data-value="1">
				<div class="rb-spot">
					<span class="rb-txt">1</span>
				</div>
			</div>
			<div class="rb-tab rb-tab-active" data-value="3">
				<div class="rb-spot">
					<span class="rb-txt">3</span>
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
					//debug();
				});

		//Debug:
		function debug() {
			var debug = "";
			for (i = 0; i < survey.length; i++) {
				debug += "Nº " + survey[i][0] + " = " + survey[i][1] + "\n";
			}
			;
			alert(debug);
		};
	</script>
</body>
</html>
$(function(){
	$("#btn_write").on('click', function(){
		// alert("btn_write 클릭함!");
		if( $("#title").val() == "" ) {
			alert("제목을 꼭 입력하세요!");
			$("#title").focus();
			return;
		}
		if( $("#content").val() == "" ) {
			alert("내용을 꼭 입력하세요!");
			$("#content").focus();
			return;
		}
		$("#writeform").submit();
	});
	// 수정과 삭제 버튼 처리
	$("#btn_update").on('click', function(){
		// alert("btn_update click!");
		var num = $("#num").val(); // <input type="hidden" id="num" ...>
		var pg = $("#pg").val();
		location.href = "updateform.jsp?num=" + num + "&pg=" + pg; // updateform.jsp?num=2
	});
	$("#btn_delete").on('click', function(){
		var num = $("#num").val(); // <input type="hidden" id="num" ...>
		var pg = $("#pg").val();
		location.href = "deleteform.jsp?num=" + num + "&pg=" + pg; // deleteform.jsp?num=2
	});
	// updateform 처리
	$("#btn_up").on('click', function(){
		// alert("btn_up click!");
		if( $("#title").val() == "" ) {
			alert("제목을 꼭 입력하세요!");
			$("#title").focus();
			return;
		}
		if( $("#content").val() == "" ) {
			alert("내용을 꼭 입력하세요!");
			$("#content").focus();
			return;
		}
		$("#updateform").submit();
	}); // 글 수정 폼
	// 글 수정
	$("#btn_del").on('click', function(){
		$("#deleteform").submit();
	});
	//목록으로
	$("#back").on('click', function(){
		history.back();
	});
});



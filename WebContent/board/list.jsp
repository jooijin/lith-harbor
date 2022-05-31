<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	int pg = 1;
	String strPg = request.getParameter("pg"); // list.jsp?pg=3
	if(strPg != null) {
		pg = Integer.parseInt(strPg);
	}
	int size = 10; // 한 페이지에 보여줄 글의 수
	int begin = (pg-1) * size; // 시작 글번호, MySQL은 시작글번호가 0부터 시작
	int end = begin + (size-1); // 0 + 9 ==> 9, 끝 글번호
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> list = dao.listBoard(begin, size); // LIMIT 0, 10 : 0번 글부터 size
	int cnt = dao.countBoard();
	int totalPage = (cnt / size) + (cnt % size == 0 ? 0 : 1);
	int linkSize = 10; // 보여줄 링크의 수
	int startLink = ((pg-1) / linkSize * linkSize) + 1;	// ((20-1)/10*10)+1==>11
	int endLink = startLink + (linkSize - 1);
	if(endLink > totalPage) {
		endLink = totalPage;
	}
	int max = cnt-((pg-1)*size); // 현재 페이지의 최대 글번호, 107-((2-1)*10) ==> 97
%>
<link href="../resources/css/board/list.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<title>List</title>
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
<c:set var="list" value="<%=list %>"/>
<c:set var="pg" value="<%=pg %>"/>
<c:set var="linkSize" value="<%=linkSize %>"/>
<c:set var="totalPage" value="<%=totalPage %>"/>
<c:set var="startLink" value="<%=startLink %>"/>
<c:set var="endLink" value="<%=endLink %>"/>
<c:set var="max" value="<%=max %>"/>
<input type="button" value="Sign Out" id="sign_out">
<div class="wrapper">
	<div class="header">
		<span>Lith Harbor</span>
	</div>
	<div class="titleWrap">
		<div><a href="writeform.jsp">글쓰기</a>
		<div><a href="../main.jsp">메인화면</a>
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
	<td><a href="read.jsp?num=${b.num}&pg=${pg}">${b.title}</a></td>
	<td>${b.hit}</td>
	<td><fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table>
<div class="buttonGroup">
	<c:if test="${pg <= linkSize}">
		[<span style="color : silver;">◀◀</span>]
		[<span style="color : silver;">◀</span>]
	</c:if>
	<c:if test="${pg > linkSize}">
		[<a href="list.jsp?pg=1">◀◀</a>]
		[<a href="list.jsp?pg=${startLink-1}">◀</a>]
	</c:if>
	<c:forEach var="i" begin="${startLink}" end="${endLink}">
		<c:if test="${pg == i}">[${i}]</c:if>
		<c:if test="${pg != i}">[<a href="list.jsp?pg=${i}">${i}</a>]</c:if>
	</c:forEach>
	<c:if test="${endLink < totalPage}">
		[<a href="list.jsp?pg=${endLink+1}">▶</a>]
		[<a href="list.jsp?pg=${totalPage}">▶▶</a>]
	</c:if>
	<c:if test="${endLink >= totalPage}">
		[<span style="color : silver;">▶</span>]
		[<span style="color : silver;">▶▶</span>]
	</c:if>
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



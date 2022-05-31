<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	BoardDTO dto = new BoardDTO();
	
	dto.setTitle(request.getParameter("title"));
	dto.setId((String)session.getAttribute("id"));
	dto.setContent(request.getParameter("content"));
	dto.setNum(Integer.parseInt(request.getParameter("num")));
	
	String strPg = request.getParameter("pg");
	int pg = Integer.parseInt(strPg);
	BoardDAO dao = new BoardDAO();
	int ok = dao.updateBoard(dto);
	
	if(ok == 1) { // 성공
		response.sendRedirect("list.jsp?pg=" + pg);
		return;
	}
%>
<c:set var="ok" value="<%=ok%>" />
<c:if test="${ok == 0}">
	<script>
		alert("오류가 발생하였습니다. 다시 시도해 주세요.");
		history.back();
	</script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	String strPg = request.getParameter("pg");
	int pg = Integer.parseInt(strPg);
	BoardDAO dao = new BoardDAO();
	String pwd = dao.selectPwd((String)session.getAttribute("id"));
	if(!pwd.equals(request.getParameter("pwd"))){
%>
	<script>
		alert("비밀번호를 잘못 입력하셨습니다.");
		history.back();
	</script>	
<%
		return;
	}
	
	int ok = dao.deleteBoard(dto);
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
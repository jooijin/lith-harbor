<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	request.setCharacterEncoding("utf-8");
	BoardDTO dto = new BoardDTO();	
	dto.setId((String)session.getAttribute("id"));
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(dto);
	response.sendRedirect("list.jsp");
%>

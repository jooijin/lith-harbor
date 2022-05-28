<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.verifyMember(id, pwd);
	if(dto.getNickname() != null) { // 성공
		session.setAttribute("id", id);
		session.setAttribute("nickname", dto.getNickname());
		session.setAttribute("level", dto.getLevel());
		session.setAttribute("meso", dto.getMeso());
		response.sendRedirect("main.jsp");
		return;
	}
%>
<script>
	alert("아이디/비밀번호를 잘못 입력하셨습니다.");
	history.back();
</script>
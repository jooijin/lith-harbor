<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String mesoPlus = request.getParameter("mesoPlus");
	if(mesoPlus != null){
		int meso = Integer.parseInt(mesoPlus);
		MemberDAO dao = new MemberDAO();
		dao.mesoPlus(meso, (String)session.getAttribute("id"));
		int newMeso = dao.selectMeso((String)session.getAttribute("id"));
		session.setAttribute("meso", newMeso);
	}
%>
<script>
	location.href = "main.jsp";
</script>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	
	int temp = dao.deleteMember(name, number);
	if(temp > 0){
		out.print("<script>alert('삭제 성공'); location.href = 'index.jsp'</script>");
	}else{
		out.print("<script>alert('삭제 실패'); history.go(-1);</script>");
	}
%> 
<div class="container">
	
</div>
<%@ include file="footer.jsp"%>
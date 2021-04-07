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
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String duty = request.getParameter("duty");
	String phone = request.getParameter("phone");
	
	MemberVO vo = new MemberVO();
	vo.setId(number);
	vo.setName(name);
	vo.setDept(dept);
	vo.setPosition(position);
	vo.setDuty(duty);
	vo.setPhone(phone);
	
	int temp = dao.insertMember(vo);
	if(temp > 0){
		out.print("<script>alert('등록 성공'); location.href = 'index.jsp'</script>");
	}else{
		out.print("<script>alert('등록 실패'); history.go(-1);</script>");
	}
%> 
<div class="container">
	
</div>
<%@ include file="footer.jsp"%>
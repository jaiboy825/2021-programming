<%@page import="vo.InfoVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String teacher = request.getParameter("teacher");
	int credit = Integer.parseInt(request.getParameter("credit"));
	int week = Integer.parseInt(request.getParameter("week"));
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	InfoVO vo = new InfoVO();
	vo.setId(id);
	vo.setName(name);
	vo.setTeacher(teacher);
	vo.setCredit(credit);
	vo.setWeek(week);
	vo.setStart(start);
	vo.setEnd(end);
	MemberDAO dao = new MemberDAO();
	int temp = dao.insertInfo(vo);
	if (temp > 0) {
		out.print("<script>alert('등록 완료'); location.href='/list.jsp'</script>");
	} else {
		out.print("<script>alert('등록 실패'); location.href='/list.jsp'</script>");
	}
%>
<%@ include file="footer.jsp"%>
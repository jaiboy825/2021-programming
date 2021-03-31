<%@page import="vo.TeacherVO"%>
<%@page import="vo.InfoVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String field = request.getParameter("field");
	MemberDAO dao = new MemberDAO();
	int Tnum = dao.getTnum();
	TeacherVO vo = new TeacherVO();
	vo.setIdx(Tnum);
	vo.setName(name);
	vo.setMajor(major);
	vo.setField(field);
	int temp = dao.insertTInfo(vo);
	if (temp > 0) {
		out.print("<script>alert('등록 완료'); location.href='/list.jsp'</script>");
	} else {
		out.print("<script>alert('등록 실패'); location.href='/list.jsp'</script>");
	}
%>
<%@ include file="footer.jsp"%>
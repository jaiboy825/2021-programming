<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	String id = request.getParameter("id");
	out.print(id);
	MemberDAO dao = new MemberDAO();
	int n = dao.deleteT(id);
	if (n > 0) {
		out.print("<script>alert('삭제 완료'); location.href='/teacher.jsp'</script>");
	} else {
		out.print("<script>alert('삭제 실패'); location.href='/teacher.jsp'</script>");
	}
%>
<%@ include file="footer.jsp" %>
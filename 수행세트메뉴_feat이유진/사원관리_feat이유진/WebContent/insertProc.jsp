<%@page import="java.sql.Date"%>
<%@page import="controller.MemberVO"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<jsp:include page="header.jsp"/>
	
	<%
		int empno = Integer.parseInt(request.getParameter("empno"));
		String empname = request.getParameter("empname");
		String joindate = request.getParameter("joindate");
		String y = joindate.substring(0, 4);
		String m = joindate.substring(5, 7);
		String d = joindate.substring(8, 10);
		String day = y + "-" + m + "-" + d;
		Date date = Date.valueOf(day);
		String rank = request.getParameter("rank");
		String dept = request.getParameter("dept");
		
		MemberVO vo = new MemberVO(empno, empname, date, rank, dept);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.insertMember(vo);
		int cnt2 = dao.insertSalary(vo.getEmpno());
		
		if (cnt > 0) {
	%>
			<script>
				alert("회원가입 성공하셨습니다.")
				location.href="index.jsp";
			</script>
	<%		
		} else {
	%>
			<script>
				alert("회원가입 실패하셨습니다.")
				history.go(-1);
			</script>
	<%	
		}
	%>
	
	<jsp:include page="footer.jsp"/>
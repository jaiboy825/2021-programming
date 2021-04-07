<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	int types = Integer.parseInt(request.getParameter("types"));
	if (types == 0) {
		String memberNum = request.getParameter("memberNum");
		if (memberNum == "") {
			out.print("<script>alert('사원번호를 입력해주세요'); history.go(-1); </script>");
		} else {
			list = dao.getListNum(memberNum);
		}
	} else {
		String dept = request.getParameter("dept");
		list = dao.getListDept(dept);
	}
%>
<div class="container">
	<p>직원 정보 조회 결과</p>
	<table border="2">
		<tr>
			<td>성명</td>
			<td>사번</td>
			<td>직급</td>
			<td>직책</td>
			<td>연락처</td>
			<td>소속부서</td>
		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {

					MemberVO vo = new MemberVO();
					vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getName()%></td>
			<td><%=vo.getId()%></td>
			<td><%=vo.getPosition()%></td>
			<td><%=vo.getDuty()%></td>
			<td><%=vo.getPhone()%></td>
			<td><%=vo.getDept()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<a href="search.jsp"><button>확인</button></a>
</div>
<%@ include file="footer.jsp"%>
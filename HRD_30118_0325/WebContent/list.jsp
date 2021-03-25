<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
%>
<div class="container">
	<h2>사원목록 조회 / 수정</h2>
	<table border="2">
		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>입사일자</td>
			<td>직급</td>
			<td>부서</td>
			<td>기능</td>

		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					MemberVO vo = new MemberVO();
					vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getEmpno()%></td>
			<td><%=vo.getEmpname()%></td>
			<td><%=vo.getJoindate()%></td>
			<td><%=vo.getGrade()%></td>
			<td><%=vo.getDept()%></td>
			<td><a href="/updateInfo.do?empno=<%=vo.getEmpno()%>">수정</a></td>
		</tr>
		<%
			}
			}
		%>

	</table>
</div>
<%@ include file="footer.jsp"%>

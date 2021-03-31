<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	MemberDAO dao = new MemberDAO();
	int getCount = dao.getCount();
	ArrayList<MemberVO> list = dao.getList();
%>
<div class="container">
	<h4>
		총<%=getCount%>개의 교과목이 있습니다.
	</h4>
	<table border="2">
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>학점</th>
			<th>담당강사</th>
			<th>요일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>관리</th>
		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					MemberVO vo = new MemberVO();
					vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getId()%></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getCredit()%></td>
			<td><%=vo.getTeacher()%></td>
			<td><%=vo.getWeek()%></td>
			<td><%=vo.getStart_hour()%></td>
			<td><%=vo.getEnd_end()%></td>
			<td><a href="/edit.jsp?id=<%=vo.getId()%>">수정</a> / <a
				href="/delete.jsp?id=<%=vo.getId()%>">삭제</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<button onclick="location.href='/insert.jsp'">작성</button>
</div>
<%@ include file="footer.jsp"%>
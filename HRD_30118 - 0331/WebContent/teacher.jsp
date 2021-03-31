<%@page import="vo.TeacherVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	MemberDAO dao = new MemberDAO();
	int getCount = dao.getCount();
	ArrayList<TeacherVO> list = dao.getTeacherList();
%>
<div class="container">
	<table border="2">
		<tr>
			<th>이름</th>
			<th>전공</th>
			<th>세부전공</th>
			<th>관리</th>
		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					TeacherVO vo = new TeacherVO();
					vo = list.get(i);
		%>
		<tr>
		<td><%=vo.getName() %></td>
		<td><%=vo.getMajor() %></td>
		<td><%=vo.getField() %></td>
		<td><a href="/deleteT.jsp?id=<%=vo.getIdx()%>">삭제</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<button onclick="location.href='/insertT.jsp'">작성</button>
</div>
<%@ include file="footer.jsp"%>
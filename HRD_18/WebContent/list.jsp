<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
	String grade = "";
%>
<div class="container">
	<div class="box">
		<p class="title">회원목록조회/수정</p>
		<table border="2">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>통신사</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					MemberVO vo = new MemberVO();
					vo = list.get(i);
		%>
			<tr>
				<td><a href="/update.jsp?custno=<%=vo.getCustno()%>"><%=vo.getCustno()%></a></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getPhone()%></td>
				<td><%=vo.getAddress()%></td>
				<td><%=vo.getJoindate()%></td>
				<%
				
			%>
				<td><%=vo.getGrade()%></td>
				<td><%=vo.getCity()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>

	</div>
</div>
<%@ include file="footer.jsp"%>
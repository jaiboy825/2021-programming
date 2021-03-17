<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<MemberVO> list = (ArrayList<MemberVO>) request.getAttribute("list");
%>
<div class="container">
	<div class="box">
		<p class="title">회원목록조회/수정</p>
		<table border="2">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>주소</th>
				<th>수정</th>
			</tr>
			<%
				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
						MemberVO vo = new MemberVO();
						vo = list.get(i);
						SimpleDateFormat sDate = new SimpleDateFormat("yyyy-MM-dd");
					
						String joindate = sDate.format(vo.getJoindate());
			%>
			<tr>
				<td><%=vo.getCustno()%></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getCustname()%></td>
				<td><%=vo.getAddress()%></td>
				<td><%=joindate%></td>
				<td><a href="/updateInfo.do?custno=<%=vo.getCustno()%>">수정</a></td>
			</tr>
			<%
				}
				}
			%>
		</table>

	</div>
</div>

<%@ include file="footer.jsp"%>
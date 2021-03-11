<%@page import="vo.MemberPriceVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<MemberPriceVO> list = (ArrayList<MemberPriceVO>) request.getAttribute("list");
	String grade = "";
%>
<div class="container">
	<div class="box">
		<p class="title">회원매출조회</p>
		<table border="2">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
						MemberPriceVO vo = new MemberPriceVO();
						vo = list.get(i);
			%>
			<tr>
				<td><%=vo.getCustNo()%></td>
				<td><%=vo.getCustName()%></td>
				<td><%=vo.getGrade()%></td>
				<td><%=vo.getTotal()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>
</div>
<%@ include file="footer.jsp"%>
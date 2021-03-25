<%@page import="vo.MemberPriceVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	ArrayList<MemberPriceVO> list = (ArrayList<MemberPriceVO>) request.getAttribute("vo");
	String grade = "";
%>
<div class="container">
	<h2>사원별 급여현황</h2>
	<table border="2">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>매출</th>
		</tr>
		<%
			if (list != null) {
				for (int i = 0; i < list.size(); i++) {
					MemberPriceVO vo = new MemberPriceVO();
					vo = list.get(i);
		%>
		<tr>
			<td><%=vo.getempNo()%></td>
			<td><%=vo.getempName()%></td>
			<td><%=vo.getTotal()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
</div>
<%@ include file="footer.jsp"%>
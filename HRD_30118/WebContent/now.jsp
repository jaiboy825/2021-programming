<%@page import="vo.MemberBookVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<%
		ArrayList<MemberBookVO> mlist = (ArrayList<MemberBookVO>) request.getAttribute("mlist");
	ArrayList<MemberBookVO> blist = (ArrayList<MemberBookVO>) request.getAttribute("blist");
	%>
	<h1>회원별 대여현황</h1>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>회원이름</td>
			<td>대여횟수</td>
		</tr>
		<%
			if (mlist != null) {

			for (MemberBookVO vo : mlist) {
		%>
		<tr>
			<td><%=vo.getCustno()%></td>
			<td><%=vo.getCustname()%></td>
			<td><%=vo.getMemberCnt()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<h1>도서별 대여현황</h1>
	<table border="1">
		<tr>
			<td>도서번호</td>
			<td>대여횟수</td>
		</tr>
		<%
		if(blist != null){
			
			for (MemberBookVO vo : blist) {
		%>
		<tr>
			<td><%=vo.getBookno()%></td>
			<td><%=vo.getBookCnt()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
</div>

<%@ include file="footer.jsp"%>
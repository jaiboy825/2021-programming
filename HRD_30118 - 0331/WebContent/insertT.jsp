<%@page import="vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	MemberDAO dao = new MemberDAO();
%>
<div class="container">
	<h3>선생 추가</h3>
	<form action="/insertTPro.jsp" method="post">
		<table border="2">

			<tr>
				<td>교사 이름</td>
				<td><input type="text" placeholder="교사 이름" name="name"
					required="required"></td>
			</tr>
			<tr>
				<td>전공</td>
				<td><input type="text" placeholder="전공" name="major"
					required="required"></td>
			</tr>
			<tr>
				<td>세부전공</td>
				<td><input type="text" placeholder="세부전공" name="field"
					required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="location.href='/teacher.jsp'">목록</button>
					<input type="submit" value="완료" id="insert"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="footer.jsp"%>
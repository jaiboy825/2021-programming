<%@page import="vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<TeacherVO> list = dao.getTeacherList();
%>
<div class="container">
	<h3>교과목 추가</h3>
	<form action="/insertPro.jsp" method="post">
		<table border="2">

			<tr>
				<td>교과목 코드</td>
				<td><input type="text" placeholder="교과목 코드" name="id"
					required="required"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" placeholder="과목명" name="name"
					required="required"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td><select name="teacher">
						<%
						if (list != null) {
							for (int i = 0; i < list.size(); i++) {
								TeacherVO vo = new TeacherVO();
								vo = list.get(i);
					%>
						<option value="<%=vo.getIdx()%>"><%=vo.getName()%></option>
						<%
						}
						}
					%>
				</select></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" placeholder="학점" name="credit"
					required="required"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td><input type="radio" name="week" value="1" checked="checked">
					월 <input type="radio" name="week" value="2"> 화 <input
					type="radio" name="week" value="3"> 수 <input type="radio"
					name="week" value="4"> 목 <input type="radio" name="week"
					value="5"> 금 <input type="radio" name="week" value="6">
					토</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="text" placeholder="시작" name="start"
					required="required"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" placeholder="종료" name="end"
					required="required"></td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="location.href='/list.jsp'">목록</button>
					<input type="submit" value="완료" id="insert"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="footer.jsp"%>
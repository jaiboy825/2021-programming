<%@page import="vo.InfoVO"%>
<%@page import="vo.TeacherVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<TeacherVO> list = dao.getTeacherList();
	String id = request.getParameter("id");
	InfoVO vo = dao.getInfo(id);
	if (vo == null) {
		out.print("<script>alert('정보가 없습니다'); location.href='/list.jsp'</script>");
	}
%>
<div class="container">
	<h3>교과목 추가</h3>
	<form action="/updatePro.jsp" method="post">
		<table border="2">

			<tr>
				<td>교과목 코드</td>
				<td><input type="text" placeholder="교과목 코드" name="id"
					required="required" value="<%=vo.getId()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" placeholder="과목명" name="name"
					required="required" value="<%=vo.getName()%>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td><select name="teacher">
						<%
							if (list != null) {
								for (int i = 0; i < list.size(); i++) {
									TeacherVO vos = new TeacherVO();
									vos = list.get(i);
						%>
						<option value="<%=vos.getIdx()%>"
							<%if (Integer.parseInt(vo.getTeacher()) == vos.getIdx()) {%>
							selected="selected" <%}%>><%=vos.getName()%></option>
						<%
							}
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" placeholder="학점" name="credit"
					required="required" value="<%=vo.getCredit()%>"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td><input type="radio" name="week" value="1"
					<%if (vo.getWeek() == 1) {%> checked="checked" <%}%>> 월 <input
					type="radio" name="week" value="2" <%if (vo.getWeek() == 2) {%>
					checked="checked" <%}%>> 화 <input type="radio" name="week"
					value="3" <%if (vo.getWeek() == 3) {%> checked="checked" <%}%>>
					수 <input type="radio" name="week" value="4"
					<%if (vo.getWeek() == 4) {%> checked="checked" <%}%>> 목 <input
					type="radio" name="week" value="5" <%if (vo.getWeek() == 5) {%>
					checked="checked" <%}%>> 금 <input type="radio" name="week"
					value="6" <%if (vo.getWeek() == 6) {%> checked="checked" <%}%>>
					토</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="text" placeholder="시작" name="start"
					required="required" value="<%=vo.getStart()%>"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" placeholder="종료" name="end"
					required="required" value="<%=vo.getEnd()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><button onclick="location.href='/list.jsp'">목록</button>
					<input type="submit" value="완료" id="insert"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="footer.jsp"%>
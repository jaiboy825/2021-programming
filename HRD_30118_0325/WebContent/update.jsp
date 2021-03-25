<%@page import="vo.MemberVO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	String error = (String) request.getAttribute("error");
	if (error != null) {
		out.print("<script>alert('" + error + "'); history.go(-1);</script>");
	}
	String ok = (String) request.getAttribute("ok");
	if (ok != null) {
		out.print("<script>alert('" + ok + "'); location.href='index.jsp'; </script>");
	}

	MemberVO vo = (MemberVO) request.getAttribute("vo");
%>
<div class="container">
	<form action="/update.do" method="post">
		<table border="2">
			<tr>
				<td>회원번호 (자동생성)</td>
				<td><input type="text" value="<%=vo.getEmpno()%>" name="empno"
					id="name" readonly="readonly"></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="empname" id="empname"
					required="required" value="<%=vo.getEmpname()%>"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" value="<%=vo.getJoindate()%>"
					name="joindate" id="joindate" readonly="readonly"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><select name="grade">
						<option value="A" selected>사원</option>
						<option value="B">대리</option>
						<option value="C">과장</option>
				</select></td>
			</tr>
			<tr>
				<td>부서</td>
				<td><select name="dept">
						<option value="A" selected>디자인</option>
						<option value="B">백엔드</option>
						<option value="C">프론트</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정"
					id="insert"></td>
			</tr>
		</table>
		<script type="text/javascript">
			insert.addEventListener("click", function() {
				if (empname.value == "") {
					alert("이름을 입력해주세요");
					return;
				}
			});
		</script>
	</form>
</div>

<%@ include file="footer.jsp"%>
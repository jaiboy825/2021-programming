<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.MemberDao"%>
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
	Date joindate = Date.valueOf(LocalDate.now());
	MemberDao dao = new MemberDao();
	int nextNum = dao.nextNum();
%>
<div class="container">
	<form action="/insert.do" method="post">
		<table border="2">
			<tr>
				<td>회원번호 (자동생성)</td>
				<td><input type="text" value="<%=nextNum%>" name="custno"
					id="name" readonly="readonly"></td>
			</tr>
			<tr>
				<td>회원이름</td>
				<td><input type="text" name="custname" id="custname" required="required"></td>
			</tr>
			<tr>
				<td>가입일자</td>
				<td><input type="text" value="<%=joindate %>" name="joindate" id="joindate" readonly="readonly"></td>
			</tr>
			<tr>
				<td>고객등급</td>
				<td><select name="grade">
						<option value="A" selected="selected">VIP</option>
						<option value="B">일반</option>
						<option value="C">직원</option>
				</select></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" id="address" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"
					id="insert"></td>
			</tr>
		</table>
		<script type="text/javascript">
			insert.addEventListener("click", function() {
				if(custname.value.length > 3){
					alert("이름이 너무 깁니다 다시 입력해주세요");
					return;
				}
				if (custname.value == "") {
					alert("이름을 입력해주세요");
					return;
				}
				if (joindate.value == "") {
					alert("가입일자를 입력해주세요");
					return;
				}
				if (address.value == "") {
					alert("주소를 입력해주세요");
					return;
				}
				return;
			});
		</script>
	</form>
</div>

<%@ include file="footer.jsp"%>
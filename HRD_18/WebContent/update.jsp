<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
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
<form action="/memberUpdate.do" method="post">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td><input type="text" name="custno" readonly="readonly"
				value="<%=vo.getCustno()%>"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" id="custname"
				value="<%=vo.getCustname()%>"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" id="phone"
				value="<%=vo.getPhone()%>"></td>
		</tr>
		<tr>
			<td>통신사 [SK, KT, LG]</td>
			<td><input type="text" name="address" id="address"
				value="<%=vo.getAddress()%>"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" value="<%=vo.getJoindate()%>"
				name="joindate" readonly="readonly"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP, B:일반, C:직원]</td>
			<td><select name="grade">
					<%
						if (vo.getGrade() == "A") {
					%>
					<option value="A" selected="selected">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
					<%
						} else if (vo.getGrade() == "B") {
					%>
					<option value="A">A</option>
					<option value="B" selected="selected">B</option>
					<option value="C">C</option>
					<%
						} else if (vo.getGrade() == "C") {
					%>
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C" selected="selected">C</option>
					<%
						}
					%>
			</select></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city" id="city" value="<%=vo.getCity()%>"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록" id="add">
				<a href="memberList.do"> <input type="button" value="조회">
			</a></td>
		</tr>
	</table>
	<script type="text/javascript">
		add.addEventListener("click", function() {
			console.log(name.value);
			if (custname.value == "") {
				alert("이름을 입력해주세요");
				return;
			}
			if (phone.value == "") {
				alert("전화번호를 입력해주세요");
				return;
			}

			if (address.value == "") {
				alert("통신사를 입력해주세요");
				return;
			}
			if (city.value == "") {
				alert("도시를 입력해주세요");
				return;
			}
		});
	</script>
</form>
<%@ include file="footer.jsp"%>
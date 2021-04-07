<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<p>인사관리 사원정보 변경</p>
	<form action="firePro.jsp" method="post">
		<table>
			<tr>
				<td>성명 : </td>
				<td><input type="text" name="name" required="required"></td>
			</tr>
			<tr>
				<td>사원번호 : </td>
				<td><input type="text" name="number" required="required"></td>
			</tr>
			<tr>
				<td rowspan="2"><input type="submit" value="삭제"> <input
					type="button" value="취소" onclick="location.href= 'index.jsp'"></td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="footer.jsp"%>
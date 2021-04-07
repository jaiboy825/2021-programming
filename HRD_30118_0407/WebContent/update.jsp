<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<p>인사관리 사원정보 변경</p>
	<form action="updatePro.jsp" method="post">
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
				<td>소속부서 : </td>
				<td><select name="dept">
						<option value="인사부" selected="selected">인사부</option>
						<option value="기획부">기획부</option>
						<option value="홍보부">홍보부</option>
						<option value="영업부">영업부</option>
						<option value="경리부">경리부</option>
				</select></td>
			</tr>
			<tr>
				<td>직 급 : </td>
				<td><select name="position">
						<option value="1" selected="selected">1급</option>
						<option value="2">2급</option>
						<option value="3">3급</option>
						<option value="4">4급</option>
						<option value="5">5급</option>
				</select></td>
			</tr>
			<tr>
				<td>직 책 : </td>
				<td><input type="text" name="duty"></td>
			</tr>
			<tr>
				<td>연락처 : </td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
			 <td rowspan="2">
			 <input type="submit" value="등록">
			 <input type="button" value="취소" onclick="location.href= 'index.jsp'">
			 </td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="footer.jsp"%>
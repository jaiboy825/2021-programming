<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<p>인사관리 조회</p>
	<form action="searchPro.jsp" method="post">
	<table>
	<tr>
	<td>
		<input type="radio" name="types" value="0" id="numberR" checked="checked"> 사원번호로 조회 
	</td>
	<td>
		<input type="text" name="memberNum" placeholder="사원번호로 조회"> 
	</td>
	</tr>
	<tr>
	<td>
		<input type="radio" name="types" value="1" id="deptR"> 부서명으로 조회 
	</td>
	<td>
		<select name="dept">
			<option value="인사부" selected="selected">인사부</option>
			<option value="기획부">기획부</option>
			<option value="홍보부">홍보부</option>
			<option value="영업부">영업부</option>
			<option value="경리부">경리부</option>
		</select>
	</td>
	</tr>
	<tr>
	<td rowspan="2">
		<input type="submit" value="조회">
		<input type="button" value="취소" onclick="location.href='index.jsp' ">
	</td>
	</tr>
			
	</table>
	<script type="text/javascript">
	</script>
	</form>
</div>
<%@ include file="footer.jsp"%>
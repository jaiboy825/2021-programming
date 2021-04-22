<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<jsp:include page="header.jsp"/>
	
	<%
		MemberDAO dao = new MemberDAO();
		int max = dao.getMaxNo();
	%>

	<section>
		<h2>사원 회원가입 페이지</h2>
		<form action="insertProc.jsp" method="get" name="regForm">
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="empno" value="<%=max %>" readonly></td>
				</tr>
				<tr>
					<td>사원이름</td>
					<td><input type="text" name="empname" required></td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td><input type="text" name="joindate" required placeholder="2020-03-25"></td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select name="rank" required>
							<option value="A">사원</option>
							<option value="B">대리</option>
							<option value="C">과장</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="dept" required>
							<option value="A">디자인</option>
							<option value="B">백엔드</option>
							<option value="C">프론트</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="footer.jsp"/>
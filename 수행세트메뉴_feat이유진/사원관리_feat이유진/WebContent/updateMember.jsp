<%@page import="controller.MemberVO"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	int empno = Integer.parseInt(request.getParameter("empno"));
    	MemberDAO dao = new MemberDAO();
    	MemberVO vo = dao.selectOneMember(empno);
    %>
    
	<jsp:include page="header.jsp"/>
	
	<section>
		<h2>사원 회원가입 페이지</h2>
		<form action="updateProc.jsp" method="get">
			<table border="1">
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="empno" value="<%=vo.getEmpno() %>" readonly></td>
				</tr>
				<tr>
					<td>사원이름</td>
					<td><input type="text" name="empname" value="<%=vo.getEmpname() %>" required></td>
				</tr>
				<tr>
					<td>입사일자</td>
					<td><input type="text" name="joindate" value="<%=vo.getJoindate() %>" required></td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select name="rank" required>
							<%
								if (vo.getRank().equals("A")) {
							%>
									<option value="A" selected>사원</option>
									<option value="B">대리</option>
									<option value="C">과장</option>
							<%		
								} else if (vo.getRank().equals("B")) {
							%>
									<option value="A">사원</option>
									<option value="B" selected>대리</option>
									<option value="C">과장</option>
							<%	
								} else {
							%>
									<option value="A">사원</option>
									<option value="B">대리</option>
									<option value="C" selected>과장</option>
							<%	
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="dept" required>
							<%
								if (vo.getDept().equals("A")) {
							%>
									<option value="A" selected>디자인</option>
									<option value="B">백엔드</option>
									<option value="C">프론트</option>
							<%		
								} else if (vo.getDept().equals("B")) {
							%>
									<option value="A">디자인</option>
									<option value="B" selected>백엔드</option>
									<option value="C">프론트</option>
							<%	
								} else {
							%>
									<option value="A">디자인</option>
									<option value="B">백엔드</option>
									<option value="C" selected>프론트</option>
							<%	
								}
							%>
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
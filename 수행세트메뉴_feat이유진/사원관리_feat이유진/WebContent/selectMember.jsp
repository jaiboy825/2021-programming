<%@page import="java.util.ArrayList"%>
<%@page import="controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<jsp:include page="header.jsp"/>
	
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.selectMembers();
	%>
	
	<section>
		<h2>회원목록 조회 / 수정</h2>
		<table border="1">
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>입사일자</th>
				<th>직급</th>
				<th>부서</th>
				<th>기능</th>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++) {
					MemberVO vo = list.get(i);
					String rank = vo.getRank();
					String rankT = "";
					String dept = vo.getDept();
					String deptT = "";
					
					if (rank.equals("A")) { rankT = "사원"; }
					else if (rank.equals("B")) { rankT = "대리"; }
					else { rankT = "과장"; }
					
					if (dept.equals("A")) { deptT = "디자인"; }
					else if (dept.equals("B")) { deptT = "백엔드"; }
					else { deptT = "프론트"; }
					
			%>
					<tr>
						<td><%=vo.getEmpno() %></td>
						<td><%=vo.getEmpname() %></td>
						<td><%=vo.getJoindate() %></td>
						<td><%=rankT %></td>
						<td><%=deptT %></td>
						<td><a href="updateMember.jsp?empno=<%=vo.getEmpno() %>">수정</a></td>
					</tr>
			<%
				}
			%>
		</table>
	</section>
	
	<jsp:include page="footer.jsp"/>
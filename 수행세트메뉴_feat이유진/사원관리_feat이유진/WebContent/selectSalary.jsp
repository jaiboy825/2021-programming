<%@page import="controller.SalaryVO"%>
<%@page import="controller.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		MemberDAO dao = new MemberDAO();
		ArrayList<SalaryVO> list = dao.selectSalary();
	%>
    
	<jsp:include page="header.jsp"/>

	<section>
		<h2>사원별 급여현황</h2>
		
		<table border="1">
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>총 급여</th>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++) {
					SalaryVO vo = list.get(i);
			%>
					<tr>
						<td><%=vo.getEmpno() %></td>
						<td><%=vo.getEmpname() %></td>
						<td><%=vo.getPay() %></td>
					</tr>
			<%
				}
			%>
		</table>
	</section>
	
	<jsp:include page="footer.jsp"/>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.PersonnelVO"%>
<%@page import="controller.PersonnelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h2 {
		border-bottom: 1px solid black;
	}
	
	.btn {
		position: absolute;
		top: 150px;
		padding: 15px 30px;
		background-color: #eeeeee;
		text-decoration: none;
	}
</style>
<body>
	<h2>직원 정보 조회 결과</h2>

	<table border="">
		<tr>
			<th>성명</th>
			<th>사번</th>
			<th>직급</th>
			<th>직책</th>
			<th>연락처</th>
			<th>소속부서</th>
		</tr>
		
		<%
			String how = request.getParameter("how");
			PersonnelDAO dao = new PersonnelDAO();
			
			if (how.equals("id")) {
				String myId = request.getParameter("myId");
				PersonnelVO vo = dao.selectId(myId);
		%>
				<tr>
					<th><%=vo.getName() %></th>
					<th><%=vo.getId() %></th>
					<th><%=vo.getPosition() %></th>
					<th><%=vo.getDuty() %></th>
					<th><%=vo.getPhone() %></th>
					<th><%=vo.getDept() %></th>
				</tr>
		<%
			} else if (how.equals("dept")) {
				String myDept = request.getParameter("myDept");
				System.out.println(myDept);
				ArrayList<PersonnelVO> list = dao.selectDept(myDept);
				
				for (int i = 0; i < list.size(); i++) {
					PersonnelVO vo2 = list.get(i);
		%>
					<tr>
						<th><%=vo2.getName() %></th>
						<th><%=vo2.getId() %></th>
						<th><%=vo2.getPosition() %></th>
						<th><%=vo2.getDuty() %></th>
						<th><%=vo2.getPhone() %></th>
						<th><%=vo2.getDept() %></th>
					</tr>
		<%
				}
			}
		%>
	
	</table>
	
	<a href="index.jsp" class="btn">확인</a>
</body>
</html>
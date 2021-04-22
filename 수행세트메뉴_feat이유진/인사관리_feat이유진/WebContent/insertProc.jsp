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
<body>
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String duty = request.getParameter("duty");
		String phone = request.getParameter("phone");
		
		PersonnelVO vo = new PersonnelVO(id, name, dept, position, duty, phone); 
		
		PersonnelDAO dao = new PersonnelDAO();
		int cnt = dao.insert(vo);
		
		if (cnt > -1) {
	%>
			<script type="text/javascript">
				alert("회원가입에 성공하셨습니다.");
				location.href="index.jsp";
			</script>
	<%		
		} else {
	%>
			<script type="text/javascript">
				alert("회원가입에 실패하셨습니다.");
				history.go(-1);
			</script>
	<%	
		}
	%>
</body>
</html>
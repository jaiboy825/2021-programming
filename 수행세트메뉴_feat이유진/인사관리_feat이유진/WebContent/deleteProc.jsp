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
		
		PersonnelDAO dao = new PersonnelDAO();
		PersonnelVO vo = dao.selectId(id);
		
		
		int cnt = dao.delete(name, id);
		
		if (vo.getId().equals(id) && vo.getName().equals(name)) {
	%>
			<script type="text/javascript">
				alert("퇴사 성공하셨습니다.");
				location.href="index.jsp";
			</script>
	<%		
		} else {
	%>
			<script type="text/javascript">
				alert("퇴사 실패하셨습니다.");
				history.go(-1);
			</script>
	<%	
		}
	%>
</body>
</html>
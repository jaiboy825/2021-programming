<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int custno = Integer.parseInt(request.getParameter("custno"));
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberVO vo = new MemberVO(custno, custname, phone, address, null, grade, city);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(vo);
		
		if(cnt > 0) {
	%>	
			<script type="text/javascript">
				alert("회원수정이 완료 되었습니다.!");
				location.href = "index.jsp";
			</script>
	<%		
		} else {
	%>	
			<script type="text/javascript">
				alert("회원수정이 실패 되었습니다.!");
				history.go(-1);
			</script>
	<%		
		}
	%>
</body>
</html>
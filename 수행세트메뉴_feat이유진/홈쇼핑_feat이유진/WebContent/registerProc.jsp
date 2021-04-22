<%@page import="java.sql.Date"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
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
			MemberDAO dao = new MemberDAO();
			int custno = Integer.parseInt(request.getParameter("custno"));
			String custname = request.getParameter("custname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String joindate = request.getParameter("joindate");
			System.out.println(joindate);
			int y = Integer.parseInt(joindate.substring(0, 4));
			System.out.println(y);
			int m = Integer.parseInt(joindate.substring(4, 6));
			System.out.println(m);
			int d = Integer.parseInt(joindate.substring(6, 8));
			System.out.println(d);
			String date1 = y + "-" + m + "-" + d;
			Date date = Date.valueOf(date1);
			System.out.println(date);
			String grade = request.getParameter("grade");
			String city = request.getParameter("city");
			
			MemberVO vo = new MemberVO(custno, custname, phone, address, date, grade, city);
			
			int cnt = dao.register(vo);
	
		if(cnt > 0) {
	%>	
			<script type="text/javascript">
				alert("회원등록이 완료 되었습니다.!");
				location.href = "index.jsp";
			</script>
	<%		
		} else {
	%>	
			<script type="text/javascript">
				alert("회원등록이 실패 되었습니다.!");
				history.go(-1);
			</script>
	<%		
		}
	%>
	
	
</body>
</html>
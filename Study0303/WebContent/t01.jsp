<%@page import="java.sql.SQLException"%>
<%@page import="common.JdbcUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");

			pstmt = conn.prepareStatement("drop table test");
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("create table test (id varchar2(5),pwd varchar2(5))");
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("insert into test values('test1', '11')");
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("insert into test values('test2', '22')");
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>
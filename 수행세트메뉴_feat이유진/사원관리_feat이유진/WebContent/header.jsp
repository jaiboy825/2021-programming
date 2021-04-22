<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	header > h2 {
		text-align: center;
	}
	
	nav {
		height: 50px;
		display: flex;
		justify-content: space-around;
		background-color: #000;
	}
	
	nav > a {
		text-decoration: none;
		line-height: 50px;
		color: #fff;
	}
	
	section {
		margin-left: 50px;
		height: 300px;
	}
	
	footer {
		height: 50px;
		text-align: center;
	}
</style>
<body>
	<header>
		<h2>사원 관리 프로그램</h2>
		<nav>
			<a href="index.jsp">홈으로</a>
			<a href="insertMember.jsp">사원원등록</a>
			<a href="selectSalary.jsp">사원급여 조회</a>
			<a href="selectMember.jsp">사원목록 조회/수정</a>
		</nav>
	</header>
	
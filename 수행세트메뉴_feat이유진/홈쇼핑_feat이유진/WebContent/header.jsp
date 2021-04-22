<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	* {
		margin: 0;
		padding: 0;
		text-decoration: none;
	}

	header {
		width: 100%;
		height: 70px;
		text-align: center;
		background-color: #000;
		color: #fff;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	nav {
		padding-left: 20px;
		height: 50px;
		display: flex;
		align-items: center;
		background-color: #333;
	}
	
	nav a {
		margin-right: 20px;
		color: #fff;
	}
	
	footer {
		height: 50px;
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: #333;
		color: #fff;
	}
	
	section {
		padding: 30px 0;
		text-align: center;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	section > h2 {
		padding-bottom: 20px;
	}
	
</style>
<body>
	<header>
		<h2>쇼핑몰 회원관리 ver1.0</h2>
	</header>
	
	<nav>
		<a href="register.jsp">회원등록</a>
		<a href="select.jsp">회원목록조회/수정</a>
		<a href="price.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
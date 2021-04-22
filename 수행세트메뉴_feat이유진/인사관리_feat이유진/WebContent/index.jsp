<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	div {
		padding: 20px;
		width: 350px;
		display: grid;
		grid-template-columns: 33.33% 33.33% 33.33%;
		gap: 20px;
		border: 1px solid black;
	}
	
	p {
		position: absolute;
		top: 45px;
		left: 30px;
		background-color: #fff;
	}

	button {
		margin-bottom: 10px;
		padding: 15px 30px;
		text-decoration: none;
	}
</style>
<body>
	<h2>인사관리시스템</h2>
	
	<p>인사관리 메인메뉴</p>
	<div>
		<button onclick="location.href='select.jsp'">조회</button>
		<button onclick="location.href='insert.jsp'">사원등록</button>
		<button onclick="location.href='update.jsp'">정보변경</button>
		<button onclick="location.href='delete.jsp'">퇴사처리</button>
		<button onclick="exit()">종료</button>
	</div>
</body>
</html>

<script>
	function exit() {
		parent.window.close();
	}
</script>
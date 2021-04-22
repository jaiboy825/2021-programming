<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>인사관리조회화면</h2>
	<form method="get" action="selectProc.jsp">
		<input type="radio" name="how" value="id"> 사원번호로 조회 <input type="text" name="myId" placeholder="사원번호를 입력하세요"> <br>
		<input type="radio" name="how" value="dept"> 부서명으로 조회
		<select name="myDept">
			<option value="인사부">인사부</option>
			<option value="기획부">기획부</option>
			<option value="홍보부">홍보부</option>
			<option value="영업부">영업부</option>
			<option value="경리부">경리부</option>
		</select> <br>
		
		<input type="submit" value="조회">
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</form>
</body>
</html>
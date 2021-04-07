<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<div class="container">
	<p>인사관리 메인메뉴</p>
	<div class="button_box">
		<a href="search.jsp"><button>조회</button></a> 
		<a href="insert.jsp"><button>사원등록</button></a> 
		<a href="update.jsp"><button>정보변경</button></a> 
		<a href="fire.jsp"><button>퇴사처리</button></a>
		<a href="javascript:self.close();"><button>종료</button></a>
	</div>
</div>
<%@ include file="footer.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<jsp:include page="header.jsp"></jsp:include>

	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.selectMembers();
	%>

	<section>
		<h2>회원목록조회/수정</h2>
		
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>통신사</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++) {
					MemberVO vo = list.get(i);
					String grade = "";
					String city = "";
					
					switch(vo.getGrade()) {
						case "A" : grade = "VIP";
						break;
						case "B" : grade = "일반";
						break;
						case "C" : grade = "직원";
						break;
					}
					
					switch(vo.getCity()) {
					case "01" : city = "서울";
					break;
					case "10" : city = "인천";
					break;
					case "20" : city = "성남";
					break;
					case "30" : city = "대전";
					break;
					case "40" : city = "광주";
					break;
					case "60" : city = "부산";
					break;
				}
					
					SimpleDateFormat format = new SimpleDateFormat("YYYY년 MM월 dd일");
					String date = format.format(vo.getJoindate());
			%>
					<tr>
						<td><a href="update.jsp?custno=<%=vo.getCustno() %>"><%=vo.getCustno() %></a></td>
						<td><%=vo.getCustname() %></td>
						<td><%=vo.getPhone() %></td>
						<td><%=vo.getAddress() %></td>
						<td><%=date %></td>
						<td><%=grade %></td>
						<td><%=city %></td>
					</tr>
			<%		
				}
			%>
		</table>
	</section>

<jsp:include page="footer.jsp"></jsp:include>
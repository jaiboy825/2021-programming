<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.PriceVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.*"%>

<jsp:include page="header.jsp"></jsp:include>

	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<PriceVO> list = dao.getPrice();
		
		
	%>

	<section>
		<h2>회원매출조회</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			
			<%
				for (int i = 0; i < list.size(); i++) {
					PriceVO vo = list.get(i);
					String grade = "";
					
					switch(vo.getGrade()) {
						case "A" : grade = "VIP";
						break;
						case "B" : grade = "일반";
						break;
						case "C" : grade = "직원";
						break;
					}
					
					DecimalFormat formater = new DecimalFormat("###,###");
			%>
					<tr>
						<td><%=vo.getCustno() %></td>
						<td><%=vo.getCustname() %></td>
						<td><%=grade %></td>
						<td><%=formater.format(vo.getPrice()) %></td>
					</tr>
			<%	
				}
			%>
		</table>
	</section>
	
<jsp:include page="footer.jsp"></jsp:include>
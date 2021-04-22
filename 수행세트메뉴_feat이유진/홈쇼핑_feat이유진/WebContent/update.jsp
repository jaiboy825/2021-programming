<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.*"%>

<jsp:include page="header.jsp"></jsp:include>

	<%
		int custno = Integer.parseInt(request.getParameter("custno"));
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.selectMember(custno);
	%>

	<section>
		<form action="updateProc.jsp">
			<table border="1" >
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=vo.getCustno() %>" readonly></td>
				</tr>
				
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=vo.getCustname() %>"></td>
				</tr>
				
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=vo.getPhone() %>" ></td>
				</tr>
					
				<tr>
					<td>통신사[SK, KT, LG]</td>
					<td>
						<%
							if (vo.getAddress().equals("SK")) {
						%>
								<input type="radio" name="address" value="SK" checked> SK
								<input type="radio" name="address" value="KT"> KT
								<input type="radio" name="address" value="LG"> LG
						<%		
							} else if (vo.getAddress().equals("KT")) {
						%>
								<input type="radio" name="address" value="SK"> SK
								<input type="radio" name="address" value="KT" checked> KT
								<input type="radio" name="address" value="LG"> LG
						<%	
							} else {
						%>
								<input type="radio" name="address" value="SK"> SK
								<input type="radio" name="address" value="KT"> KT
								<input type="radio" name="address" value="LG" checked> LG
						<%	
							}
						%>
						
					</td>
				</tr>
				
				<tr>
					<td>가입날자</td>
					<td><input type="text" name="joindate" value="<%=vo.getJoindate() %>" disabled"></td>
				</tr>
				
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td>
						<select name="grade">
							<%
								if (vo.getGrade().equals("A")) {
							%>
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
							<%		
								} else if (vo.getGrade().equals("B")) {
							%>
									<option value="A">A</option>
									<option value="B" selected>B</option>
									<option value="C">C</option>
							<%	
								} else {
							%>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C" selected>C</option>
							<%	
								}
							%>
							
						</select>
					</td>
				</tr>
				
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=vo.getCity() %>" ></td>
				</tr>
				
				<tr >
					<td><input type="submit" value="수정"></td>
					<td><a href="select.jsp">조회</a></td>
				</tr>
			</table>
		</form>
	</section>
	
<jsp:include page="footer.jsp"></jsp:include>
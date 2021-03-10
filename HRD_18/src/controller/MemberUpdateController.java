package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVO;

public class MemberUpdateController implements Controller{
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
					int custno = Integer.parseInt(req.getParameter("custno"));
					String custname = req.getParameter("custname");
					String phone = req.getParameter("phone");
					String address = req.getParameter("address");
					Date joindate = Date.valueOf(req.getParameter("joindate"));
					String grade = req.getParameter("grade");
					String city = req.getParameter("city");

					MemberVO member = new MemberVO();
					
					MemberDao dao = new MemberDao();
					member.setCustno(custno);
					member.setCustname(custname);
					member.setPhone(phone);
					member.setAddress(address);
					member.setJoindate(joindate);
					member.setGrade(grade);
					member.setCity(city);
					int n = dao.updateMember(member);
					
					if(n > 0) {
						req.setAttribute("ok", "회원정보수정 완료 되었습니다!");
						req.getRequestDispatcher("/update.jsp").forward(req, resp);
						
					}else {
						req.setAttribute("error", "회원정보수정 중복 오류 입니다.");
						req.getRequestDispatcher("/update.jsp").forward(req, resp);
					}

			
		
	}
	
}

package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVO;

public class InsertController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int custno = Integer.parseInt( req.getParameter("custno"));
		String custname = req.getParameter("custname");
		Date joindate = Date.valueOf(req.getParameter("joindate"));
		String grade = req.getParameter("grade");
		String address =req.getParameter("address");
		if(custname.length() > 3) {
			req.setAttribute("error", "다시 입력해주세요");
			req.getRequestDispatcher("/insert.jsp").forward(req, resp);
		}
		
		MemberVO vo = new MemberVO();
		vo.setCustno(custno);
		vo.setCustname(custname);
		vo.setAddress(address);
		vo.setGrade(grade);
		vo.setJoindate(joindate);
		
		MemberDao dao = new MemberDao();
		
		int n = dao.insertInfo(vo);
		
		if(n > 0) {
			req.setAttribute("ok", "회원등록이 완료 되었습니다!");
			req.getRequestDispatcher("/insert.jsp").forward(req, resp);
			
		}else {
			req.setAttribute("error", "등록 오류 입니다.");
			req.getRequestDispatcher("/insert.jsp").forward(req, resp);
		}
	}

}
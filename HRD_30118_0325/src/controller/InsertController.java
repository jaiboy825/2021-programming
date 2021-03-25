package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

public class InsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int empno = Integer.parseInt(req.getParameter("empno"));
		String empname = req.getParameter("empname");
		Date joindate = Date.valueOf(req.getParameter("joindate"));
		String grade = req.getParameter("grade");
		String dept = req.getParameter("dept");

		MemberVO vo = new MemberVO();
		vo.setEmpno(empno);
		vo.setEmpname(empname);
		vo.setJoindate(joindate);
		vo.setGrade(grade);
		vo.setDept(dept);

		MemberDAO dao = new MemberDAO();

		int n = dao.insertUser(vo);

		if (n > 0) {
			req.setAttribute("ok", "회원등록이 완료 되었습니다!");
			req.getRequestDispatcher("/insert.jsp").forward(req, resp);

		} else {
			req.setAttribute("error", "등록 오류 입니다.");
			req.getRequestDispatcher("/insert.jsp").forward(req, resp);
		}

	}

}

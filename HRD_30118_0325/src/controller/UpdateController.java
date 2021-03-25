package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

public class UpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int empno = Integer.parseInt(req.getParameter("empno"));
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getUserInfo(empno);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/update.jsp").forward(req, resp);
	}

}

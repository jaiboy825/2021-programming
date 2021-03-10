package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVO;

public class MemberInfoController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int custno = Integer.parseInt(req.getParameter("custno"));
		MemberDao dao = new MemberDao();
		MemberVO vo = dao.getInfo(custno);
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/update.jsp").forward(req, resp);

	}

}

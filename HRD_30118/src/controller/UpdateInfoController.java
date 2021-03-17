package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVO;

public class UpdateInfoController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		int custno = Integer.parseInt(req.getParameter("custno"));
		MemberVO vo = dao.getUserInfo(custno);
		if(vo != null) {
			req.setAttribute("info", vo);
		}else {
			req.setAttribute("error", "에러");
		}
		req.getRequestDispatcher("/update.jsp").forward(req, resp);
	}

}
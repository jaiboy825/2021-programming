package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVO;

public class MemberListController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		MemberDao dao = new MemberDao();
		ArrayList<MemberVO> list = dao.getList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/list.jsp").forward(req, resp);

	}

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberBookVO;


public class StatusController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		List<MemberBookVO> mlist = dao.getMStatusList();
		List<MemberBookVO> blist = dao.getBStatusList();
		req.setAttribute("mlist", mlist);
		req.setAttribute("blist", blist);
		req.getRequestDispatcher("/now.jsp").forward(req, resp);
	}

}
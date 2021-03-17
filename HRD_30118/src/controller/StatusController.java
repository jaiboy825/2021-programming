package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.BookStatusVO;
import vo.MemberStatusVO;

public class StatusController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		List<MemberStatusVO> mlist = dao.getMStatusList();
		List<BookStatusVO> blist = dao.getBStatusList();
		if (mlist != null && blist != null ) {
			
		}
	}

}
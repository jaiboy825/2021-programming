package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberPriceVO;

public class MemberPriceController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		MemberDao dao = new MemberDao();
		ArrayList<MemberPriceVO> list = dao.getMoneyList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/memberPrice.jsp").forward(req, resp);

	}

}

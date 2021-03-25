package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberPriceVO;

public class SearchController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberPriceVO> vo = dao.getPrice();
		
		req.setAttribute("vo",vo);
		req.getRequestDispatcher("/search.jsp").forward(req, resp);
	}

}

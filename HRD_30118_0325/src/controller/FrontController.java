package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "front", urlPatterns = { "*.do" })
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     String charset = null;
     HashMap<String, Controller> list = null;
    public FrontController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
		
		list = new HashMap<String, Controller>();
		list.put("/insert.do", new InsertController());
		list.put("/list.do", new ListController());
		list.put("/updateInfo.do", new UpdateController());
		list.put("/update.do", new UpdateGoController());
		list.put("/search.do", new SearchController());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(charset);
		
		String url = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String path = url.substring(contextPath.length());
		
		Controller subController = list.get(path);
		subController.execute(request, response);
	}

}
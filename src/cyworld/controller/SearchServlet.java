package cyworld.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.User;
import net.arnx.jsonic.JSON;
import net.arnx.jsonic.JSONReader;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String REQUEST_STRING = "requestJs";

	public SearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		System.out.println("SearchServlet RUN");
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("keyworld");
		User user = new User();
		List<User> uList = user.getUserList(key);
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("uList", key);
		request.getRequestDispatcher("search.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

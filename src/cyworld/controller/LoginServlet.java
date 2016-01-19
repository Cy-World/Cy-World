package cyworld.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// sessionの取得
		HttpSession session = request.getSession();

		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		User user = new User();
		if (user.loginAuth(address, passwd)) {
			System.out.println("LOGIN");
			session.setAttribute("loginUser", user);
			session.setAttribute("stats", "LOGIN");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			System.out.println("BAT");
			session.setAttribute("stats", "LOGIN_INCORRECT");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

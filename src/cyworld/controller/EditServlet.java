package cyworld.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cyworld.model.User;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession();
		System.out.println("UserEditServlert start");
		User user = (User) httpSession.getAttribute("loginUser");

		String authAddress = user.getAddress();
		String name = request.getParameter("name");
		String address = request.getParameter("mail");
		String passwd = user.getPasswd();
		String id = user.getUserID();
		user.updateUser(address, passwd, name, id, authAddress);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

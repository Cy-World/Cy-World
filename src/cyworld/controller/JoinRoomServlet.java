package cyworld.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.RoomBean;
import cyworld.model.User;

/**
 * Servlet implementation class JoinRoomServlet
 */
@WebServlet("/JoinRoomServlet")
public class JoinRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		session.setAttribute("joinRoom", new RoomBean(request.getParameter("roomid")));
		User user = new User();
		user = (User) session.getAttribute("loginUser");
		if (new RoomBean(request.getParameter("roomid")).chekRoom(user.getUserID())) {
			System.out.println("部屋に参加しています！！");
			request.getRequestDispatcher("StormingServlet").include(request, response);
			request.getRequestDispatcher("storming.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("myPage.jsp").forward(request, response);
			System.out.println("部屋に参加していません！！");
		}
		//request.getRequestDispatcher("StormingServlet").include(request, response);
		//request.getRequestDispatcher("storming.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

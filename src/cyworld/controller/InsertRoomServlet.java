package cyworld.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.DBHelper;
import cyworld.model.RoomBean;
import cyworld.model.User;

/**
 * Servlet implementation class InsertRoomServlet
 */
@WebServlet("/InsertRoomServlet")
public class InsertRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InsertRoomServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = new User();
		String roomid =(String) session.getAttribute("roomid");
		user = (User) session.getAttribute("loginUser");
		if (new RoomBean(roomid).InsertRoom(user.getUserID())) {
			request.getRequestDispatcher("StormingServlet").include(request, response);
			request.getRequestDispatcher("storming.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

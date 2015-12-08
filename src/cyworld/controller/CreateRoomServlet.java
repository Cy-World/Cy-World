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

@WebServlet("/CreateRoomServlet")
public class CreateRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		String roomName = request.getParameter("roomName");
		String comment = request.getParameter("comment");
		byte roomConf = Byte.parseByte(request.getParameter("roomConf"));

		RoomBean room = RoomBean.roomCreate(roomName, comment, roomConf,user.getUserID());
		session.setAttribute("joinRoom", room);
		request.getRequestDispatcher("storming.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

package cyworld.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cyworld.model.RoomBean;
import cyworld.model.User;

/**
 * Servlet implementation class StormingServlet
 */
@WebServlet("/StormingServlet")
public class StormingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		RoomBean joinRoom=(RoomBean)session.getAttribute("joinRoom");
		List<User> joinUserList = User.getRoomMember(joinRoom.getRoomID());
		session.setAttribute("joinUserList",joinUserList);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

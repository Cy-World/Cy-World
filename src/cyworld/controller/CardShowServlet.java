package cyworld.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.RoomBean;
import cyworld.model.TicketBean;

/**
 * Servlet implementation class CardShowServlet
 */
@WebServlet("/CardShowServlet")
public class CardShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//参加中のRoom取得
		HttpSession session = request.getSession();
		RoomBean joinRoom=(RoomBean)session.getAttribute("joinRoom");
		//エンコーディング
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		
		//参加中のRoomのTicketを送信
		PrintWriter out = response.getWriter();
		out.print(TicketBean.getTicketBeans(joinRoom.getRoomID()));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

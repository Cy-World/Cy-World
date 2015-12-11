package cyworld.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cyworld.model.RoomBean;
import cyworld.model.TicketBean;

@WebServlet("/cardaddServlet")
public class cardaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;chaset=utf-8");
		HttpSession session = request.getSession();
		RoomBean room =(RoomBean)session.getAttribute("joinRoom");
		if(room!=null){
			TicketBean.ticketAdd(request.getParameter("idea"),room.getRoomID());
			PrintWriter out = response.getWriter();
			out.print(TicketBean.getTicketBeans(room.getRoomID()));		
		}else{
			request.getRequestDispatcher("LogoutServlet").forward(request, response);
		}
		request.getRequestDispatcher("storming.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

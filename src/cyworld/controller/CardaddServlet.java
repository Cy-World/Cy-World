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

@WebServlet("/CardaddServlet")
public class CardaddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("chaset=utf-8");
		
		HttpSession session = request.getSession();
		RoomBean room =(RoomBean)session.getAttribute("joinRoom");
		String carddata=request.getParameter("carddata");
		String callback=request.getParameter("callback");
		if(room!=null){
			TicketBean.ticketAdd(carddata,room.getRoomID());
			PrintWriter out = response.getWriter();
			System.out.println(callback+"("+carddata+")");
			out.println(callback+"("+carddata+")");		
		}else{
			request.getRequestDispatcher("LogoutServlet").forward(request, response);
		}
		
		request.getRequestDispatcher("storming.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

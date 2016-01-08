package cyworld.android;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cyworld.model.TicketBean;
import net.arnx.jsonic.JSON;

public class TicketGetServlet extends HttpServlet {

	PrintWriter out;
	String json;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String roomId = req.getParameter("roomId");
		TicketBean ticket = new TicketBean();
		
		out = resp.getWriter();
		out.print(ticket.getTicketBeans(roomId));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}

}

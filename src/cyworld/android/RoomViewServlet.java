package cyworld.android;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Array;

import cyworld.model.RoomBean;
import net.arnx.jsonic.JSON;

@WebServlet("/RoomViewServlet")
public class RoomViewServlet extends HttpServlet {

	List<RoomBean> roomList;
	String json;
	PrintWriter out;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userId = req.getParameter("userId");
		out = resp.getWriter();
		
		roomList = RoomBean.getRoomList(userId);
		json = JSON.encode(roomList);
		out.print(json);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}

}

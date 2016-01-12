package cyworld.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.fabric.xmlrpc.base.Array;

import cyworld.model.User;
import net.arnx.jsonic.JSON;
import net.arnx.jsonic.JSONReader;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String REQUEST_STRING = "requestJs";


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("SearchServlet RUN");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		User user = new User();
		user = user.getUserInfo(id);
		session.setAttribute("userInfo", user);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append("<br>name" + id);
		request.getRequestDispatcher("/prof.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

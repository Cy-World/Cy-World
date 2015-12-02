package cyworld.android;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cyworld.model.User;

@WebServlet("/AndroidLoginServlet")
public class AndroidLoginServlet extends HttpServlet{
	
	PrintWriter out;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");
		User user = new User();
		out = response.getWriter();
		if(user.loginAuth(address, passwd)){
			out.println("True");
		}else{
			out.println("False");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

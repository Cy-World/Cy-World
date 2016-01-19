package cyworld.android;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cyworld.model.User;
import net.arnx.jsonic.JSON;

@WebServlet("/AndroidLoginServlet")
public class AndroidLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	String json;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String address = request.getParameter("address");
		String passwd = request.getParameter("passwd");

		User user = new User();
		out = response.getWriter();

		if (user.loginAuth(address, passwd)) {
			json = JSON.encode(user);
			out.print(json);
		} else {
			out.print("False");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
		resp.setCharacterEncoding("UTF-8");
	}

}

package cyworld.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

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
		//エンコーディング
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		//セッション取得
		HttpSession session = request.getSession();
		//参加中の部屋を取得
		RoomBean room=(RoomBean) session.getAttribute("joinRoom");
		//部屋情報があるか確認、なければログアウト
		if(room!=null){
			//jsから送られてきたデータを取得
			String carddata = URLDecoder.decode(request.getParameter("carddata"),"utf-8");
			System.out.println(carddata+"を取得しました");
			//Ticketテーブルに行を追加
			TicketBean.ticketAdd(carddata, room.getRoomID());
			//jsへ返信
			String responseJson = "{\"responseMessage\" : \""+carddata+"\"}";
			PrintWriter out = response.getWriter();
			out.print(responseJson);
		}else{
			request.getRequestDispatcher("LogoutServlet").forward(request, response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

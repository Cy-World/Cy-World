package cyworld.model;

import java.sql.ResultSet;

public class TicketBean {
	private String ticketData;
	private String ticketID;
	private String roomID;
	//参加中の部屋のTicketBeanのJsonパース
	public String getTicketBeans(String roomID){
		DBHelper helper = new DBHelper();
		helper.openDB();
		ResultSet rs=helper.selectSQL("select * from Ticket where RoomID='"+roomID+"';");
		JSON
	}
	public String getTicketData() {
		return ticketData;
	}
	public String getTicketID() {
		return ticketID;
	}
	public String getRoomID() {
		return roomID;
	}

}

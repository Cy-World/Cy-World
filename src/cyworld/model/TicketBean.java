package cyworld.model;

import java.sql.ResultSet;
import java.util.HashMap;

import net.arnx.jsonic.JSON;

public class TicketBean {
	private String ticketData;
	private String ticketID;
	private String roomID;
	//参加中の部屋のTicketBeanのJsonパース
	public static String getTicketBeans(String roomID){
		DBHelper helper = new DBHelper();
		helper.openDB();
		HashMap<String,String> ticketMap = new HashMap<>();
		try {
			ResultSet rs=helper.selectSQL("select TicketData,TicketID from Ticket where RoomID='"+roomID+"';");
			while(rs.next()){
				ticketMap.put(rs.getString("TicketID"),rs.getString("TicketData"));
			}
			helper.closeDB();
		} catch (Exception e) {
			e.printStackTrace();
			helper.closeDB();
			return null;
		}
		return JSON.encode(ticketMap);
	}
	public static boolean ticketAdd(String ticketData,String roomID){
		DBHelper helper = new DBHelper();
		helper.openDB();
		helper.insertSQL("INSERT INTO Ticket(TicketData,RoomID) "
				+ "VALUES('"+ticketData+"','"+roomID+"');");
		helper.closeDB();
		return false;
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

package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class RoomBean {
	private String roomID;
	private String roomName;
	private String comment;
	private byte flag = 0;

	public static RoomBean roomCreate(String name, String comment, byte roomConf) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();

		Random random = new Random();
		String ID = "P";
		// Random重複防止用ループ
		int randInt = 0;
		int loopcnt = 0;// ループ回数の制限
		do {
			loopcnt++;
			if (loopcnt > 5)
				break;
			randInt = random.nextInt(99999999);
			ID = ID + RandomStringUtils.randomAscii(9);
		} while (dbHelper.existsSQL("Room", "RoomID", "RoomID LIKE '_" + randInt + "'"));// 存在チェック

		System.out.println(loopcnt);
		String sql = String.format("INSERT INTO Room(RoomID,RoomName,Comment,Flag) VALUES('%s','%s','%s',%d);", ID,
				name, comment, roomConf);
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
		return new RoomBean(ID, name, comment, roomConf);
	}

	private RoomBean(String roomID, String name, String comment, byte roomConf) {
		this.roomID = roomID;
		this.roomName = name;
		this.comment = comment;
		this.flag = roomConf;
	}
	
	public static ArrayList<RoomBean> privateRoomView(String address){
//		ArrayList<RoomBean> roomData = new ArrayList<>();
//		String sql = String.format("SELECT RoomName,Comment FROM "
//				+ "Room JOIN JoinInfo ON Room.RoomID = JoinInfo.RoomID"
//				+ "JOIN User ON User.UserID = JoinInfo.UserID"
//				+ " WHERE MailAddress=%s AND Flag = '1'", address);
//		DBHelper helper = new DBHelper();
//		helper.openDB();
//		
//		ResultSet rs = helper.selectSQL(sql);
//		
//		try {
//			while(rs.next()){
//				RoomBean bean = new RoomBean(rs.getString("roomID"),
//											 rs.getString("RoomName"), 
//						                     rs.getString("Comment"), 
//						                     (Byte)null);
//				roomData.add(bean);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		helper.closeDB();
//		return roomData;
		return getRoomList(1);
	}
	
	public static ArrayList<RoomBean> publicRoomView(){
//		ArrayList<RoomBean> roomData = new ArrayList<>();
//		String sql ="SELECT RoomName,Comment FROM "
//				+ "Room JOIN JoinInfo ON Room.RoomID = JoinInfo.RoomID"
//				+ " WHERE Flag = '0'";
//		DBHelper helper = new DBHelper();
//		helper.openDB();
//		
//		ResultSet rs = helper.selectSQL(sql);
//		
//		try {
//			while(rs.next()){
//				RoomBean bean = new RoomBean(rs.getString("roomID"),
//											 rs.getString("RoomName"), 
//						                     rs.getString("Comment"), 
//						                     (Byte)null);
//				roomData.add(bean);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		helper.closeDB();
		return getRoomList(0);
	}
	private static ArrayList<RoomBean> getRoomList(int flag){
		//0=public 1=private
		ArrayList<RoomBean> roomData = new ArrayList<>();
		String sql ="SELECT RoomName,Comment FROM "
				+ "Room JOIN JoinInfo ON Room.RoomID = JoinInfo.RoomID"
				+ " WHERE Flag = '"+flag+"'";
		DBHelper helper = new DBHelper();
		helper.openDB();
		
		ResultSet rs = helper.selectSQL(sql);
		
		try {
			while(rs.next()){
				RoomBean bean = new RoomBean(rs.getString("roomID"),
											 rs.getString("RoomName"), 
						                     rs.getString("Comment"), 
						                     (Byte)null);
				roomData.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		helper.closeDB();
		return roomData;
	}
	public String getRoomID() {
		return roomID;
	}

	public String getRoomName() {
		return roomName;
	}

	public String getComment() {
		return comment;
	}

	public short getFlag() {
		return flag;
	}

}

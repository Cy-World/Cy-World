package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
	
	public static List<RoomBean> getRoomList(String LoginUser){
		ArrayList<RoomBean> roomData = new ArrayList<>();
		String sql ="SELECT * FROM Room WHERE exist "
				+ "(SELECT RoomID FROM JoinInfo WHERE JoinInfo.UserID = '"+LoginUser+"')";
		DBHelper helper = new DBHelper();
		helper.openDB();
		
		ResultSet rs = helper.selectSQL(sql);
		
		try {
			while(rs.next()){
				RoomBean bean = new RoomBean(rs.getString("RoomID"),
											 rs.getString("RoomName"), 
						                     rs.getString("Comment"), 
						                     Byte.parseByte(rs.getString("Flag")));
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

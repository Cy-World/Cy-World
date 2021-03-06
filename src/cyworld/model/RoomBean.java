package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.RandomStringUtils;

public class RoomBean {
	private String roomID;
	private String roomName;
	private String comment;
	private byte flag = 0;

	// Insert Room and JoinInfo
	public static RoomBean roomCreate(String name, String comment, byte roomConf, String userID) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();

		String roomID = "P";
		// Random重複防止用ループ
		String randID;
		int loopcnt = 0;// ループ回数の制限
		do {
			loopcnt++;
			if (loopcnt > 5)
				break;
			randID = RandomStringUtils.randomAlphanumeric(9);
			roomID = roomID + randID;
		} while (dbHelper.existsSQL("Room", "RoomID LIKE '_" + randID + "'"));// 存在チェック

		System.out.println(loopcnt);
		String sql = String.format("INSERT INTO Room(RoomID,RoomName,Comment,Flag) VALUES('%s','%s','%s',%d);", roomID,
				name, comment, roomConf);
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
		sql = String.format("INSERT INTO JoinInfo(UserID,RoomID) VALUES(%s,'%s');", userID, roomID);
		joinInfoCreate(sql);
		return new RoomBean(roomID, name, comment, roomConf);
	}

	// Insert JpinInfo
	private static void joinInfoCreate(String sql) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
	}

	// setRoomBean
	private RoomBean(String roomID, String name, String comment, byte roomConf) {
		this.roomID = roomID;
		this.roomName = name;
		this.comment = comment;
		this.flag = roomConf;
	} // setRoomBean

	public RoomBean(String roomID) {
		this.roomID = roomID;
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL("SELECT * FROM Room WHERE Room.RoomID='" + roomID + "'");
		try {
			rs.next();
			this.roomName = rs.getString("RoomName");
			this.comment = rs.getString("Comment");
			this.flag = Byte.parseByte(rs.getString("Flag"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dbHelper.closeDB();
	}

	// getPrf Roomlist
	public static List<RoomBean> getProfRoomList(String LoginUser) {
		ArrayList<RoomBean> roomData = new ArrayList<>();
		// String sql2 = "SELECT * FROM Room WHERE exists " + "(SELECT RoomID
		// FROM JoinInfo WHERE JoinInfo.UserID = '"
		// + LoginUser + "');";
		System.out.println("GET ROOM LIST USER ID :" + LoginUser);
		String sql = String.format(
				"SELECT  Room.RoomID,Room.RoomName,Room.Comment,Room.Flag FROM Room,JoinInfo WHERE Room.RoomID=JoinInfo.RoomID AND JoinInfo.UserID = '%s' AND Room.Flag = 0;",
				LoginUser);
		System.out.println("SQL : " + sql);
		DBHelper helper = new DBHelper();
		helper.openDB();

		ResultSet rs = helper.selectSQL(sql);

		try {
			while (rs.next()) {
				RoomBean bean = new RoomBean(rs.getString("RoomID"), rs.getString("RoomName"), rs.getString("Comment"),
						Byte.parseByte(rs.getString("Flag")));
				roomData.add(bean);
			}
		} catch (SQLException e) {
			helper.closeDB();
			e.printStackTrace();
		}
		helper.closeDB();
		return roomData;
	}

	// Get RoomList
	public static List<RoomBean> getRoomList(String LoginUser) {
		ArrayList<RoomBean> roomData = new ArrayList<>();
		// String sql2 = "SELECT * FROM Room WHERE exists " + "(SELECT RoomID
		// FROM JoinInfo WHERE JoinInfo.UserID = '"
		// + LoginUser + "');";
		System.out.println("GET ROOM LIST USER ID :" + LoginUser);
		String sql = String.format(
				"SELECT  Room.RoomID,Room.RoomName,Room.Comment,Room.Flag FROM Room,JoinInfo WHERE Room.RoomID=JoinInfo.RoomID AND JoinInfo.UserID = '%s';",
				LoginUser);
		System.out.println("SQL : " + sql);
		DBHelper helper = new DBHelper();
		helper.openDB();

		ResultSet rs = helper.selectSQL(sql);

		try {
			while (rs.next()) {
				RoomBean bean = new RoomBean(rs.getString("RoomID"), rs.getString("RoomName"), rs.getString("Comment"),
						Byte.parseByte(rs.getString("Flag")));
				roomData.add(bean);
			}
		} catch (SQLException e) {
			helper.closeDB();
			e.printStackTrace();
		}
		helper.closeDB();
		return roomData;
	}

	// なぜか動く
	public boolean chekRoom(String userID) {
		// this.roomID;
		String sql = String.format(
				"SELECT * FROM User,JoinInfo WHERE User.UserID=JoinInfo.UserID AND JoinInfo.RoomID = '%s' AND User.UserID = %s",
				this.roomID, userID);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		System.out.println(sql);
		ResultSet rs = dbHelper.selectSQL(sql);
		try {
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
		} finally {
			dbHelper.closeDB();
		}
		dbHelper.closeDB();
		return false;
	}

	public boolean InsertRoom(String userID) {
		String sql = String.format("INSERT INTO JoinInfo VALUES(0,'%s','%s')", userID, this.roomID);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
		return true;

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

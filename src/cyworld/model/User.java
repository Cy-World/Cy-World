package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {
	private String userID;
	private String name;
	private String address;
	private String passwd;
	private String imgPath;

	public String getUserID() {
		return userID;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getPasswd() {
		return passwd;
	}

	public String getImgPath() {
		return imgPath;
	}

	public static User getUserInfo(String userID) {
		String sql = String.format("SELECT * FROM User WHERE UserID = '%s';", userID);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(sql);
		User user = new User();
		try {
			if (rs != null) {
				while (rs.next()) {
					user.userID = rs.getString("UserID");
					user.name = rs.getString("UserName");
					user.address = rs.getString("MailAddress");
					user.imgPath = rs.getString("ImgPath");
				}
			}
			dbHelper.closeDB();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.closeDB();
		}
		return user;

	}

	public List<User> getUserList(String key1) {
		System.out.println("SEARCH");
		System.out.println(key1);
		DBHelper dbHelper = new DBHelper();
		String sql = String.format("SELECT * FROM User WHERE UserName LIKE '%s%%'", key1);

		System.out.println(sql);
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(sql);
		List<User> userList = new ArrayList<>();
		try {
			if (rs != null) {
				while (rs.next()) {
					User user = new User();
					user.userID = rs.getString("UserID");
					user.name = rs.getString("UserName");
					user.address = rs.getString("MailAddress");
					user.imgPath = rs.getString("ImgPath");
					System.out.println(user.name);
					userList.add(user);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
			dbHelper.closeDB();

		} finally {
			dbHelper.closeDB();
		}

		return userList;
	}

	public static List<User> getRoomMember(String roomID) {

		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(
				"SELECT * FROM User WHERE User.UserID=JoinInfo.UserID AND JoinInfo.RoomID = '" + roomID + "')");
		List<User> roomMember = new ArrayList<>();
		try {
			if (rs != null)
				while (rs.next()) {
					User joinUser = new User();
					joinUser.userID = rs.getString("UserID");
					joinUser.address = rs.getString("MailAddress");
					joinUser.name = rs.getString("UserName");
					System.out.println(joinUser.name);
					roomMember.add(joinUser);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbHelper.closeDB();
		}
		return roomMember;
	}

	public static void createUser(String name, String address, String passwd) {
		String sql = String.format("INSERT INTO User VALUES(0,'%s','%s','%s','%s',0);", passwd, address, name, address);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
	}

	public boolean loginAuth(String address, String passwd) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		if (dbHelper.existsSQL("User", "MailAddress",
				String.format("User.Password = '%s' and User.MailAddress = '%s'", passwd, address))) {
			dbHelper.closeDB();
			if (!setUserData(address)) {
				return false;
			}
			return true;

		} else {
			dbHelper.closeDB();
			return false;
		}
	}

	public boolean updateUser(String address, String passwd, String name, String id, String auth) {
		this.address = address;
		this.passwd = passwd;
		this.name = name;
		this.imgPath = address;
		String sql = String.format(
				"UPDATE User SET Password='%s',MailAddress='%s',UserName='%s',ImgPath='%s' WHERE MailAddress='%s';",
				passwd, address, name, id, auth);
		System.out.println(sql);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		int upCount = 0;
		if (upCount < dbHelper.updateSQL(sql)) {
			dbHelper.closeDB();
			return true;
		}
		dbHelper.closeDB();
		return false;
	}

	public boolean setUserData(String address) {
		String sql = String.format("SELECT * FROM User WHERE MailAddress='%s'", address);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(sql);
		try {
			while (rs.next()) {
				this.userID = rs.getString("UserID");
				this.passwd = rs.getString("Password");
				this.address = rs.getString("MailAddress");
				this.name = rs.getString("UserName");
				this.imgPath = rs.getString("ImgPath");
				System.out.println("--------------------");
				System.out.println(this.userID);
				System.out.println(this.passwd);
				System.out.println(this.address);
				System.out.println(this.name);
				System.out.println(this.imgPath);
			}
		} catch (SQLException e) {
			dbHelper.closeDB();
			e.printStackTrace();
			return false;
		}
		dbHelper.closeDB();
		return true;
	}

	// TEST RUN
	private void testRun(DBHelper dbHelper, String sql) {
		sql = "SELECT * from User";
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(sql);
		try {
			while (rs.next()) {
				System.out.println("------------------------------------");
				System.out.println("UserID : " + rs.getString("UserID"));
				System.out.println("Name : " + rs.getString("UserName"));
				System.out.println("Passwd : " + rs.getString("Password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			dbHelper.closeDB();
		}
		dbHelper.closeDB();
	}

}

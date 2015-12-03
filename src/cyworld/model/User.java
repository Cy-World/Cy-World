package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	private String userID;
	private String name;
	private String address;
	private String passwd;
	private String imgPath;

	public String userID() {
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

	public void createUser(String name, String address, String passwd) {
		String sql = String.format("INSERT INTO User VALUES(0,'%s','%s','%s','0000.jpg',0);", passwd, address, name);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
	}

	public boolean loginAuth(String address, String passwd) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		if (dbHelper.existsSQL("User","MailAddress",String.format("User.Password = '%s' and User.MailAddress = '%s'",passwd, address))) {
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

	public boolean updateUser(String address, String passwd, String name, String auth) {
		this.address = address;
		this.passwd = passwd;
		this.name = name;
		this.imgPath = address + ".jpg";
		String sql = String.format(
				"UPDATE User SET Password='%s' MailAddress='%s' UserName='%s' ImgPath='%s' WHERE MailAddress='%s';",
				passwd, address, name, address + ".jpg", auth);
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

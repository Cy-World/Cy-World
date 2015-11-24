package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	private String name;
	private String address;
	private String passwd;
	private String imgPath;

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
		// String sql = String.format("INSERT INTO User
		// VALUES('','%s','%s','%s','','0');", passwd, address, name);
		String sql = String.format("INSERT INTO User VALUES(0,'%s','%s','%s','',0);", passwd, address, name);

		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
		testRun(dbHelper, sql);

	}

	public void updateUser() {

	}

	private void testRun(DBHelper dbHelper, String sql) {
		// TEST RUN---
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
		// TEST RUN---

	}

}

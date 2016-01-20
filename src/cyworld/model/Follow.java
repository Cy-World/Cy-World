package cyworld.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Follow {

	private String userID;
	private String followID;

	public String getUserID() {
		return userID;
	}

	public String getFollowID() {
		return followID;
	}

	public static boolean getFollowInfo(String userID, String followID) {
		String sql = String.format("SELECT * FROM Follow WHERE UserID = '%s' AND FollowID = '%s';", userID, followID);
		System.out.println(sql);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		ResultSet rs = dbHelper.selectSQL(sql);
		boolean var = false;
		try {
			if (rs != null) {
				var = rs.next();
				System.out.println(rs.getString("UserID"));
				System.out.println(var);
			}
			dbHelper.closeDB();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbHelper.closeDB();
		}
		return var;

	}

	public static void setFollowID(String userID, String followID) {
		String sql = String.format("INSERT INTO Follow (UserID,FollowID) VALUES('%s','%s');", userID, followID);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		int insertcont = dbHelper.insertSQL(sql);
		System.out.println(insertcont);
		dbHelper.closeDB();
	}
	
	public static void deleteFollowID(String userID, String followID) {
		String sql = String.format("DELETE FROM Follow WHERE UserID='%s' AND FollowID = '%s';", userID, followID);
		System.out.println(sql);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		int count = dbHelper.deleteSQL(sql);
		System.out.println(count);
		dbHelper.closeDB();
	}
}
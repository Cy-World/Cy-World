package cyworld.model;

import java.util.Random;

public class RoomBean {

	public static void room(String name, String comment, int roomConf) {
		Random random = new Random();
		String ID = "P" + random.nextInt(99999999);
		String sql = String.format("INSERT INTO Room VALUES('%s','%s','%s',%d,0);", ID, name, comment,roomConf);
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
	}

}

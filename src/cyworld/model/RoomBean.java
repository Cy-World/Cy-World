package cyworld.model;

import java.util.Random;

public class RoomBean {

	public static void room(String name, String comment, int roomConf) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();
		Random random = new Random();
		String ID = "P";
		int randInt=0;
		int loopcnt=0;
		do{	
			loopcnt++;
			if(loopcnt>99)break;
			randInt=random.nextInt(99999999);
			ID=ID+ randInt;
		}while(dbHelper.existsSQL("LIKE '_"+randInt));
		System.out.println(loopcnt);
		String sql = String.format("INSERT INTO Room VALUES('%s','%s','%s',%d);", ID, name, comment,roomConf);
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
	}

}

package cyworld.model;

import java.util.Random;

public class RoomBean {
	private String roomID;
	private String roomName;
	private String comment;
	private byte flag=0;
	
	public static RoomBean roomCreate(String name, String comment, byte roomConf) {
		DBHelper dbHelper = new DBHelper();
		dbHelper.openDB();

		Random random = new Random();
		String ID = "P";
		//Random重複防止用ループ
		int randInt=0;
		int loopcnt=0;//ループ回数の制限
		do{	
			loopcnt++;
			if(loopcnt>5)break;
			randInt=random.nextInt(99999999);
			ID=ID+ randInt;
		}while(dbHelper.existsSQL("Room","RoomID","RoomID LIKE '_"+randInt+"'"));//存在チェック

		System.out.println(loopcnt);
		String sql = String.format("INSERT INTO Room(RoomID,RoomName,Comment,Flag) VALUES('%s','%s','%s',%d);", ID, name, comment,roomConf);
		dbHelper.insertSQL(sql);
		dbHelper.closeDB();
		return new RoomBean(ID, name, comment, roomConf);
	}	
	private RoomBean(String roomID,String name, String comment, byte roomConf) {
		this.roomID=roomID;
		this.roomName=name;
		this.comment=comment;
		this.flag=roomConf;
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

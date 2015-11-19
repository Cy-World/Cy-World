package cyworld.model;

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
		DBHelper dbHelper = new DBHelper();
		dbHelper.register(name, address, passwd);
		dbHelper.select();
	}

	public void updateUser() {

	}

}

package cyworld.model;

import java.io.File;

public class GetImage {
	public String getImage(User user, String path) {
		String imgPath = "0000.jpg";
		File imgFile = new File(path + "/" + user.getUserID() + "/" + user.getImgPath());

		if (imgFile.exists())
			imgPath = user.getUserID() + "/" + user.getImgPath();
		return imgPath;
	}
}

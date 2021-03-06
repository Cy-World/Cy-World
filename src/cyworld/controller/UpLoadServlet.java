package cyworld.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cyworld.model.User;

/**
 * Servlet implementation class UpLoadServlet
 */
@WebServlet("/UpLoadServlet")
public class UpLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpLoadServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("loginUser");
		upLoad(httpSession, request, user);
		response.setContentType("text/html;charset=utf-8");
		request.getRequestDispatcher("/myPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// UpLoad
	private boolean upLoad(HttpSession httpSession, HttpServletRequest request, User user) {
		String path = getServletContext().getRealPath("img/profilePool");
		// オブジェクト生成
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 基準値
		// factory.setSizeThreshold(1024);
		// upload.setSizeMax(-1);
		// upload.setHeaderEncoding("Windows-31J");
		upload.setHeaderEncoding("UTF-8");
		try {
			List<FileItem> list = upload.parseRequest(request);
			Iterator<FileItem> iterator = list.iterator();
			while (iterator.hasNext()) {
				FileItem item = (FileItem) iterator.next();
				if (!(item.isFormField())) {
					String fileName = item.getName();
					System.out.println("ImageName:" + fileName);
					// null check
					if ((fileName != null) && (!fileName.equals(""))) {
						// cut ext
						String[] fileExt = fileName.split("\\.");
						if (!("png".equals(fileExt[1]) || "jpg".equals(fileExt[1]))) {
							System.out.println("対応されていないファイルです");
							break;
						}

						int len = fileName.length();
						byte[] bytes = fileName.getBytes();
						if (len != bytes.length)
							fileName = "jpFiles." + fileExt[1];

						// delete file
						File imgFile = new File(path + "/" + user.getUserID() + "/" + fileName);
						if (imgFile.exists())
							imgFile.delete();

						// mkdir
						File imgDir = new File(path + "/" + user.getUserID());
						if (!imgDir.exists())
							imgDir.mkdirs();
						String files[] = imgDir.list();
						if (0 < files.length)
							for (String delFile : files) {
								new File(path + "/" + user.getUserID() + "/" + delFile).delete();
							}
						// upLoad
						System.out.println("wite file:" + path + "/" + user.getUserID() + "/" + fileName);
						item.write(new File(path + "/" + user.getUserID() + "/" + fileName));
						String sql = "";
						user.updateImagePath(fileName, user.getUserID());

					}
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}

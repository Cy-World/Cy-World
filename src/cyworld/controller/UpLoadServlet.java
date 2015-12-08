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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("loginUser");
		upLoad(httpSession, request, user);
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
		factory.setSizeThreshold(1024);
		upload.setSizeMax(-1);
		upload.setHeaderEncoding("Windows-31J");
		try {
			List list = upload.parseRequest(request);
			Iterator iterator = list.iterator();
			while (iterator.hasNext()) {
				FileItem item = (FileItem) iterator.next();
				if (!(item.isFormField())) {
					String fileName = item.getName();
					if ((fileName != null) && (!fileName.equals(""))) {
						String[] fileExt = fileName.split("\\.");
						if (!("png".equals(fileExt[1]) || "jpg".equals(fileExt[1]))) {
							break;
						}

						fileName = user.getUserID();
						File jpgFile = new File(path + "/" + fileName + ".jpg");
						File pngFile = new File(path + "/" + fileName + ".png");
						if (jpgFile.exists())
							jpgFile.delete();
						if (pngFile.exists())
							pngFile.delete();
						System.out.println(path + "-->" + fileName + "." + fileExt[1]);
						item.write(new File(path + "/" + fileName + "." + fileExt[1]));
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

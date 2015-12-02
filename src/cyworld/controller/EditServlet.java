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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("loginUser");
		String path = getServletContext().getRealPath("img/profilePool");
		System.out.println("PATH" + path);
		// オブジェクト生成
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		System.out.println("P1");
		// 基準値
		factory.setSizeThreshold(1024);
		upload.setSizeMax(-1);
		upload.setHeaderEncoding("Windows-31J");
		System.out.println("P2");
		try {
			List list = upload.parseRequest(request);
			Iterator iterator = list.iterator();
			System.out.println("P3");
			while (iterator.hasNext()) {
				System.out.println("P4");
				FileItem item = (FileItem) iterator.next();

				if (!(item.isFormField())) {
					System.out.println("P5");
					String fileName = item.getName();
					if ((fileName != null) && (!fileName.equals(""))) {
						System.out.println("P6");
						fileName = user.getAddress();
						item.write(new File(path + "/" + fileName + ".jpg"));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String authAddress = user.getAddress();
		String name = request.getParameter("name");
		String address = request.getParameter("mail");
		String passwd = request.getParameter("passwd");
		user.updateUser(address, passwd, name, authAddress);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

package br.com.ucsal.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadImagemEvento
 */
@WebServlet("/UploadImagemEvento")
public class UploadImagemEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImagemEvento() {
		super();
		// TODO Auto-generated constructor stub
	}

	private static String dirImgEventos;

	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (!ServletFileUpload.isMultipartContent(request)) {

			PrintWriter writer = response.getWriter();
			writer.println("Erro: form errado");
			writer.flush();
			return;

		}

		// System.out.println(request.getContextPath());

		dirImgEventos = "img" + File.separator + "eventos";

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		String uploadPath = getServletContext().getRealPath("") + File.separator + dirImgEventos;
		String id = "";

		// System.out.println(uploadPath);

		try {

			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {

				for (FileItem item : formItems) {
					if (item.isFormField()) {
						id = item.getString();
					}
				}

				uploadPath += File.separator + id;

				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				System.out.println(uploadPath);

				for (FileItem item : formItems) {

					if (!item.isFormField()) {
						String filePath = uploadPath + File.separator + "principal";

						File storeFile = new File(filePath);

						item.write(storeFile);
						request.setAttribute("messagem", "Imagem mudada");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		response.sendRedirect("adm_evento.jsp?id=" + id);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

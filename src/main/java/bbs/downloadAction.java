package bbs;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.multipart.Part;

@WebServlet("/downloadAction")
// Annotation을 통한 파일 크기 및 업로드 위치 지정
@MultipartConfig(maxFileSize = 1024 * 1024 * 100, location = "C:/JSP/upload")
public class downloadAction extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		   throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		javax.servlet.http.Part part = request.getPart("uploadfile");
		
		// 파일 이름 획득
		// fileName = "file_(06250000).exe"
		
		String fileName = request.getParameter("file");
		
		if (fileName.equals("7")) {
			response.getWriter().write("-1");
		} else {
			if (fileName != null && !fileName.isEmpty()) {
				// MultipartConfing location에 filePath로 파일 생성
				// "c:\\JSP\\upload\\file_(06250000).exe"에 저장
				part.write(fileName);
			}
			
		String directory = "C:/JSP/upload";
		 File file = new File(directory + "/" + fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		if (mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
		if (request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		} else {
			downloadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\""
				+ downloadName + "\";");
		
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while ((data = (fileInputStream.read(b, 0, b.length))) != -1) {
			servletOutputStream.write(b, 0, data);
		}
		
		new BbsDAO().hit(fileName);
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}

}

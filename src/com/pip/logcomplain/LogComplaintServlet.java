package com.pip.logcomplain;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import com.pip.logcomplain.LogComplaintServlet;
import com.pip.logcomplain.LogComplaintService;
@WebServlet(urlPatterns="/complain.do" , initParams={@WebInitParam(name="basePath", value="/")})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
	public class LogComplaintServlet extends HttpServlet {
		
		private static final long serialVersionUID = 1L;
		private static final String SAVE_DIR = "uploadFiles";
		@Resource(name = "jdbc/demo1")
	    private DataSource ds;
		Connection conn;
		//private RegistrationService userRegister= new RegistrationService();
		private LogComplaintService lg= new LogComplaintService();
		
		
		private String extractFileExtention(Part part) {
			String contentDisp = part.getHeader("content-disposition");
			String[] items = contentDisp.split(";");
			for (String s : items) {
				if (s.trim().startsWith("filename")) {
					System.out.println("aaaaaa :"+s.substring(s.indexOf(".") , s.length() - 1));
					return s.substring(s.indexOf(".") , s.length() - 1);
				}
			}
			return "";
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String issue_name = request.getParameter("issue-name");
			String issue_desc=request.getParameter("description");
			//String issue_image=SAVE_DIR + File.separator +".jpg";
			String issue_image="";
			
			try {
			String fileName=issue_name;
			issue_image=fileName;
			Part filePart = request.getPart("input-file-preview");
			String str = filePart.getContentType();
			//LOG.info("doPost : File content type : "+str);

			
			// gets absolute path of the web application
			String appPath = request.getServletContext().getRealPath("");
			
			String savePath = appPath + File.separator + SAVE_DIR;

			System.out.println(savePath);

			// creates the save directory if it does not exists
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			for (Part part : request.getParts()) {
				fileName = fileName+extractFileExtention(part);
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				part.write(savePath + File.separator + fileName);
			}
			//LOG.info("doPost : File uploaded sucessfully : "+savePath + File.separator + fileName);
			request.setAttribute("message", "Upload has been done successfully!");
			//LOG.info("doPost : Request from FileUploadServlet to accountUpdate.jsp");
			//request.getRequestDispatcher("home.do").forward(request, response);
				
			
			
			
		} catch (Exception e) {
			//LOG.info("doPost : File upload failed : "+e.getMessage());
			e.printStackTrace();
			request.setAttribute("error", "Upload has error");
			//LOG.info("doPost : Request from FileUploadServlet to accountUpdate.jsp");
			request.getRequestDispatcher("home.do").forward(request, response);
		}

			try
			{
				conn = ds.getConnection();
			}
			catch(SQLException e)
			{
				log(e.getMessage(), e);
			}
			lg.complain(issue_name,issue_desc,issue_image,conn);
			response.sendRedirect("home.do");
			}




}
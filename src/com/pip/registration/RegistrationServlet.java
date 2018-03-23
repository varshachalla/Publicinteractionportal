package com.pip.registration;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;


@WebServlet("/register")
@MultipartConfig(maxFileSize = 16177215)
public class RegistrationServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	private RegistrationService userRegister= new RegistrationService();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("username");
		String password = request.getParameter("psw");
		String email = request.getParameter("email");
		String confirm_password = request.getParameter("re-psw");
		int dept_id=Integer.parseInt(request.getParameter("dept-type"));
		String dept_auth_id=request.getParameter("dept_id");
		String area=request.getParameter("area");
		
		// check if the page has been submitted:
		if (password!=null && confirm_password!=null) {
		    
		   // check if they are equal:
		   if (!password.equals(confirm_password)) {
			   
			   request.setAttribute("error", "Confirmation password did not match");
			   request.getRequestDispatcher("Views/FirstPage.jsp").forward(request, response);
		   }
		 else
		 {
			 try
				{
					conn = ds.getConnection();
				}
				catch(SQLException e)
				{
					log(e.getMessage(), e);
				}
				boolean isUserRegistered=userRegister.isUserRegistered(name,password,email,dept_id,dept_auth_id,area,conn);
				if(isUserRegistered)
				{
					request.setAttribute("error", "User already registered");
					request.getRequestDispatcher("Views/FirstPage.jsp").forward(request, response);
								
				}
				else
				{
					response.sendRedirect("home.do");

				}
			 
		 }
		   
		}
		
}

}

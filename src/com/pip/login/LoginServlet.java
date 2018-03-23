package com.pip.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOG = LoggerFactory.getLogger(LoginServlet.class);
	
	@Resource(name = "jdbc/demo1")
    private DataSource ds;
	Connection conn;
	
   private LoginService userValidation =new LoginService();
   Admin admin=new Admin();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name = request.getParameter("username");
		String password = request.getParameter("psw");
		//LOG.info("doPost : Request from login.jsp to validate login");
		//LOG.trace("Requested User : "+name);
		try
		{
			conn = ds.getConnection();
			
			boolean isAdmin=userValidation.isAdmin(name, password,admin,conn);
			if(isAdmin)
			{
			
				request.getSession().setAttribute("type", "admin");
				request.getSession().setAttribute("name", name);
				request.getSession().setAttribute("id", admin.getId());
				request.getSession().setAttribute("csrfToken", generateCSRFToken());
				String sessionid = request.getSession().getId();
				response.setHeader("Set-Cookie", "JSESSIONID=" +  sessionid + ";");
				//LOG.info("doPost : Redirect from LoginServlet to TodoServlet");
				response.sendRedirect("admin.do");			
				//request.getRequestDispatcher("Views/admin.jsp").forward(request, response);
			}
			else
			{
				boolean isDeptHead=userValidation.isDeptHead(name, password,admin,conn);
				if(isDeptHead)
				{
					String dept_name=userValidation.getDeptName(name, password,admin,conn);
					request.getSession().setAttribute("type", "department");
					request.getSession().setAttribute("department", dept_name);
					request.getSession().setAttribute("name", name);
					request.getSession().setAttribute("id", admin.getId());
					request.getSession().setAttribute("csrfToken", generateCSRFToken());
					String sessionid = request.getSession().getId();
					response.setHeader("Set-Cookie", "JSESSIONID=" +  sessionid + ";");
					response.sendRedirect("deptHead.do");	
					//request.getRequestDispatcher("Views/Department.jsp").forward(request, response);
				}
				else
				{
					System.out.println("invalid");
					request.setAttribute("error", "Invalid credientials");
					request.getRequestDispatcher("Views/FirstPage.jsp").forward(request, response);
				}
			}
		}
		catch(SQLException e)
		{
			log(e.getMessage(), e);
		}
	}
	
	public static String generateCSRFToken() {
		String token = UUID.randomUUID().toString();
		return token;
	}
	
	

}

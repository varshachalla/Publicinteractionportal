package com.pip.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/issueForward.do")
public class IssueForwardServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	 
	 @Resource(name = "jdbc/demo1")
	 private DataSource ds;
	 Connection conn;
	 
	 private AdminService adminService = new AdminService();
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 try
			{
				//LOG.trace("doGet : DBConnection Open");
				conn = ds.getConnection();
				//LOG.info("doGet : Retrive todo list");
				String dept_type=request.getParameter("dept-type");
				int issue_id=Integer.parseInt(request.getParameter("issue_id"));
				adminService.forwardIssue(issue_id,dept_type,conn);
				//LOG.info("doGet : Request from TodoServlet to todoList.jsp");
				request.getRequestDispatcher("admin.do").forward(request, response);

			}
			catch(SQLException e)
			{
				//LOG.error("doGet : Catch block : SQLException : "+e.getMessage());
				log(e.getMessage(), e);
			}
			finally
			{
				try {
					conn.close();
					//LOG.trace("doGet : DBConnection Close");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					//LOG.error("doGet : Finally block : SQLException : "+e.getMessage());
					e.printStackTrace();
				}
			}
			
		}

}

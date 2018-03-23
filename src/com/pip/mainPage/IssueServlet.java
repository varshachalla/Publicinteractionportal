package com.pip.mainPage;

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

@WebServlet("/issues")
public class IssueServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
	 @Resource(name = "jdbc/demo1")
	 private DataSource ds;
	 Connection conn;
	 
	 private IssueService issueService = new IssueService();
	 
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 try
			{
				//LOG.trace("doGet : DBConnection Open");
				conn = ds.getConnection();
				//LOG.info("doGet : Retrive todo list");
				request.setAttribute("issueInbox", issueService.retrieveInbox(conn));
				//LOG.info("doGet : Request from TodoServlet to todoList.jsp");
				request.getRequestDispatcher("Views/issues.jsp").forward(request, response);

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

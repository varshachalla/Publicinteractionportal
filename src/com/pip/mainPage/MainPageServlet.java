package com.pip.mainPage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home.do")
public class MainPageServlet  extends HttpServlet{

	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  System.out.println("mainPage");
		   request.getRequestDispatcher("Views/FirstPage.jsp").forward(request, response);

		}
}

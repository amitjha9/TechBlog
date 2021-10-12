package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@SuppressWarnings("serial")
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userID = request.getParameter("useremail");
		String userPWD = request.getParameter("userpassword");

		//Here create the object of userDao class
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		User usr =userDao.getUserEmailAndPassword(userID, userPWD);
		if(usr==null)
		{

			//Call message class object here to display the login failed message
			//VVI Logic
			Message msg = new Message("Invalid Username or Password...try again","error","alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("message", msg);
			response.sendRedirect("loginpage.jsp");
		}
		else {
			//if user login is getting success , then we will redirect the user to user profile page
			//VVI Logic
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", usr);
			response.sendRedirect("profilepage.jsp");
		}
	}

}

package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String checkbox = request.getParameter("user_check");

		if(checkbox!=null)
		{
			String userName = request.getParameter("user_name");
			String emailID = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userGen = request.getParameter("gender");
			String about = request.getParameter("about");

			//Database code here
			//Create an object of user class here
			User user = new User(userName,emailID,userPassword,userGen,about);

			//Create an object of userDao for creating connection to the database
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean entryFlag = userDao.insertUser(user);
			if(entryFlag==true)
			{
				out.println("Entry added");
			}
			else {
				out.println("Failed");
			}
		}
		else
		{
			if(checkbox==null)
			{
				out.println("PLEASE SELECT TERMS AND CONDITIONS");
			}
		}

	}

}

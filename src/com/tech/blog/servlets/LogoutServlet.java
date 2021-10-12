package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

@SuppressWarnings("serial")
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet{
	
	//Please user doGet method here to get the servlet work, post method won't work because there is no data coming 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession s= request.getSession();
		
		s.removeAttribute("currentUser");
		Message m = new Message("Logout Successfully","success","alert-success");
		s.setAttribute("message", m);
		response.sendRedirect("loginpage.jsp");
		
	}

}

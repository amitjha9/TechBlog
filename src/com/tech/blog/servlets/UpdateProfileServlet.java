package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.UploadPhoto;

@SuppressWarnings("serial")
@MultipartConfig
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		//This is new data coming from the user before perform edit 
		String updatedName = request.getParameter("user_name");
		String updatedEmailID = request.getParameter("user_email");
		String updatedPasswd = request.getParameter("user_password");
		//Here uploading image file with the help of servlet
		Part part = request.getPart("image");
		String updatedProfileName = part.getSubmittedFileName();
		//End of uploading file name
		String updatedStatus = request.getParameter("about");

		//Get the user from session here old user details
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("currentUser"); //Type casting in user object class

		//Now set the new data coming to this user object by set method property
		user.setName(updatedName);
		user.setEmail(updatedEmailID);
		user.setPassword(updatedPasswd);
		String oldPhotoPath = user.getProfile();
		user.setProfile(updatedProfileName);
		user.setAbout(updatedStatus);

		//Database operation

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean updateUserData = userDao.updateUserData(user);
		if(updateUserData == true)
		{
			//Call upload photo method from UploadPhoto class
			String oldPicPath = "C:\\Users\\ajha\\eclipse-workspace\\TechBlog\\WebContent"+"pics"+File.separator+oldPhotoPath;
			System.out.println(oldPicPath);
			UploadPhoto.deletePhoto(oldPicPath);

			//Once this becomes true then only uploadNewPhoto function will get call
			String newPicPath = System.getProperty("user.dir")+"pics"+File.separator+user.getProfile();
			boolean uploadNewPic = UploadPhoto.uploadNewPhoto(part.getInputStream(), newPicPath);
			if(uploadNewPic==true)
			{
				out.println("Profile Uploaded");
				System.out.println(newPicPath);
			}
			else
			{
				out.println("Error While uploading new photo");
			}
		}
		else {
			out.println("Entry not updated");
		}
	}

}

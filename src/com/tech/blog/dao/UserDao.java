package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;
public class UserDao {

	private Connection con;

	//Method to insert the user into database
	public UserDao(Connection con)
	{
		this.con=con;
	}

	public boolean insertUser(User user)
	{
		boolean flag=false;
		try {
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	//Select email and password for login purpose
	public User getUserEmailAndPassword(String email, String password)
	{
		User user = null;
		try {
			String query = "select * from user where email='"+email+"' and password='"+password+"';";
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(query);

			while(set.next())
			{
				int id = set.getInt("id");
				String name = set.getString("name");
				String emailid = set.getString("email");
				String pass = set.getString("password");
				String sex = set.getString("gender");
				String abt = set.getString("about");
				String profile = set.getString("profile");

				//Set all the above gated value to user object
				user = new User();
				user.setId(id);
				user.setName(name);
				user.setEmail(emailid);
				user.setPassword(pass);
				user.setGender(sex);
				user.setAbout(abt);
				user.setProfile(profile);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	//Function to update the value in database

	public boolean updateUserData(User user)
	{
		boolean flag = false;
		try {
			if(flag == false)
			{
				String updateQuery="update user set name=? , email=?, password=?, gender=?, about=?, profile=? where id=?";
				PreparedStatement pstmt = this.con.prepareStatement(updateQuery);
				pstmt.setString(1, user.getName());
				pstmt.setString(2, user.getEmail());
				pstmt.setString(3, user.getPassword());
				pstmt.setString(4, user.getGender());
				pstmt.setString(5, user.getAbout());
				pstmt.setString(6, user.getProfile());
				pstmt.setInt(7, user.getId());
				pstmt.executeUpdate();
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}

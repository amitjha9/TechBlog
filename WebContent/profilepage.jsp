<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- Type cast to user object while fetching user details from login page by session using get attribute -->
<%@page import="com.tech.blog.entities.User" %>
<%
User user = (User)session.getAttribute("currentUser");
if(user == null)
{
	response.sendRedirect("loginpage.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile Page</title>
<!-- Bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/Mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 60% 100%, 29% 89%, 0 100%, 0 0);
}

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a href="index.jsp" class="navbar-brand" href="#"> <span class = "fa fa-asterisk"></span> Tech Blog </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class = "fa fa-bell-o"></span> LearnCode With Amit <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span class = "fa fa-check-square-o"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="#"> <span class = "fa fa-address-book-o"></span> Contact </a>
      </li>
      
    </ul>
    
    <ul class= "navbar-nav mr-right">
      <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class = "fa fa-user-circle"></span> <%=user.getName() %> </a>
      </li>
   </ul>
   
   <ul class= "navbar-nav mr-right">
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> <span class = "fa fa-user-circle"></span> Logout </a>
      </li>
   </ul>
      
    </div>
</nav>

<!-- Profile modal start -->

<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class = "container text-center">
      <img src="pics/<%= user.getProfile() %>" class="img-rounded" style="border-radious:50%; max-width :150px;"></img>
       <br>
        <h5 class="modal-title mt-3" id="exampleModalLabel"> Hello <%= user.getName() %></h5>
      </div>
      
      <!-- Table to display profile of a user on profile screen -->
      
 <div id = "profile-details">
      <table class="table text-center">
  <tbody>
    <tr>
      <th scope="row"> ID: </th>
      <td><%= user.getId() %></td>
    </tr>
    <tr>
      <th scope="row"> Name: </th>
      <td><%= user.getName() %></td>
    </tr>
    
    <tr>
      <th scope="row"> Gender: </th>
      <td><%= user.getGender() %></td>
    </tr>
    
    <tr>
      <th scope="row"> Email: </th>
      <td><%= user.getEmail() %></td>
    </tr>
    
    <tr>
      <th scope="row"> Status: </th>
      <td><%= user.getAbout() %></td>
    </tr>
    
  </tbody>
</table>
</div>
<!-- End of profile table -->

<!-- Start of edit-profile-details -->
<div class="container text-center">
<div id = "edit_profile_details" style="display: none;">
<h3>Please Edit Carefully</h3>

<form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
<table class ="table">
<tr>
<th scope="row"> ID: </th>
<td><%= user.getId() %></td>
</tr>

<tr>
<th scope="row"> Gender: </th>
<td><%= user.getGender() %>
</tr>

<tr>
<th scope="row"> Name: </th>
<td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></input></td>
</tr>

<tr>
<th scope="row"> Email ID: </th>
<td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></input></td>
</tr>

<tr>
<th scope="row"> Password: </th>
<td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></input></td>
</tr>

<tr>
<th scope="row"> Profile Pic: </th>
<td><input type="file" class="form-control" name="image"></input></td>
</tr>

<tr>
<th scope="row"> Status: </th>
<td>
<textarea class="form-control" name="about">
<%= user.getAbout() %>
</textarea>
</td>
</tr>

</table>

<!-- Here you submit your edited value by using submit details -->
<button type="submit" class="btn btn-primary">Save</button>
</form>

</div>
</div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        <button id = "editbtn" type="button" value = "editdetails"class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>

<!-- Profile modal end -->

<!-- Javascript library -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<!-- Java script and jquery to implement toggle logic on editing of profile details -->

<script>

$(document).ready(function(){
	let editStatus = false;
	
	$('#editbtn').click(function(){
		if(editStatus == false)
		{
		  $('#profile-details').hide();
		  $('#edit_profile_details').show();
		  editStatus = true;
		  $(this).text("BACK");
		}
		
		else
		{
			$('#profile-details').show();
			$('#edit_profile_details').hide();
			editStatus = false;
			$(this).text("Edit");
		}
	})
})

</script>

</body>
</html>
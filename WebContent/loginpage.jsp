<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.Message" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

<!-- Bootstrap css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/Mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

.banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 96%, 64% 86%, 33% 99%, 0 89%, 0 0);
}

</style>

</head>
<body>

<!-- navbar -->

<%@include file="navbar.jsp" %>

<main class = "d-flex align-items-center primary-background" style = "height:70vh">

<div class = "container">
<div class = "row">
<div class = "col-md-4 offset-md-4">
<div class = "card">

<div class = "card-header primary-background text-white text-center">
<span class= "fa fa-user-plus fa-3x"></span>
<p>Login Here</p>
</div>

<!-- Here we have to call message class object to get the failure reason from invalid credentials -->

<%
Message msg = (Message)session.getAttribute("message");
if(msg!=null)
{
%>
<div class="alert <%= msg.getCssClass() %>" role="alert">
    <%= msg.getContent()%>
</div>
	
<%
  session.removeAttribute("message");
}
%>

<div class = "card-body">
<form action="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name = "useremail" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name = "userpassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
  </div>
  
  <div class="container text-center">
    <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
</div>

</div>

</div>

</div>
</div>

</main>

<!-- Javascript library -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
	  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script> 

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
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

<!-- navbar -->
<%@include file="navbar.jsp" %>

<!-- banner -->
<div class = "container-fluid m-0 p-0">
<div class = "jumbotron primary-background text-white">
<div class = "container">
<h3 class = "display-4">Welcome To TechBlog</h3>
<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>

<a href = "registerpage.jsp" class = "btn btn-outline-light btn-lg"><span class = "fa fa-user-plus"></span> Start ! its Free</a>
<a href = "loginpage.jsp" class = "btn btn-outline-light btn-lg"><span class = "fa fa-user-circle"></span> Login </a>
</div>
</div>
</div>

<!-- cards -->

<div class = "container">
<div class = "row mb-2">
<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>

</div>
</div>

<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
  
</div>
</div>

<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
  
</div>
</div>
</div>

<div class = "row">
<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
  
</div>
</div>

<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
  
</div>
</div>

<div class = "col-md-4">
<div class="card">

  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is object orianted programming language.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>
  
</div>
</div>
</div>

</div>

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
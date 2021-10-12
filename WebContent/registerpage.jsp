<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>

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

<main class = "primary-background" style ="padding-bottom: 80px;">

<div class = "container">

<div class = "col-md-6 offset-md-3">
<div class = "card">

<div class = "card-header text-center primary-background text-white"><span class = "fa fa-user-circle fa-3x"></span><br>
Register Here
</div>
<div class = "card-body">

<form id="reg-form" action="SignupServlet" method="post">

  <div class="form-group">
    <label for="user_name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name" required>
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name = "user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name = "user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
    <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
  </div>
  
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio" id="gender" name = "gender" value="Male"> Male
    <input type="radio" id="gender" name = "gender"value="Female"> Female
  </div>
  
  <div class="form-group">
  <textarea name ="about" class="form-control" id = "user_about" rows="5" placeholder = "Enter something about yourself" required></textarea>
  </div>
  
  <div class="form-check">
    <input name = "user_check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
  
  <br>
  <div class = "container text-center id="loader" style="display : none;">
  <span class = "fa fa-refresh fa-spin fa-3x"></span>
  <h4>Please Wait...</h4>
  </div>
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
  
</form>

</div> 

<div class = "card-footer">


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<!-- Ajax implementation in this jsp page -->
<!-- Try to understand this below code -->

<script>

$(document).ready(function(){
	console.log("document loaded");
	
	
	$('#reg-form').on('submit',function(event){
		event.preventDefault();
		
		let form = new FormData(this);
		$("#submit-btn").hide();
		$("#loader").show();
		//Ajex
		$.ajax({
			
			url: "SignupServlet",
			type: 'post',
			data: form,
			success: function(data,textStatus,jqXHR)
			{
				console.log(data);
				$("#submit-btn").show();
				$("#loader").hide();
				
				//Data Validation
				if(data.trim()==='Entry added')
				{
					swal("Registered Successfully...We are redirecting you to Login Page")
                   .then((value) => {
                    window.location = "loginpage.jsp"
                    });
				}
				else
				{
			      	swal(data);
				}
				
			},
		    error: function(jqXHR,textStatus,errorThrown)
		    {
		    	$("#submit-btn").show();
				$("#loader").hide();
		    	swal("Something Went Wrong...Please try again")
		    },
		    processData: false,
		    contentType: false
		});
		
	});
});

</script>

<script> 

</script>

</body>
</html>
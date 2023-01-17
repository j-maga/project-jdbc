<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>login</title>
</head>
<body style="background-color: #e3f2fd;"><br><br>

<div align="center">

<div class="container">
<div class="card w-50 mx-auto my-5 border border-primary">
<div class="card-header text-center">
<div align="center"><img alt="yoga" src="images/yogalogob.png" style="height:35px; width:73px;"></div>
<h5 class="mt-2 mb-0">Login</h5>
</div>
<div class="card-body">

<form action="user-login" method="post">

<input type="email" placeholder="User Mail Id" name="logmail" style="width:250px; height:35px;" required ><br><br>
<input type="password" placeholder="Password" name="logpass" style="width:250px; height:35px;" required ><br><br>
<!-- <a class="text-muted" href="">Forgot Password?</a><br><br> -->
<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-primary text-light">

<div class="text-muted mt-3 mb-2" align="center">
Not yet registered? <a href="signup.jsp" class="text-muted" href="">Sign Up</a>
</div>
					
</form>
</div></div></div></div>

</body>
</html>
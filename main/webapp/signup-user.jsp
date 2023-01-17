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

<title>studio sign up</title>
</head>
<body style="background-color: #e3f2fd;"><br><br><br>

<div align="center">

<div class="container">
<div class="card w-75 mx-auto my-2 border border-primary">
<div class="card-header text-center"><h5>User Sign Up</h5></div>
<div class="card-body p-0">

<form method="POST" action="UserServlet">

<div class="form-group m-3">
<input type="text" placeholder="User Name" name="uname" style="width:250px; height:35px;" required>&nbsp;&nbsp;&nbsp;
<input type="email" placeholder="Mail ID" name="umail" style="width:250px; height:35px;" required>
</div>

<div class="form-group m-3">
<input type="date" placeholder="DOB" name="udob" style="width:250px; height:35px;">&nbsp;&nbsp;&nbsp;
<input type="tel" placeholder="Phone" name="uphone" style="width:250px; height:35px;" required>
</div>

<div class="form-group m-3 col-xs-8">
<input type="text" placeholder="Address" name="uaddress" style="width:515px; height:35px;">
</div>

<div class="form-group m-3 col-xs-3">
<input type="password" placeholder="Enter Password" name="upass" style="width:250px; height:35px;" required>&nbsp;&nbsp;&nbsp;
<input type="password" placeholder="Confirm Password" name="uconfirm" style="width:250px; height:35px;" required>
</div>

<div class="form-group">
<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-primary"></div>

<div class="text-muted mt-3 mb-2" align="center">
Already have an account? <a href="signin.jsp" class="text-muted" href="">Log In</a>
</div>

</form>
</div></div></div></div>

</body>
</html>
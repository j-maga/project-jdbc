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

<title>user sign up</title>
</head>
<body><br><br>

<div align="center">
<h4>SignUp Form</h4><br>

<form method="post" action="UserServlet">

<div class="form-group m-3">
<input type="text" placeholder="User Name" name="uname" required>&nbsp;&nbsp;&nbsp;
<input type="email" placeholder="Mail ID" name="umail" required>
</div>

<div class="form-group m-3">
<input type="date" placeholder="DOB" name="udob" style="width:190px;">&nbsp;&nbsp;&nbsp;
<input type="tel" placeholder="Phone" name="uphone" required>
</div>

<div class="form-group m-3 col-xs-8">
<input type="text" placeholder="Address" name="uaddress" style="width:400px;">
</div>

<div class="form-group m-3 col-xs-3">
<input type="password" placeholder="Enter Password" name="upass" required>&nbsp;&nbsp;&nbsp;
<input type="password" placeholder="Confirm Password" name="uconfirm" required>
</div>

<div class="form-group m-3">
<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info"></div>

</form></div></body>
</html>
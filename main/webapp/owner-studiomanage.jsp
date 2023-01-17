<%@page import="com.page.dao.*"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
Owner auth = (Owner)request.getSession().getAttribute("auth");
if (auth != null)
{
    request.setAttribute("person", auth);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Studio Management</title>
</head>
<body>

<%@include file="includes/snavbar.jsp"%>

<nav class="navbar navbar-light bg-light">

<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" align="right" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul>
</div>

<div class="mx-5"><p class="fs-6 mb-0">Studio Management</p></div>
</nav>

<br><br><br>

<div align="center"> <div class="container">
<div class="card w-50 mx-auto my-2 border border-primary">
<div class="card-header text-center">
<h5 class="mt-2 mb-0">Studio Image Upload</h5>
</div>
<div class="card-body text-left">

<div class="container ml-4">
<form class="form-inline" action="AddImage" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="${auth.id}">

<div class="">Select Image :
<input type="file" name="image" required><br><br>
   
   <div class="form-group mx-4" align="right">
   <input type="submit" value="Add Image"  class="btn btn-primary"></div>
   </div>
   
</form>

</div></div></div></div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
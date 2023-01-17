<%@page import="com.page.dao.*"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
User auth = (User)request.getSession().getAttribute("auth");
if (auth != null)
{
    request.setAttribute("person", auth);
}
OwnerDao od = new OwnerDao(DbCon.getConnection());
List<Owner> studios = od.getDistinctStudioNames();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Review</title>
</head>
<body>
<%@include file="includes/unavbar.jsp"%>

<nav class="navbar navbar-light bg-light">
<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" align="right" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul></div>
</nav>

<div align="center">

<div class="container">
<div class="card w-75 mx-auto my-5 border border-primary">
<div class="card-header text-center"><h5 class="mt-2 mb-0">Share your Review</h5></div>
<div class="card-body">


<form action="add-review" method="post">
<input type="hidden" name="uid" value="${auth.name}">

<select name="studio" style="width:400px; height:35px;" required>
<option value="" selected disabled>- - Studio Name - -</option>

<%
			if (!studios.isEmpty())
			{
				for (Owner s : studios)
				{
			%>
			
<option><%=s.getStudioName()%></option>

<%
			}
			}
			
			else 
			{
				out.println("There is no studios registered");
			}
			%>
			
</select><br>

<textarea class="my-3 mx-3" style="width:600px;" name="review" rows="2" required></textarea><br>
<input type="submit" id="submit" value="Submit" name="submit" class="btn btn-primary text-light">

</form>
</div></div></div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
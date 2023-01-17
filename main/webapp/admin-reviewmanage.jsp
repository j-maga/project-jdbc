<%@page import="com.page.dao.*"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
Admin auth = (Admin)request.getSession().getAttribute("auth");
if (auth != null)
{
    request.setAttribute("person", auth);
}
OwnerDao od = new OwnerDao(DbCon.getConnection());
List<Owner> studios = od.getDistinctStudioNames();

ReviewDao rd = new ReviewDao(DbCon.getConnection());
List<Review> reviews = rd.getAllReviews(request.getParameter("studio"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>User Management</title>
</head>
<body>

<%@include file="includes/anavbar.jsp"%>

<nav class="navbar navbar-light bg-light">
<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" align="right" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul></div>
<div class="mx-5"><p class="fs-6 mb-0">Review Management</p></div>
</nav>

<div class="my-4" align="center">
<form action="" method="post">

<div class="form-group">
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
			
</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" id="submit" value="Search" name="submit" class="btn btn-primary text-light m-0">
</div>
</form></div>

<div align="center">
<div class="card mx-auto my-4 border border-secondary" style="width:95%">
<div class="card-body"><div align="left">
<%
			if (!reviews.isEmpty())
			{
				for (Review r : reviews)
				{
					if(r.getReview()!=null)
					{
			%>
		<h6><%=r.getUserName() %></h6>
		<p><%=r.getReview() %></p><hr>
			
			<%
			}
			}
			}
			
			else 
			{
				out.println("There is no reviews yet");
			}
			%>
</div></div></div></div>

<%@include file="/includes/footer.jsp"%>

</body>
</html>
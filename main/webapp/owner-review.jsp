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

ReviewDao rd = new ReviewDao(DbCon.getConnection());
List<Review> review = rd.getAllReviews(auth.getStudioName());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Review Management</title>
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
<div class="mx-5"><p class="fs-6 mb-0">User Reviews</p></div>
</nav>

<div align="center">

<div class="card mx-auto my-4 border border-secondary" style="width:95%">
<div class="card-body"><div align="left">

		<%
			if (!review.isEmpty())
			{
				for (Review r : review)
				{
			%>

<h6><%=r.getUserName()%></h6>
<p><%=r.getReview()%></p>
<hr>
		
		<%
			}
			}
			
			else 
			{
				out.println("There is no reviews");
			}
			%>

</div>
</div></div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
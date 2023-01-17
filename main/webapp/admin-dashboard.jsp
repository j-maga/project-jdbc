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
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Dashboard</title>
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
<div class="mx-5"><p class="fs-6 mb-0">Dashboard</p></div>
</nav>

<div class="row mx-5 my-5">
				<div class="col-md-3 mx-4"> <div class="card paint-card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-user fa-2x"></i><br>
							<p class="fs-5 text-center mb-0"><a href="admin-usermanage.jsp">User</a><br>5 </p>
				</div></div></div>
				
				<div class="col-md-3 mx-4"> <div class="card paint-card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-home fa-2x"></i><br>
							<p class="fs-5 text-center mb-0"><a href="admin-studiomanage.jsp">Studio Owner</a><br>5 </p>
				</div></div></div>
</div>

<div class="row mx-5 my-5">				
				<div class="col-md-3 mx-4"> <div class="card paint-card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-calendar fa-2x mt-2"></i><br>
							<p class="fs-5 text-center mb-0"><a href="admin-ticketmanage.jsp">Yoga Slot</a><br>5 </p>
				</div></div></div>
				
				<div class="col-md-3 mx-4"> <div class="card paint-card">
						<div class="card-body text-center text-primary">
							<i class="fas fa-comment fa-2x"></i><br>
							<p class="fs-5 text-center mb-0"><a href="admin-reviewmanage.jsp">Review</a><br>5 </p>
				</div></div></div>
</div>

<img alt="" src="images/adminlogo.png" style="height:200px; weight:200px; position: absolute; top:200px; left:820px;">


<%@include file="/includes/footer.jsp"%>


</body>
</html>
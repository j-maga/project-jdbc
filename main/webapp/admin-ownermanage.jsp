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
List<Owner> ownerlist = od.getAllStudios();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Studio Management</title>
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
<div class="mx-5"><p class="fs-6 mb-0">Owner Management</p></div>
</nav>


<div class="accordion py-4 px-5">

<% int num=1; %>
<%
			if (!ownerlist.isEmpty())
			{
				for (Owner o : ownerlist)
				{
			%>
  
  <div class="accordion-item"> <h2 class="px-3 accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#show<%=num%>" aria-expanded="false">
        <h6><%=o.getName()%></h6></button></h2>
    <div id="show<%=num%>" class="accordion-collapse collapse"> <div class="accordion-body">
        
        <div class="px-3">
        <div class="py-1">Studio Name : <%=o.getStudioName()%></div>
        <div class="py-1">Mail ID : <%=o.getEmail()%></div>
        <div class="py-1">Mobile : <%=o.getPhone()%></div>
        <div class="py-1">Location : <%=o.getLocation()%></div>
        <div class="py-1">No. of Seats : <%=o.getSeats()%></div>
        </div>
<!--         <div class="px-5" align="right"><a href="del-owner?id=<%=o.getId()%>">Remove</a></div>  -->
        
</div></div></div>

<% num++; %>
<%
			}
			}
			
			else 
			{
				out.println("There is no studio owners");
			}

			%>

</div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
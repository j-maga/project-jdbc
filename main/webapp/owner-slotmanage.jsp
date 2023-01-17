<%@page import="com.page.dao.OwnerDao"%>
<%@page import="com.page.dao.SlotDao"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
Owner auth = (Owner) request.getSession().getAttribute("auth");

if (auth != null)
{
    request.setAttribute("person", auth);
}
SlotDao sd = new SlotDao(DbCon.getConnection());

ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");

if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Slot Management</title>
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

<div class="mx-5"><p class="fs-6 mb-0">Slot Management</p></div>

</nav>

<div align="center"> <div class="container my-2">
<div class="card w-50 mx-auto my-2 border border-primary">
<div class="card-header text-center">
<h5 class="mt-2 mb-0">Create New Slot</h5>
</div>
<div class="card-body my-2">

<form method="POST" action="create-slot">
<input type="hidden" name="sid" value="${auth.id}">

<div class="form-group">
Select Date : <input type="date" placeholder="Name" name="date" style="width:200px; height:35px;" required><br><br>

Select Time : <select name="time" style="width:200px; height:35px;">
<option value="" selected disabled>- - Slots Available - -</option>
<option>09 a.m to 11 a.m</option><option>11 a.m to 01 p.m</option>
<option>02 p.m to 04 p.m</option><option>04 p.m to 06 p.m</option>
</select><br><br>

Select Type : <select name="slot" style="width:200px; height:35px;">
<option value="" selected disabled>- - Yoga types - -</option>
<option>Health Yoga</option><option>Ashtanga Yoga</option>
<option>Power Yoga</option><option>Dynamic Meditation</option>
</select><br><br>

Select Fees : <input type="number" placeholder="Fee" name="fee" style="width:200px; height:35px;" required><br><br>

<div class="form-group mx-4" align="right">
<input type="reset" name="reset" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" class="btn btn-primary"></div>
</div>

</form>
</div></div></div></div>


<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
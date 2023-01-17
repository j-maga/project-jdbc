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
<title>Attendance</title>
</head>
<body>

<%@include file="includes/snavbar.jsp"%>


<nav class="navbar navbar-light bg-light">
<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" align="right" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul></div>
<div class="mx-5"><p class="fs-6 mb-0">Attendance Management</p></div>
</nav>

<div align="center"> <div class="container">
<div class="card w-60 mx-auto my-2 border border-primary">
<div class="card-header text-center">
<p class="mt-2 mb-0" style="font-size:17px;">Update Attendance</p>

</div>
<%
int id = Integer.parseInt(request.getParameter("id"));

AttendanceDao ad = new AttendanceDao(DbCon.getConnection());
Attendance at = new Attendance();
at = ad.getSingleAttend(id);
%>
<br>
<div class="card-body">

<form method="POST" action="update-attend">
<input type="hidden" name="sid" value="${auth.id}">
<input type="hidden" name="uid" value="<%=id%>">

<div class="form-group">
<input type="text" name="name" style="width:200px; height:35px;" value="<%=at.getName()%>" required>
&nbsp;&nbsp;&nbsp;&nbsp;

<input type="number" name="total" style="width:200px; height:35px;"  value="<%=at.getTotal()%>" required>
&nbsp;&nbsp;&nbsp;&nbsp;

<input type="number" name="attend" style="width:200px; height:35px;"  value="<%=at.getAttend()%>" required>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="submit" name="submit" value="Update" class="btn btn-primary">

</div>

</form>
</div></div></div></div>

<%=at.getId() %>
<%=id %>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
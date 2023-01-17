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


String id = request.getParameter("id");
int num = Integer.parseInt(id);

SlotDao sd = new SlotDao(DbCon.getConnection());
List<Slot> slots = sd.getAllSlots(num);
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

<ul class="dropdown-menu text-center" aria-labelledby="drop1" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul>
</div>

<div class="mx-5"><p class="fs-6 mb-0">Slot Management</p></div>
</nav>

<div class="card mx-auto my-4 border border-muted" style="width:90%">
<div class="card-body" align="center"><div class="row" align="center">

		<%
			if (!slots.isEmpty())
			{
				for (Slot s : slots)
				{
			%>
			
			<div class="card mx-4 my-3 border border-primary"  style="width:13rem;">
			<div class="card-body">
			<h6 class="card-title"><%=s.getYogatype()%></h6>
			<p class="card-text"><%=s.getTiming()%><br>Ticket Price : &#8360;. <%=s.getPrice()%></p>
<!-- 		<a href="del-slot?id=<%=s.getId()%>" class="btn btn-primary">Cancel</a>--></div>   
			</div>
			
			<%
			}
			}
			
			else 
			{
				out.println("There is no slots");
			}
			%>
			
</div></div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
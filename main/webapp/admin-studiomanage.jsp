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
<title>Ticket</title>
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
<div class="mx-5"><p class="fs-6 mb-0">Studio Management</p></div>
</nav>

<div align="center">

<div class="col-sm-7">
<div class="panel-body">
<table id="tbl-student" class="my-4 table table-responsive table-borderless">


<%
			if (!ownerlist.isEmpty())
			{
				for (Owner o : ownerlist)
				{
					int id = o.getId();
			%>
			
			
			<tr>
<td><%=o.getStudioName()%></td>
<td><a href="admin-slotmanage.jsp?id=<%=id%>">View Slots</a></td>
                             </tr>

<%
			}
			}
%>
                            
                     </table>    
                 </div> 
            </div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
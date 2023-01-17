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

UserDao ud = new UserDao(DbCon.getConnection());
List<User> userlist = ud.getAllUsers();
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
<div class="mx-5"><p class="fs-6 mb-0">User Management</p></div>
</nav>

<div class="container-fluid p-1 my-4">
<div align="center">
             <div class="col-sm-11">
             <div class="card-body">
             
                 <div class="table-responsive">
                     <table class="table table-hover border border-secondary" align="center">
                     
                         <thead class="bg-dark">
                             <tr>
                                    <th class="text-light" scope="col">Name</th>
                                    <th class="text-light" scope="col">Email</th>
                                    <th class="text-light" scope="col">DOB</th>
                                    <th class="text-light" scope="col">Phone</th>
                                    <th class="text-light" scope="col">Address</th>
                                    <th class="text-light" scope="col">Action</th>
                             </tr>
                         </thead>
                         
			<%
			if (!userlist.isEmpty())
			{
				for (User u : userlist)
				{
			%>

                             <tr>
                                 <td><%=u.getName()%></td>
                                 <td><%=u.getEmail()%></td>
                                 <td><%=u.getDate()%></td>
                                 <td><%=u.getPhone()%></td>
                                 <td><%=u.getAddress()%></td>
                                 <td><a href="del-user?id=<%=u.getId()%>">Delete</a></td>
                             </tr>
                             
            <%
			}
			}
			
			else 
			{
				out.println("There is no users");
			}
			%>
                             
                     </table>    
</div></div></div></div></div>


<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
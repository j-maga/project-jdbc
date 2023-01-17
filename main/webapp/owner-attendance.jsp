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

AttendanceDao ad = new AttendanceDao(DbCon.getConnection());
List<Attendance> attendancelist = ad.getAttend(auth.getId());
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
<p class="mt-2 mb-0" style="font-size:17px;">Attendance Details</p>
</div>
<div class="card-body">

<form method="POST" action="attendance">
<input type="hidden" name="sid" value="${auth.id}">

<div class="form-group">
<input type="text" placeholder="Name" name="name" style="width:200px; height:35px;" required>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="number" placeholder="Total Sessions" name="total" style="width:200px; height:35px;" required>&nbsp;&nbsp;&nbsp;&nbsp;
<input type="number" placeholder="Attended Sessions" name="attend" style="width:200px; height:35px;" required>&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" value="Ok" class="btn btn-primary"></div>

</form>
</div></div></div></div>

<div align="center">
<div class="col-sm-9">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered">
                         <thead>
                             <tr>
                                    <th class="col-sm-3">Name</th>
                                    <th class="col-sm-3">Total Sessions</th>
                                    <th class="col-sm-3">Attended Sessions</th>
                                    <th class="col-sm-2">Action</th>
                             </tr>  </thead>
                             
                             
                             	<%
			if (!attendancelist.isEmpty())
			{
				for (Attendance a : attendancelist)
				{
			%>
			
			
			<tr>
                                 <td><%=a.getName() %></td>
                                 <td><%=a.getTotal() %></td>
                                 <td><%=a.getAttend() %></td>
                                 <td><a href="owner-attendance-update.jsp?id=<%=a.getId()%>">Edit</a></td>
                                 <td><a href="del-attend?id=<%=a.getId()%>">Delete</a></td>
                             </tr>
                             
                             
                             <%
                                
                                 }
                             }
                               %>
                            
                     </table>    
                 </div> 
            </div></div>
</div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
if(request.getParameter("submit")!=null && request.getParameter("file")!=null)
{
	%>
<script type="text/javascript">
alert("Image Added");
</script>
    <%
    }
   %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>studio management</title>
</head>
<body>

<nav class="navbar navbar-light bg-light">
<a class="navbar-brand"></a>
<a class="navbar-brand" href="dashboard.jsp">Dashboard</a>
<a class="navbar-brand" href="addImage.jsp">Studio Management</a>
<a class="navbar-brand" href="slotsystem2.jsp">Slot Management</a>
<a class="navbar-brand" href="attend.jsp">Attendance</a>
<a class="navbar-brand" href="review.jsp">Review</a>
<a class="navbar-brand"></a>
</nav>

<br><br><center><h4>Studio Management</h4></center><br><br>


<form class="form-inline" action="AddImage" method="post" enctype="multipart/form-data">
 <div class="mx-auto">  Select Image :<br><br><br>


   <input type="file" name="image" required>
   <input type="submit" value="Add Image"  class="btn btn-info"></div>
</form>



</body>
</html>
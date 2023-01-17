<%@page import="com.page.dao.*"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
Owner auth = (Owner)request.getSession().getAttribute("auth");
if (auth != null)
{
    request.setAttribute("person", auth);
}

SlotDao sd = new SlotDao(DbCon.getConnection());
List<Slot> slots = sd.getAllSlots(auth.getId());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>

<body>
<%@include file="includes/snavbar.jsp"%>

<nav class="navbar navbar-light bg-light">

<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul>
</div>

<div class="mx-5"><p class="fs-6 mb-0">Dashboard</p></div>
</nav>


<div class="container" style="height:500px;">
    
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
        <div class="carousel-item active"><img src="images/img1.jpg" class="d-block w-100" alt="..."></div>
        
        <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/yg","root","My$q!22sep@MJ");
                                
                                String query = "select * from image";
                                Statement st = con.createStatement();
                                  
                                rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("imageId");
                                   %>
          
          <div class="carousel-item"><img src="images/<%=rs.getString("imageFileName") %>" class="d-block w-100" alt="..."></div>
          
          <%
          }
          %>
                               
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
</div>

<br><br>

<div class="card mx-auto my-4 border border-muted" style="width:90%">
<div class="card-body" align="center"><div class="row" align="center">

		<%
			if (!slots.isEmpty())
			{
				for (Slot s : slots)
				{
			%>
			
			<div class="card mx-4 my-3 border border-primary"  style="width:14rem;">
			<div class="card-body">
			<h6 class="card-title"><%=s.getYogatype()%></h6>
			<p class="card-text"><%=s.getTiming()%><br>Ticket Price : &#8360;. <%=s.getPrice()%></p>
			<a href="del-slot?id=<%=s.getId()%>" class="btn btn-primary">Cancel</a></div>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"></script>

</body>
</html>
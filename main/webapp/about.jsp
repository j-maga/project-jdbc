<%@page import="com.page.dao.*"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>About</title>
<link rel="stylesheet" href="includes/home.css">
</head>
<body>
<%@include file="includes/hnavbar.jsp"%>

<div class="wavify">
            <span style="--i:1">Yoga&nbsp;</span>
            <span style="--i:2">adds&nbsp;</span>
            <span style="--i:3">years&nbsp;</span>
            <span style="--i:4">to&nbsp;</span>
            <span style="--i:5">your&nbsp;</span>
            <span style="--i:6">Life&nbsp;</span>
            <span style="--i:7">and&nbsp;</span>
            <span style="--i:8">Life&nbsp;</span>
            <span style="--i:9">to&nbsp;</span>
            <span style="--i:10">your&nbsp;</span>
            <span style="--i:11">Years&nbsp;</span>
</div>
<br><br><br><br>

<%
ReviewDao rd = new ReviewDao(DbCon.getConnection());
List<Review> reviews = rd.getAllReviews();
%>

<div align="center">
<div class="card mx-auto my-4 border border-secondary" style="width:95%">
<div class="card-body"><div align="left">
<%
			if (!reviews.isEmpty())
			{
				for (Review r : reviews)
				{
					if(r.getReview()!=null)
					{
			%>
		<h6><%=r.getUserName() %></h6>
		<p><%=r.getReview() %></p><hr>
			
			<%
			}
			}
			}
			
			else 
			{
				out.println("There is no reviews yet");
			}
			%>
</div></div></div></div>


<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>


</body>
</html>
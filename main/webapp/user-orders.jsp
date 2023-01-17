<%@page import="java.text.DecimalFormat"%>
<%@page import="com.page.dao.OrderDao"%>
<%@page import="com.page.dao.ProductDao"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	
	if (auth != null)
	{
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
	if (cart_list != null) 
	{
		request.setAttribute("cart_list", cart_list);
	}
	%>
	
<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header.jsp"%>
<title>orders</title>
</head>
<body>
<%@include file="includes/unavbar.jsp"%>

<nav class="navbar navbar-light bg-light">
<div class="mx-5" align="right">
<button class="btn btn-muted dropdown-toggle" type="button" id="drop1" data-bs-toggle="dropdown" aria-expanded="false">
<%=auth.getName()%></button>

<ul class="dropdown-menu text-center" aria-labelledby="drop1" align="right" style="margin-left:20px;">
<li><a class="dropdown-item"  href="user-logout">Logout&nbsp;&nbsp;<i class="fas fa-sign-out-alt text-primary"></i></a></li>
</ul></div>
</nav>

<div align="center">
		<div class="card-header my-3">All Orders</div>
		<div class="col-sm-9">
		<table class="table table-responsive table-bordered">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Yoga Type</th>
				<!-- 	<th scope="col">Ticket</th>  -->
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null)
			{
				for(Order o:orders)
				{
				%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getYogatype() %></td>
					<!-- 	<td><%=o.getName() %></td>  -->
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%
				}
			}
			%>
			
			</tbody>
		</table>
	</div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>

</body>
</html>
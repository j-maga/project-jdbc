<%@page import="java.text.DecimalFormat"%>
<%@page import="com.page.dao.OrderDao"%>
<%@page import="com.page.dao.SlotDao"%>
<%@page import="com.page.connection.DbCon"%>
<%@page import="com.page.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null)
{
    request.setAttribute("person", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null)
{
	SlotDao sDao = new SlotDao(DbCon.getConnection());
	cartProduct = sDao.getCartSlots(cart_list);
	double total = sDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<%@include file="includes/header.jsp"%>
<title>cart</title>
<style type="text/css">
.table tbody td
{
vertical-align: middle;
}

.btn-incre, .btn-decre
{
box-shadow: none;
font-size: 25px;
}
</style>
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

<div class="container my-3" align="center">
		<div class="d-flex py-3"><h5>Total Price: &#8360;. ${(total>0)?dcf.format(total):0} </h5> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
		<div class="col-sm-11">
		<table class="table table-bordered table-responsive">
			<thead>
				<tr>
					<th scope="col">Yoga Type</th>
					<th scope="col">Date</th>
					<th scope="col">Fee</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null)
				{
					for (Cart c : cartProduct)
					{
				%>
				<tr>
					<td><%=c.getYogatype()%></td>
					<td><%=c.getDate()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex ">
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control" style="width:100px; height:40px;" value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							</div>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
					}
				}
				%>
			</tbody>
		</table>
	</div></div>
	
	
	<div align="center">

<div class="container">
<div class="card w-75 mx-auto my-5 border border-primary">
<div class="card-header text-center">
<h5 class="mt-2 mb-0">Payment</h5>
</div>
<div class="card-body">

<form action="send-mail" method="post">
<div class="form-group">
<input type="email" name="mail" style="width:200px; height:35px;" value="<%=auth.getEmail()%>" required>
&nbsp;&nbsp;&nbsp;&nbsp;

<input type="number" name="total" style="width:200px; height:35px;"  placeholder="Total" required>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="submit" name="submit" value="Continue" class="btn btn-primary">
</div>
					
</form>
</div></div></div></div>

<div class="fixed-bottom">
<%@include file="/includes/footer.jsp"%>
</div>
</body>
</html>
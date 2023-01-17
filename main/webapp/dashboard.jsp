<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>dashboard</title>
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

<br><br><center><h4>Dashboard</h4></center><br>

<hr>

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
                                   
                                   <center><img src="images/<%=rs.getString("imageFileName") %>"></center>
                                   
                                   <%
                                 }
                               %>
                    
                               
                               
                               <%
                                Connection con1;
                                PreparedStatement pst1;
                                ResultSet rs1;

                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/yg","root","My$q!22sep@MJ");
                                
                                String query1 = "select * from slotsalloc";
                                Statement st1 = con.createStatement();
                                %>
                                
                                <div class="col-sm-12"><div class="panel-body"><div align="center">
                 
                  <div class="row">

					<%
					rs1 =  st1.executeQuery(query1);
                                    
                    while(rs1.next())
                    {
                           String id1 = rs1.getString("id");
                            %>
                            
                            <div class="card mx-3 my-5"  style="width:12rem;">
                            <div class="card-body">
                            <h6 class="card-title"><%=rs1.getString("yogatype")%></h6>
                            <p class="card-text"><%=rs1.getString("slottime")%></p>
                            <a href="slotdel2.jsp" class="btn btn-info">Cancel</a></div>
                            
                            </div>
                            
                                <%
                                 }
                               %>
   </div></div></div></div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>
<title>Insert title here</title>
</head>
<body>

<%@include file="includes/hnavbar.jsp"%>

<div class="container-fluid p-1">
<div align="center">
             <div class="col-xl-12">
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

                             <tr>
                                 <td>Magalaxmi J</td>
                                 <td>142001maga@gmail.com</td>
                                 <td>01-04-2001</td>
                                 <td>7538877682</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>01-04-2001</td>
                                 <td>7538877682</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>01-04-2001</td>
                                 <td>7538877682</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>01-04-2001</td>
                                 <td>7538877682</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                     </table>    
</div></div></div></div></div>


<div class="container-fluid p-1">
<div align="center">
             <div class="col-xl-12">
             <div class="card-body">
             
                 <div class="table-responsive-xl">
                     <table class="table table-hover border border-secondary" align="center">
                     
                         <thead class="bg-dark">
                             <tr>
                                    <th class="text-light" scope="col">Name</th>
                                    <th class="text-light" scope="col">Email</th>
                                    <th class="text-light" scope="col">Location</th>
                                    <th class="text-light" scope="col">Phone</th>
                                    <th class="text-light" scope="col">Studio Name</th>
                                    <th class="text-light" scope="col">Seats</th>
                                    <th class="text-light" scope="col">Address</th>
                                    <th class="text-light" scope="col">Action</th>
                             </tr></thead> 

                             <tr>
                                 <td>Magalaxmi J</td>
                                 <td>142001maga@gmail.com</td>
                                 <td>Tamil Nadu</td>
                                 <td>7538877682</td>
                                 <td>MHSS Yoga Studio</td>
                                 <td>100</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>Andhra Pradesh</td>
                                 <td>9364693446</td>
                                 <td>Gio Yoga Center</td>
                                 <td>100</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>Kerala</td>
                                 <td>7538877682</td>
                                 <td>SCSS Yoga Center</td>
                                 <td>100</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                             <tr>
                                 <td>AlecBenjamin</td>
                                 <td>alecbenjamin1401@yahoo.com</td>
                                 <td>Tamil Nadu</td>
                                 <td>7538877682</td>
                                 <td>ABC Yoga Center</td>
                                 <td>100</td>
                                 <td>No.1, K.R.K Street, Ammapet, Thanjavur - 614401.</td>
                                 <td>Delete</td>
                             </tr>
                             
                     </table>    
</div></div></div></div></div>

<div class="accordion">
  
  <div class="accordion-item"> <h2 class="px-5 accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#show1" aria-expanded="false">
        MHSS Yoga Center</button></h2>
    <div id="show1" class="accordion-collapse collapse"> <div class="accordion-body">
        
        <div class="px-5">
        <div class="py-1">Owner Name : AlecBenjamin</div>
        <div class="py-1">Mail ID : benjaminfranklin@yahoo.com</div>
        <div class="py-1">Mobile : 8110954596</div>
        <div class="py-1">Location : Tamil Nadu</div>
        <div class="py-1">No. of Seats : 100</div>
        </div>
        <div class="px-5" align="right">Remove</div>
        
</div></div></div>


<div class="accordion-item"> <h2 class="px-5 accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#show2" aria-expanded="false">
        Gio Yoga Center</button></h2>
    <div id="show2" class="accordion-collapse collapse"> <div class="accordion-body">
        
        <div class="px-5">
        <div class="py-1">Owner Name : AlecBenjamin</div>
        <div class="py-1">Mail ID : benjaminfranklin@yahoo.com</div>
        <div class="py-1">Mobile : 8110954596</div>
        <div class="py-1">Location : Tamil Nadu</div>
        <div class="py-1">No. of Seats : 100</div>
        </div>
        <div class="px-5" align="right">Remove</div>
        
</div></div></div>


<div class="accordion-item"> <h2 class="px-5 accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#show3" aria-expanded="false">
        ABCDXYZ Yoga Center</button></h2>
    <div id="show3" class="accordion-collapse collapse"> <div class="accordion-body">
        
        <div class="px-5">
        <div class="py-1">Owner Name : AlecBenjamin</div>
        <div class="py-1">Mail ID : benjaminfranklin@yahoo.com</div>
        <div class="py-1">Mobile : 8110954596</div>
        <div class="py-1">Location : Tamil Nadu</div>
        <div class="py-1">No. of Seats : 100</div>
        </div>
        <div class="px-5" align="right">Remove</div>
        
</div></div></div>


<div class="accordion-item"> <h2 class="px-5 accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#show4" aria-expanded="false">
        Lilac Yoga Center</button></h2>
    <div id="show4" class="accordion-collapse collapse"> <div class="accordion-body">
        
        <div class="px-5">
        <div class="py-1">Owner Name : AlecBenjamin</div>
        <div class="py-1">Mail ID : benjaminfranklin@yahoo.com</div>
        <div class="py-1">Mobile : 8110954596</div>
        <div class="py-1">Location : Tamil Nadu</div>
        <div class="py-1">No. of Seats : 100</div>
        </div>
        <div class="px-5" align="right">Remove</div>
        
</div></div></div>


</div>

<%@include file="/includes/footer.jsp"%>

</body>
</html>
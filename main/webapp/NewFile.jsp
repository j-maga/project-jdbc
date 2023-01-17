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
<%@include file="includes/anavbar.jsp"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<br><br>

<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">Filter</button>
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">Search</button>

<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  
    <p class="fw-bold">Filter Properties by</p>
    <button type="button" class="btn-close btn-sm text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>

  <div class="offcanvas-body">
  <form action="">
  <p class="fw-bold py-0">Cost</p>
  <div class="py-1"><input type="checkbox" id="check1">&nbsp;&nbsp;&#x20B9;.100 - &#x20B9;.200</div>
  <div class="py-1"><input type="checkbox" id="check1">&nbsp;&nbsp;&#x20B9;.200 - &#x20B9;.300</div>
  <div class="py-1"><input type="checkbox" id="check1">&nbsp;&nbsp;Above &#x20B9;.300</div>
  
  <p class="fw-bold py-0">Location</p>
  <div class="py-1"><input type="radio" id="radio1">&nbsp;India</div>
  <div class="py-1"><input type="radio" id="radio1">&nbsp;Outside India</div>
  
  <p class="fw-bold py-0">Service</p>
  <div class="py-1"><input type="checkbox" id="check1">&nbsp;Health Yoga</div>
  <div class="py-1"><input type="checkbox" id="check2">&nbsp;Power Yoga</div>
  <div class="py-1"><input type="checkbox" id="check3">&nbsp;Ashtanga Yoga</div>
  <div class="py-1"><input type="checkbox" id="check4">&nbsp;Dynamic Meditation</div>
  <div class="py-1"><button type="submit" class="btn btn-primary mt-3">Ok</button></div>
  </form>
  </div>
</div>

<br><br>
<%@include file="includes/footer.jsp"%>
</body>
</html>
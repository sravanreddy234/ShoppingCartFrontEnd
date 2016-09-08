<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Quick Buy|Home</title>
  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="src/main/view/css/navbar.css"></link>
  <style>
  body{
    background-color: #949494;
  }

</style>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="home.html">Quick Buy</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Electronics<span class="badge">3</span></a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Mobiles<span class="badge">5</span></a>
		  <li><a href="#">Nokia</a></li>
		  <li><a href="#">Apple</a></li>
		  <li><a href="#">HTC</a></li>
		  <li><a href="#">Lenovo</a></li>
		  <li><a href="#">Coolpad</a></li>
		  </li>
          <li><a href="#">Laptops</a></li>
          <li><a href="#">Tablets</a></li>
        </ul>
      </li>
	  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Clothing<span class="badge">3</span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Sports Wear</a></li>
          <li><a href="#">Formals</a></li>
          <li><a href="#">Casuals</a></li>
        </ul>
      </li>
	  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Footwear<span class="badge">3</span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Formal Shoe</a></li>
          <li><a href="#">Sneakers</a></li>
          <li><a href="#">Loafers</a></li>
        </ul>
      </li>


    </ul>
    <ul class="nav navbar-nav navbar-right">
	
          <li><a href="Registration"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
          
          <li><a href="Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
          
        </ul>
        <c:if test ="${UserClickedLoginHere }">
          <jsp:include page="Login.jsp"></jsp:include>
            </c:if>
            <c:if test="${UserClickedRegisterHere}">
            <jsp:include page="Registration.jsp"></jsp:include>
            </c:if>
  </div>
</nav>
<body>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
  

</head>
<body>

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="E:/5.jpg" alt="6" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="E:/2.jpg" alt="2" width="460" height="345">
        <div class="carousel-caption">
          <h3>Chania</h3>
          <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
        </div>
      </div>

      <div class="item">
        <img src="E:/3.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

      <div class="item">
        <img src="E:/4.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Flowers</h3>
          <p>Beatiful flowers in Kolymbari, Crete.</p>
        </div>
      </div>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class = "row">
   
   <div class = "col-sm-6 col-md-3">
      <a href = "#" class = "thumbnail">
         <img src = "E:/11.jpg" alt = "Generic placeholder thumbnail">
      </a>
   </div>
   
   <div class = "col-sm-6 col-md-3">
      <a href = "#" class = "thumbnail">
         <img src = "E:/12.jpg" alt = "Generic placeholder thumbnail">
      </a>
   </div>
   
   <div class = "col-sm-6 col-md-3">
      <a href = "#" class = "thumbnail">
         <img src = "E:/13.jpg" alt = "Generic placeholder thumbnail">
      </a>
   </div>
   
   <div class = "col-sm-6 col-md-3">
      <a href = "#" class = "thumbnail">
         <img src = "E:/14.jpg" alt = "Generic placeholder thumbnail">
      </a>
   </div>
   
</div>


</body>
</html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<link rel="stylesheet" href="<c:url value="/WEB-INF/resources/css/navbar.css" />" >
<link rel="stylesheet" href="<c:url value="/WEB-INF/resources/css/style.css" />" >

<link href="<c:url value="/WEB-INF/resources/css/carousel.css" />" rel="stylesheet">
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- Angular.JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>
  


<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 80%;
      margin: auto;
  }
  </style>

</head>
<!-- <body style="background-color: #f7f7f7;"> -->
<title>QuickBuy</title>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="backHome">QuickBuy</a>
    
    <ul class="nav navbar-nav">
					<li><a href="backHome"><span><img alt="logo"
								style="vertical-align: baseline;" src="E:/logo2.png"
								width="25px" height="20px"></span></a></li>
					
					<c:forEach items="${categoryList}" var="category">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="${category.categoryName}">${category.categoryName}<span
								class="caret"></span></a>
							
							<ul class="dropdown-menu">
								<c:forEach items="${category.products}" var="product">
									<li><a href="<c:url value="/selectedProduct/${product.productId}"/>" >${product.productName}</a></li> 
								</c:forEach>
							</ul></li>
					</c:forEach>
					
				<li><a href="about">ABOUT US</a></li>
    </ul>
			
		
      
     
      
    
				<ul class="nav navbar-nav navbar-right">
				
				
							<%-- <c:if test="${not empty loggedInUser}">
							<li><a>Welcome: ${loggedInUser}</a></li>
                            <li><a href="logout">Logout</a></li>
						
						<c:if test="${loggedInUser != 'ROLE_ADMIN'}">
                                <li><a href="<c:url value="/myCart" />">Cart</a></li>
                            </c:if>

                            <c:if test="${loggedInUser == 'ROLE_ADMIN'}">
                                <li><a href="<c:url value="/admin" />">Admin</a></li>
                            </c:if>

                        </c:if>
						<c:if test="${loggedInUser == null}">
                            <li><a href="<c:url value="/Login" />"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                            <li><a href="<c:url value="/Registration" />"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                        </c:if> --%>
				
                        <c:choose>
						<c:when test="${pageContext.request.userPrincipal.name==null}">
						
							<li><a href="<c:url value="/Login" />"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                            <li><a href="<c:url value="/Registration" />"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>						</c:when>

						<c:when test="${pageContext.request.userPrincipal.name!=null}" >
							<li><a href="myCart"> <i class="fa fa-shopping-cart"
									aria-hidden="true"></i> Cart
							</a></li>
							<li><a>Welcome: ${pageContext.request.userPrincipal.name }</a></li>
			<li><a href="<c:url value="/j_spring_security_logout" />"></><i class="fa fa-unlock"></i><em>LogOut</em></a></li>
								
						</c:when>
					</c:choose>		
				
					
					</ul>
					
					</div>
					</div>
</nav>
			
			
			
<c:if test="${image==true}">
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
        <img src="E:/mobiles/1.jpg" alt="Best Offers" width="460" height="345">
      </div>

      <div class="item">
        <img src="E:/mobiles/322.jpg" alt="Huge Discounts On Laptops" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="E:/mobiles/5.jpg" alt="Iphone7" width="460" height="345">
      </div>

      <div class="item">
        <img src="E:/mobiles/4.jpg" alt="EMIs On Laptops" width="460" height="345">
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
</c:if>





				<table>

				<tr>
					<c:if test="${loggedOut==true}">
					</c:if>
					<td>${logOutMsg}</td>
				</tr>
					
						
							
				<tr>
					<c:if test="${not empty cartSize}">
						<td align="right"><a href="viewCart">My cart</a>(${cartSize})</td>
					</c:if>
				</tr>

			</table>
		
		
		
		


		<%-- ${SuccessMessage} --%>
								
		<div >
			<ul id=menu>
				<c:if test="${not empty List}">
					<c:forEach items="${category.List}" var="category ">
						<li><a href="/selectedProduct/${product.productId}">${category.categoryName}</a>
						
							
					</c:forEach>
				</c:if>
			</ul>
			<div>
			<hr color="red" size="5">
			<ul id="menu">
		<c:forEach items="${categoryList}" var="category">
			<li><a href= ${category.categoryName} >${category.categoryName}</a>
				<ul>
					<c:forEach items="${category.products}" var="product">

						<li><a href="<c:url value='/selectedProduct/${product.productId}' />">${product.productName}</a></li>

					</c:forEach>

				</ul></li>
		</c:forEach>

	</ul>
			
			
			<br> <br> <br>
			<%-- datais ${selectedProduct.productName } --%>
		<c:if test="${singleProduct==true}">
			<div>
				<c:if test="${!empty selectedProduct.productName}">
					<table>
						<tr>
							<th align="left" width="80">Product ID</th>
							<th align="left" width="120">Product Name</th>
							<th align="left" width="200">Product Description</th>
							<th align="left" width="80">Price</th>
							<th align="left" width="200">Product Category</th>
							<th align="left" width="200">Product Supplier</th>
						</tr>
						<tr>
							<td align="left">${selectedProduct.productId}</td>
							<td align="left">${selectedProduct.productName}</td>
							<td align="left">${selectedProduct.description}</td>
							<td align="left">${selectedProduct.price}</td>
							<td align="left">${selectedProduct.categoryId}</td>
							<td align="left">${selectedProduct.supplierId}</td>
						</tr>
					</table>
				</c:if>
			</div>
			</c:if>
</div>
</div>

		<%-- ${message} --%>

		<div id="Registration">

			<c:if test="${userClickedRegisterHere==true}">
				<jsp:include page="Registration.jsp"></jsp:include>
			</c:if>
		</div>


		<%-- ${failureMessage} --%>
		<div>
<div style="text-align: center;">
			<c:if test="${InvalidCredentials==true}">
				
					<em>${errorMessage}</em>
				
			</c:if>
			</div>
			</div>
		
		<div id="Login">

			<c:if test="${userClickedLoginHere==true}">
				<jsp:include page="Login.jsp"></jsp:include>
			</c:if>
		</div>


		<div id="about">

			<c:if test="${userClickedAboutUs==true}">
				<jsp:include page="about.jsp"></jsp:include>
			</c:if>
		</div>

			<div id="productList">

			<c:if test="${userClickedproductList==true}">
				<jsp:include page="productList.jsp"></jsp:include>
				<%@ include file="adminHome.jsp" %>
			</c:if>
		</div>
		
		

		<div id="admin">
			<c:if test="${isAdmin==true}">
				<jsp:include page="/view/adminHome.jsp"></jsp:include>
			</c:if>
			</div>
			<div id="categories">
			<c:if test="${isAdminClickedCategories==true}">
			<jsp:include page="adminHome.jsp"></jsp:include>
							<%@ include file="/view/category.jsp" %>
						
			</c:if>
			</div>
			
			<div id="viewCart">
			<c:if test="${userclickedcart==true}">
			<%-- <%@ include file="/view/adminHome.jsp" %> --%>
			<jsp:include page="/view/viewCart.jsp"></jsp:include>
							
						
			</c:if>
			</div>
			
			
			
			<div id="suppliers">
			<c:if test="${isAdminClickedSuppliers==true}">
			<jsp:include page="adminHome.jsp"></jsp:include>
							<%@ include file="/view/supplier.jsp" %>
						
			</c:if>
			</div>
			
			<div id="products">
			<c:if test="${isAdminClickedProducts==true}">
			<jsp:include page="adminHome.jsp"></jsp:include>
							<%@ include file="/view/Product.jsp" %>
						
			</c:if>
			</div>
		<div id="thankCustomer">

			<c:if test="${userClickedCheckout==true}">
				<jsp:include page="/view/thankCustomer.jsp"></jsp:include>
			</c:if>
		</div>
		
		<div id="backHome">

			<c:if test="${clickedQuickBuy==true}">
			<%@ include file="/view/adminHome.jsp" %>
				<jsp:include page="Home.jsp"></jsp:include>
				
			</c:if>
		</div>
		

		<%@include file="/view/footer.jsp" %>
















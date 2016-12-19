<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.lead{
	color: blue;
	font-family : goudy old style;
}
.thumbnail{
   align-content : left;
}
.col-md-5{
   align-content : right;
}
</style>

<body>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Details</h1>


            <p class="lead">Here is the detail information of the product:</p>
        </div>

        <div class="container" >
        <!-- ng-app = "cartApp"> -->
            <div class="row">
                <div class="thumbnail">
								<img height="100px" width="100px" 
									src="<c:url value="D:\\Reddy\\ShoppingCartFrontEnd\\src\\main\\resources\\images\\${selectedProduct.productId }.jpg"></c:url>">
							</div>
                <div class="col-md-5">
                    <h3><strong>ProductName</strong>:${selectedProduct.productName}</h3>
                    <h4><strong>Description</strong>:${selectedProduct.description}</h4>
                    <h4><strong>Supplier</strong>: ${selectedProduct.supplier.supplierName}</h4>
                    <h4><strong>Category</strong>: ${selectedProduct.category.categoryName}</h4>
                    
                    <h4><strong>Price</strong>: Rs. ${selectedProduct.price}</h4>
                   

                    <br/>
					<div class="col-md-2">
						<a class="btn btn-danger btn-lg"
							href="checkoutDetails.obj">QuickBuy</a>
							
							</div>
					
					<div class="col-md-10">
						<a href="<spring:url value="/cartadd/${selectedProduct.productId}" />"<button class="btn btn-warning btn-lg">Add To Cart
								</button>></a>
					</div>
					
                </div>
            </div>
        </div>
        </div>
        </div>
        </body>
        </html>
        
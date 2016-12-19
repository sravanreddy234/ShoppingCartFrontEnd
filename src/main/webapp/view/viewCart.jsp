<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<body>
<c:choose>
<c:when test="${cartList==null}">
<div class="container">
				<div class="jumbotron">
		<a href="Home"><img alt="empty" src="D:\\emptycart.jpg"></a>	
				</div>
			</div>
			</c:when>
<c:otherwise>

<div class="container">
	
		<table class="table table-striped">
	

			<caption>Products In Cart</caption>
			<thead>
				<tr id="tr1">
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total</th>
					<!-- <th>CategoryId</th>
					<th>SupplierId</th> -->
					<!-- <th>OutOffStock</th>
					<th>Quantity</th>  -->
					<th>Image</th>
					<!-- <th>Edit</th>
					<th>Delete</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
					<tr id="tr1">
						<td id="td1"><c:out value="${cart.productID}" />
						<td id="td1"><c:out value="${cart.productName}" />
						<td id="td1"><c:out value="${cart.quantity}" />
						<td id="td1"><c:out value="${cart.productPrice}" />
						<td id="td1"><c:out value="${cart.total}" />
						<%-- <td id="td1"><c:out value="${product.supplierId}" /> --%> <%-- <td id="td1"><c:out value="${product.isOutOffStock}" />
						<td id="td1"><c:out value="${product.quantity}" /> --%>
						<td><div class="thumbnail">
								<img height="100px" width="100px" alt="${cart.productID }"
									src="<c:url value="D:\\Reddy\\ShoppingCartFrontEnd\\src\\main\\resources\\images\\${cart.productID }.jpg"></c:url>">
							</div> </td>
							<td><a
									href="<c:url value="/cart/remove/${cart.cart_id}"  />">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="col-md-12">
					<h3 style="text-align: center">
						Total: <span><i class="fa fa-inr" aria-hidden="true"></i>${sum}</span>
					</h3>
					<div class="col-md-10">
						<a href="backHome"><button class="btn btn-warning btn-lg">Continue
								Shopping</button></a>
					</div>
					<div class="col-md-2">
						<a class="btn btn-danger btn-lg"
							href="checkoutDetails.obj">Checkout</a>
							
							</div>
							</div>
							

	</div>
	</c:otherwise>
	</c:choose>
	</body>
	</html>

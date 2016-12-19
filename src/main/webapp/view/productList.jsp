<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="container">
	
		<table class="table table-striped">
	

			<caption>Products</caption>
			<thead>
				<tr id="tr1">
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>CategoryId</th>
					<th>SupplierId</th>
					<!-- <th>OutOffStock</th>
					<th>Quantity</th>  -->
					<th>Image</th>
					<!-- <th>Edit</th>
					<th>Delete</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productList}" var="product">
					<tr id="tr1">
						<td id="td1"><c:out value="${product.productId}" />
						<td id="td1"><c:out value="${product.productName}" />
						<td id="td1"><c:out value="${product.description}" />
						<td id="td1"><c:out value="${product.price}" />
						<td id="td1"><c:out value="${product.categoryId}" />
						<td id="td1"><c:out value="${product.supplierId}" /> <%-- <td id="td1"><c:out value="${product.isOutOffStock}" />
						<td id="td1"><c:out value="${product.quantity}" /> --%>
						<td><div class="thumbnail">
								<img height="100px" width="100px" alt="${product.productId }"
									src="<c:url value="D:\\Reddy\\ShoppingCartFrontEnd\\src\\main\\resources\\images\\${product.productId }.jpg"></c:url>">
							</div> 
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	
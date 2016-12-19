<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/table1.css" />">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Product</title>
</head>

<style>
form {
    border: 3px solid #f1f1f1;
}



input[type=text], input[type=password], input[type=email] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>

<script>
    $(document).ready(function(){

        $('.table').DataTable({
            "lengthMenu": [[1,2,3,5,10, -1], [1,2,3,5,10, "All"]]
        });
    });
</script>


<body>
			

	<div class="text-center myForm">
		<c:url var="addAction" value="product/add"></c:url>
		<form:form action="${addAction}" commandName="product"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td><form:label path="productId">
							<spring:message text="ID" />
						</form:label></td>
					<c:choose>
						<c:when test="${!empty product.productId }">
							<td><form:input path="productId" type="text" readonly="true" /></td>
						</c:when>

						<c:otherwise>
							<td><form:input path="productId" pattern=".{5,15}"
									required="true" type="text" title="id should contains 5 to 15 characters" /></td>
						</c:otherwise>
					</c:choose>
				
				<tr>
					<td>Name:</td>
					<td><form:input class="input" type="text" path="productName" /></td>
				</tr>
				
				<tr>
				<td>Description:</td>
				<td><form:input class="input" type="text" path="description" /></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><form:input class="input" type="text" path="price" /></td>
				</tr>

				<%-- <tr>
					<td>OutOffstock:</td>
					<td><form:input class="input" path="isOutOffStock" /></td>
				</tr>
				
				<tr>
					<td>Quantity:</td>
					<td><form:input class="input" path="quantity" /></td>
				</tr> --%>


				
				<tr>
					<td>CategoryId:</td>
					<td><form:select path="categoryId" required="true">
							<c:forEach items="${categoryList}" var="category">
								<form:option class="input"  value="${category.categoryId}">${category.categoryName}</form:option>
							</c:forEach>
						</form:select></td>
				</tr>
				
				
				
				
				
				<tr>
					<td>SupplierId:</td>
					<td><form:select path="supplierId" required="true">
							<c:forEach items="${supplierList}" var="supplier">
								<form:option class="input" value="${supplier.supplierId}">${supplier.supplierName}</form:option>
							</c:forEach>
						</form:select></td>
				</tr>
				<tr>
					<td>Image:</td>
					<td><form:input type="file"
							class=" btn btn-default btn-block form-control" path="imageUrl"
							required="true" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-primary" value="Save" /></td>
				</tr>
			</table>
		</form:form>
	</div>
	
	
	
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
					<th>Edit</th>
					<th>Delete</th>
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
							</div> <%-- <td id="td1"><a href="product/add/${product.productId }"><img
								alt="Edit" src="D:\images\edit1.jpg"></a>
						<td id="td1"><a href="product/remove/{id}/${product.productId }"><img
								alt="Delete" src="D:\images\del1.jpg"></a> --%>
						<td><a
							href="<c:url value="product/Update/${product.productId}"/>">Edit</a></td>
						<td><a
							href="<c:url value="product/Remove/${product.productId}"/>">Delete</a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	</div>

</body>
</html>
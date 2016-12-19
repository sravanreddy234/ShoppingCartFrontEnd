<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Suppliers</title>
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
<body>

	${SavedMsg} ${updateMsg} ${ErrorUpdateMsg}
	<h1>Add Suppliers</h1>
	<c:url var="addAction" value="supplier/add"></c:url>
	<form:form action="${addAction}" commandName="supplier">
		<table>
			<tr>
				<td><form:label path="supplierId">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty supplier.supplierId}">
						<td><form:input path="supplierId" readonly="true" /></td>
					</c:when>

					<c:otherwise>
						<td><form:input path="supplierId" pattern="{5,10}" required="true"
								title="id should be between 5 to 10 characters" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td><form:label path="supplierName">
						<spring:message text="name" />
					</form:label></td>
				<td><form:input path="supplierName" required="true" /></td>
			</tr>

			<tr>
				<td><form:label path="supplierAddress">
						<spring:message text="address" />
					</form:label></td>
				<td><form:input path="supplierAddress" required="true" /></td>
			</tr>
			
			<tr>
				<td><form:label path="supplierContact">
						<spring:message text="contact" />
					</form:label></td>
				<td><form:input path="supplierContact" required="true" /></td>
			</tr>
			
			<tr>
				<td><form:label path="supplierEmail">
						<spring:message text="email" />
					</form:label></td>
				<td><form:input path="supplierEmail" required="true" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty supplier.supplierName}">
						<input type="submit"
							value="<spring:message text="Edit suppliers"/> ">
					</c:if> <c:if test="${empty supplier.supplierName}">
						<input type="submit"
							value="<spring:message text="Add suppliers"/> ">
					</c:if></td>

			</tr>
		</table>
	</form:form>
	<br>


	<h3>Supplier List</h3>
	<div class="container">
	<c:if test="${!empty supplierList}">
	<table class="table table-striped">
	<thead>
			<tr>
				<th width="80">Supplier Id</th>
				<th width="120">Supplier Name</th>
				<th width="120">Supplier Address</th>
				<th width="120">Supplier Contact</th>
				<th width="120">Supplier Email</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			</thead>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.supplierId}</td>
					<td>${supplier.supplierName}</td>
					<td>${supplier.supplierAddress}</td>
					<td>${supplier.supplierContact}</td>
					<td>${supplier.supplierEmail}</td>
					<td><a href="<c:url value="supplier/Update/${supplier.supplierId}"/>">Edit</a></td>
					<td><a href="<c:url value="supplier/Remove/${supplier.supplierId}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


</body>
</html>
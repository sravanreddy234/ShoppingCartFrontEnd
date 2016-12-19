<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

${SavedMsg}

${updateMsg}
${ErrorUpdateMsg}
<h1>Add Category</h1>
<c:url var="addAction" value="category/add"></c:url>
<form:form action="${addAction}" commandName="category">
<table>
	<tr>
			<td><form:label path="categoryId"> <spring:message text="ID"/></form:label></td>
					<c:choose>
							<c:when test="${!empty category.categoryId}">
							<td><form:input path="categoryId" readonly="true"/> </td>
							</c:when>
									
							 <c:otherwise>
							 <td><form:input path="categoryId" pattern="{5,10}" required="true" title="id should be between 5 to 10 characters"/> </td>
							 </c:otherwise>
					</c:choose>
			</tr>
		<tr>
			<td><form:label path="categoryName"> <spring:message text="name"/></form:label></td>
			<td><form:input path="categoryName" required="true"/> </td>
		</tr>
		
		<tr>
			<td><form:label path="categoryDescription"> <spring:message text="description"/></form:label></td>
			<td><form:input path="categoryDescription" required="true"/> </td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${!empty category.categoryName}">
			<input type="submit" value="<spring:message text="Edit category"/> "> 
			</c:if>
			<c:if test="${empty category.categoryName}">
			<input type="submit" value="<spring:message text="Add category"/> "> 
			</c:if>
			</td>

		</tr>
</table>
</form:form>
<br>


<h3>Category List</h3>
	<c:if test="${!empty categoryList}">
		<table class="tg">
		<tr>
				<th width="80">Category Id</th>
				<th	width="120">Category Name</th>
				<th width="120">Category Description</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
		</tr>
		<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.categoryId}</td>
				<td>${category.categoryName}</td>
				<td>${category.categoryDescription}</td>
				<td><a href="<c:url value="category/Update/${category.categoryId}"/>">Edit</a></td>
				<td><a href="<c:url value="category/Remove/${category.categoryId}"/>">Delete</a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>


</body>
</html> --%>







<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Categories</title>
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

${SavedMsg}

${updateMsg}
${ErrorUpdateMsg}
<h1>Add Category</h1>
<c:url var="addAction" value="category/add"></c:url>
<form:form action="${addAction}" commandName="category">
<table>
	<tr>
			<td><form:label path="categoryId"> <spring:message text="ID"/></form:label></td>
					<c:choose>
							<c:when test="${!empty category.categoryId}">
							<td><form:input path="categoryId" type="text" readonly="true"/> </td>
							</c:when>
									
							 <c:otherwise>
							 <td><form:input path="categoryId" type="text" pattern="{5,10}" required="true" title="id should be between 5 to 10 characters"/> </td>
							 </c:otherwise>
					</c:choose>
			</tr>
		<tr>
			<td><form:label path="categoryName"> <spring:message text="name"/></form:label></td>
			<td><form:input path="categoryName" type="text" required="true"/> </td>
		</tr>
		
		<tr>
			<td><form:label path="categoryDescription"> <spring:message text="description"/></form:label></td>
			<td><form:input path="categoryDescription" type="text" required="true"/> </td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${!empty category.categoryName}">
			<input type="submit" value="<spring:message text="Edit category"/> "> 
			</c:if>
			<c:if test="${empty category.categoryName}">
			<input type="submit" value="<spring:message text="Add category"/> "> 
			</c:if>
			</td>

		</tr>
</table>
</form:form>
<br>
<div class="container">
  <c:if test="${!empty categoryList}">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Category Id</th>
        <th>Category Name</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
      <c:forEach items="${categoryList}" var="category">
    </thead>
    <tbody>
      <tr>
        <td>${category.categoryId}</td>
				<td>${category.categoryName}</td>
				<td>${category.categoryDescription}</td>
				<td><a href="<c:url value="category/Update/${category.categoryId}"/>">Edit</a></td>
				<td><a href="<c:url value="category/Remove/${category.categoryId}"/>">Delete</a></td>
      </tr>
      </c:forEach>
      
    </tbody>
  </table>
  </c:if>
</div>

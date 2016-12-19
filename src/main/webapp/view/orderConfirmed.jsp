<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!-- Css -->
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/images" var="images" />
<!-- JavaScript -->
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body>
	<div class="container-fluid">
		

		<div class="content">
			<div class="container">
				<div class="jumbotron">
					<h1>Order Confirmed,Product will be delivered shortly.</h1>
					<form:form><input type="submit" name="_eventId_finalHome"  value="Home" class="btn btn-lg btn-info"></form:form>
					
				
				</div>


			</div>
		</div>
		<%-- <%@include file="../shared/footer.jsp"%> --%>
	</div>
</body>



</html>
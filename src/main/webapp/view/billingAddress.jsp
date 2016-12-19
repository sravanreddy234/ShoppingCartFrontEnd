<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
			<div class="panel panel-primary">
				<div class="panel-heading">Billing Address</div>
				<div class="panel-body">
					<form:form class="form-horizontal" commandName="billingAddress">
						<div class="form-group">
							<label for="" class="control-label col-sm-2">streetName</label>
							<div class="col-sm-10">
							<form:errors path="streetName" class="error"/>
								<form:input path="streetName" type="text" autofocus="true" class="form-control" required="true"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="control-label col-sm-2">apartmentNumber</label>
							<div class="col-sm-10">
							<form:errors path="apartmentNumber" class="error"/>
								<form:input path="apartmentNumber" type="text" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="" class="control-label col-sm-2">City</label>
							<div class="col-sm-10">
							<form:errors path="city" class="error"/>
								<form:input path="city" type="text" class="form-control" required="true"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="control-label col-sm-2">State</label>
							<div class="col-sm-10">
							<form:errors path="state" class="error"/>
								<form:input path="state" type="text" class="form-control" required="true"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="control-label col-sm-2">Country</label>
							<div class="col-sm-10">
							<form:errors path="country" class="error"/>
								<form:input path="country" type="text" class="form-control" required="true"/>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="control-label col-sm-2">Zip code</label>
							<div class="col-sm-10">
							<form:errors path="zipCode" class="error"/>
								<form:input path="zipCode" type="text" pattern="^[1-9][0-9]{5}$" title="Enter a 6 digit pincode" required="true" class="form-control" />
							</div>
						</div>
						<div class="col-md-offset-3">
						<input type="submit" name="_eventId_submitBillingAddress"
							class="btn btn-md btn-success" value="Save">
						<input type="submit" name="_eventId_cancel"
							class="btn btn-md btn-danger" value="cancel"></div>
					</form:form>
				</div>
			</div>
		</div>
		<%-- <%@include file="../shared/footer.jsp"%> --%>
	</div>
</body>
</html>
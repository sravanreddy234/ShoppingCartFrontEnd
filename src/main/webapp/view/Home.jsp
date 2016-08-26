<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping cart</title>


</head>
<body>
${message}
<a href="Login"> Login Here </a>
<a href="Register">New User</a>
<hr color="blue">
<c:if test="${userClickedRegisterHere}==true">


<jsp:include page="Registration.jsp"></jsp:include>
</c:if>
<c:if test="${userClickedLoginHere}==true">
<jsp:include page="Login.jsp"></jsp:include>
</c:if>

</body>
</html>
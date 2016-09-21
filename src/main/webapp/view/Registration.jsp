<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
this is registration
<form action="register"  onsubmit="Submit" method="post" commandName="userDetails">

id:<input type="text" name="id" >
Username:<input type="text" name="name"><br>
Password:<input type="password" name="password"><br>
Email:<input type="email" name="email"><br>
Address:<input type="text" name="contact"><br>
Contact:<input type="text" name="address"><br><br>

<input type="submit" value="Submit">



</form>
</body>
</html>
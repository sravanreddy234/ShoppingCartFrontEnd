<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <!DOCTYPE html>
<html>
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

<h2>Registration Form</h2>

<form:form action="register" commandName="userDetails" method="POST">
  

  <div class="container">
  
  	<label><b><span class="glyphicon glyphicon-info-sign">UserId</b></label>
    <input type="text" placeholder="Enter UserId" name="id" required>
  
    <label><b><span class="glyphicon glyphicon-user">Username</span></b></label>
    <input type="text" placeholder="Enter Username" name="name" required>

    <label><b><span class="glyphicon glyphicon-lock">Password</span></b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
    
    <label><b><span class="glyphicon glyphicon-envelope">Email</span></b></label>
    <input type="email" placeholder="Enter EmailId" name="email" required>
    
    <label><b><span class="glyphicon glyphicon-earphone">Contact</span></b></label>
    <input type="text" placeholder="Enter Contact number" name="contact" required>
    
    <label><b><span class="glyphicon glyphicon-pencil">Address</span></b></label>
    <input type="text" placeholder="Enter Address" name="address" required>
        
    <button type="submit">SignUp</button>
    

  
    
  </div>
</div>
</form:form>

</body>
</html>
      

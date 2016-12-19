 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <!DOCTYPE html>
<html>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
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

<h2>Login Form</h2>

<form:form action="login" commandName="userDetails" method="POST">
  <!-- <div class="imgcontainer">
    <img src="E:/10.jpg" alt="Avatar" class="avatar">
  </div> -->

  <div class="container">
    <label><b><span class="glyphicon glyphicon-user">UserId</span></b></label>
    <input type="text" placeholder="Enter UserId" name="id" required>

    <label><b><span class="glyphicon glyphicon-lock">Password</span></b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
    

  
    
  </div>

</form:form>

</body>
</html>
      
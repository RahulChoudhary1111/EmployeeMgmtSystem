<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    
    <%
       if(request.getParameter("submit")!=null){
    	   String name = request.getParameter("name");
    	   String address = request.getParameter("address");
    	   String mobile_no = request.getParameter("mobile number");
    	   String email = request.getParameter("email");
    	   String password = request.getParameter("password");
    	   Connection con;
    	   PreparedStatement ps;
    	   ResultSet rs;
    	   
    	   try {
    	        Class.forName("org.postgresql.Driver");
    	        con = DriverManager.getConnection("jdbc:postgresql://localhost/abc", "postgres", "123");
    	        ps = con.prepareStatement("INSERT INTO user_details(name, address, mobile_no, email, password) VALUES (?, ?, ?, ?, ?)");
    	        ps.setString(1, name);
                ps.setString(2, address);
                ps.setString(4, email);
                ps.setString(3, mobile_no);
                ps.setString(5, password);
                ps.executeUpdate();
               
    	   } catch (SQLException e) {
               out.println("<p>Error: " + e.getMessage() + "</p>");
           }
    	%>   
    	   <script>
           
    	   alert("Record Added!");
</script>
    	   
   <% 	   
       }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
      .open-login {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: scroll;
  top: 90px;
  left: 28px;
  width: 180px;
}
.open-register {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: scroll;
  top: 150px;
  left: 28px;
  width: 180px;
}
 .container{
   display:none;
   overflow: auto;
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   padding-top: 60px;
   font-size:20px;
}
.register{
   display:none;
   overflow: auto;
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   padding-top: 60px;
   font-size:20px;
}
   /* Modal Content/Box */
.modal-content {
  background-color:#fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 2px solid #888;
  width: 38%; /* Could be more or less, depending on screen size */
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

   input[type=text], input[type=password], input[type=number], input[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid dodgerblue;
  box-sizing: border-box;
}

.model {
  padding: 20px;
}
   button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}
.red{
   background-color: red;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}
.image {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

button:hover {
  opacity: 0.8;
}
</style>
</head> 
<body>

   <h1>Home</h1>
   
    <button class="open-login" onclick="document.getElementById('id01').style.display='block'">Login</button>
	<button class="open-register" onclick="document.getElementById('id02').style.display='block'">Register</button>
	
	<div id="id01" style="display:none" class="container">
		<form class="modal-content animate" action="Login.jsp" method="post">
		<div class = "image">
		 <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
		   </div>
		<div class = "model">
		   <h2>Login</h2>
			<label>Email:</label><br>
			<input type="email" name="email" placeholder="Enter email" maxlength="15" title="Enter in valid format and not more than 15 characters" id="email" required>
			<br>
			<br>
			<label>Password:</label><br>
			<input type="password" name="password" placeholder="Enter password" id="password" required>
			<br>
			<br>
			<button type="submit" value="submit">Login</button>
			<button type="button" class = "red" onclick="document.getElementById('login-form').style.display='none'">Cancel</button>
		</div>
		</form>
		 <% String message = (String)request.getAttribute("message"); %>
         <% if (message != null) { %>
          <script>
            alert("<%= message %>");
          </script>
       
          <% String eml = "Invalid email";
          if(message == eml){%>
          <style type="text/css">
           input[type=email]{
              border: 1px solid red;
              }
           </style>
           <%} else{ %>
             <style type="text/css">
           input[type=password]{
              border: 1px solid red;
              }
           </style>
           <%} %>
         <% } %>
	</div>
	
	<div id="id02" style="display:none" class="register">
		<form class="modal-content animate" action="#" method="post">
		<div class = "image">
		 <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
		    </div>
		<div class = "model">
		    <h2>Register</h2>
		    <label>Name:</label><br>
			<input type="text" name="name" placeholder="Enter name" required>
			<br>
			<label>Address:</label><br>
			<input type="text" name="address" placeholder="Enter address" required>
			<br>
			<label>Email:</label><br>
			<input type="email" name="email" placeholder="Enter email" maxlength="15" title="Enter in valid format and not more than 15 characters" required>
			<br>
			<label>Mobile No:</label><br>
			<input type="number" name="mobile number" placeholder="Enter mobile no" maxlength="10" required>
			<br>
			<label>Password:</label><br>
			<input type="password" name="password" placeholder="Enter password" required>
			<br>
			<button type="submit" value="submit" name="submit">Register</button>
			<button type="button" class = "red" onclick="document.getElementById('register-form').style.display='none'">Cancel</button>
			</div>
		</form>
	</div>
	<script>
// Get the container
var container = document.getElementById('id01');
var register = document.getElementById('id02');

// When the user clicks anywhere outside of the container, close it
window.onclick = function(event) {
    if (event.target == container) {
        container.style.display = "none";
    }else if(event.target == register){
    	register.style.display = "none";
    }
}
</script>

</body>
</html>
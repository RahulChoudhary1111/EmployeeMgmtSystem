<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
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
 	        ps = con.prepareStatement("update user_details set name = ?, address = ?, mobile_no = ?, email = ?, password = ? where user_id = ?");
 	        ps.setString(1, name);
             ps.setString(2, address);
             ps.setString(4, email);
             ps.setString(3, mobile_no);
             ps.setString(5, password);
             ps.setInt(6, id);
             ps.executeUpdate();
            
 	   } catch (SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
 	   response.sendRedirect("welcome.jsp");
 	%>   
 	   <script>
        
 	   alert("Record Updated!");
</script>
 	   
<% 	   
    }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Info</title>
<style type="text/css">
 .container{
   width:400px;
   margin:auto;
   padding:50px;
   border: 5px solid #aaa;
   border-radius:10px;
   padding:20px;
   font-size:20px;
   background-color: white;
   }
   input[type=text], input[type=password], input[type=number], input[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
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

button:hover {
  opacity: 0.8;
}
</style>
</head>
<body>
      <h1 align = "center">Registration Update</h1>
      <div  class="container">
		
		<form action="#" method="post">
		
		<%
		   Connection con;
	 	   PreparedStatement ps;
	 	   ResultSet rs;
	 	   Class.forName("org.postgresql.Driver");
	       con = DriverManager.getConnection("jdbc:postgresql://localhost/abc", "postgres", "123");
	        
		   ps = con.prepareStatement("SELECT * FROM user_details WHERE user_id=?");
           ps.setInt(1, id);
           rs = ps.executeQuery();
           while(rs.next()){
        	   
   		%>
		
		<label>Name:</label><br>
			<input type="text" name="name" value="<%=rs.getString("name")%>" required>
			<br>
			<label>Address:</label><br>
			<input type="text" name="address" value="<%=rs.getString("address")%>" required>
			<br>
			<label>Email:</label><br>
			<input type="email" name="email" value="<%=rs.getString("email")%>" maxlength="15" title="Enter in valid format and not more than 15 characters" required>
			<br>
			<label>Mobile No:</label><br>
			<input type="number" name="mobile number" value="<%=rs.getString("mobile_no")%>" maxlength="10" required>
			<br>
			<label>Password:</label><br>
			<input type="password" name="password" value="<%=rs.getString("password")%>" required>
			<br>
			<% } %>
			<button type="submit" value="submit" name="submit">Update</button>
			<p><a href=welcome.jsp>Click here to go back</a></p>
			
		</form>
	</div>
</body>
</html>
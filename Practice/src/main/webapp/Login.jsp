<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.*" %>
    
    
    <!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>login</title>
	</head>
	<body>
	
    
    <%
	    
	 	   String email = request.getParameter("email");
	 	   String password = request.getParameter("password");
	 	   Connection con;
	 	   PreparedStatement ps;
	 	   ResultSet rs;
	 	  
	 	   try {
	 	        Class.forName("org.postgresql.Driver");
	 	        con = DriverManager.getConnection("jdbc:postgresql://localhost/abc", "postgres", "123");
	 	        ps = con.prepareStatement("SELECT * FROM user_details WHERE email=?");
	 	        
	 	       ps.setString(1, email);
               rs = ps.executeQuery();
               
               if (rs.next()){
                   String hashedPassword = rs.getString("password");
                   if (password.equals(hashedPassword)) {
                	   request.getRequestDispatcher("welcome.jsp").forward(request, response);
                   } else {
                       request.setAttribute("message", "Invalid password");
                       
                       //out.println("<script>document.getElementById('password').style.borderColor = 'red';</script>");
                       request.getRequestDispatcher("Index.jsp").forward(request, response);
                   }
               } else {
                   request.setAttribute("message", "Invalid email");
                   //out.println("<script>document.getElementById('email').style.borderColor = 'red';</script>");
                   request.getRequestDispatcher("Index.jsp").forward(request, response);
               }
             
            } catch (Exception e) {
	              out.println("<p>Error: " + e.getMessage() + "</p>");
	          }
	 	  	    
    
     %>
     
     </body>
  </html>
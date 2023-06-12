<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style type="text/css">
  .open-records {
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
 
   table {
			border-collapse: collapse;
			width: 100%;
			margin-bottom: 1rem;
			background-color: #fff;
			box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
			font-size: 1rem;
			font-weight: 400;
			line-height: 1.5;
			color: #212529;
		}
   th, td {
			padding: 0.75rem;
			vertical-align: middle;
			border-top: 1px solid #dee2e6;
		}

		th {
			background-color: #f8f9fa;
			border-bottom: 2px solid #dee2e6;
			text-align: left;
			font-weight: 500;
		}

		tr:hover {
			background-color: #f2f2f2;
		}

		tr:nth-child(even) {
			background-color: #f8f9fa;
		}

		td:last-child {
			text-align: center;
		}
</style>
</head>
<body>
      <%
       String email = request.getParameter("email");
       Connection con;
	   PreparedStatement ps;
	   ResultSet rs;
	   Class.forName("org.postgresql.Driver");
	        con = DriverManager.getConnection("jdbc:postgresql://localhost/abc", "postgres", "123");
	        ps = con.prepareStatement("SELECT * FROM user_details WHERE email=?");
	        ps.setString(1, email);
	        rs = ps.executeQuery();
	        if(rs.next()){
	        	
	        	String name = rs.getString("name");
      %>
      
       <h2> <%= "Welcome "+ name %> </h2> 
      
      <%
	        }
      %>
	  
      
      <table>
      <tr>
          <th>Name</th>
          <th>Address</th>
          <th>Email</th>
          <th>MobileNo</th>
          <th>Password</th>
          <th>Edit</th>
          <th>Delete</th>
      </tr>
      
      <%
       String sql = "select * from user_details";
       Statement st = con.createStatement();
       rs = st.executeQuery(sql);
       
       while(rs.next()){
    	   
    	   int userid = rs.getInt("user_id");
      
      %>
      
      <tr>
          <td><%=rs.getString("name") %></td>
          <td><%=rs.getString("address")%></td>
          <td><%=rs.getString("email")%></td>
          <td><%=rs.getString("mobile_no")%></td>
          <td><%=rs.getString("password")%></td>
          <td><a href="update.jsp?id=<%=userid%>">Edit</a></td>
          <td><a href="delete.jsp?id=<%=userid%>">Delete</a></td>
      </tr>
      
      <%
      
       }
       
      %>
      </table>
      
    </body>
</html>
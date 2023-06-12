 <%@ page import="java.sql.*" %>
    <%
       int id = Integer.parseInt(request.getParameter("id"));
   
 	   Connection con;
 	   PreparedStatement ps;
 	   
 	   try {
 	        Class.forName("org.postgresql.Driver");
 	        con = DriverManager.getConnection("jdbc:postgresql://localhost/abc", "postgres", "123");
 	        ps = con.prepareStatement("DELETE FROM user_details WHERE user_id= ?");
 	       
             ps.setInt(1, id);
             ps.executeUpdate();
             response.sendRedirect("welcome.jsp");
            
 	   } catch (SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
 	%>   
 	   <script>
        
 	   alert("Record Deleted!");
</script>
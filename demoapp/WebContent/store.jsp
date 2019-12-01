
<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<%

  String url = "jdbc:mysql://localhost:3306/socialnetwork";
  String dbuname = "root";
  String dbpass = "password";
  String username = request.getParameter("name");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  
 
 
 //out.println(username+email+password);
 
 try{
	 
	    Class.forName("com.mysql.jdbc.Driver");
		Connection con =  DriverManager.getConnection(url,dbuname,dbpass);
		//Statement st = con.createStatement();
		//ResultSet rs =  st.executeQuery(query);  
		//rs.next();
		//String name = rs.getString("username");
		//out.println(name);
		
	    PreparedStatement ps = con.prepareStatement("insert into users (username,email,password) values(?,?,?)");
		ps.setString(1,username);
		ps.setString(2,email);
		ps.setString(3,password);
		
		int x = ps.executeUpdate();
		
		if(x!=0)
		{
			out.println("SIGNUP SUCCESSFULL");
		}
		else
		{
			out.println("SIGNUP UNSUCCESSFULL");
		}
				
	 
 }
 catch(Exception e){
	 out.println(e);
 }
 

 %> 	  
    
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title></title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->
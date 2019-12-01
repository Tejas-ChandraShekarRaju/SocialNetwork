package demoapp;

import java.sql.*;

public class Demodb {

	public static void main(String[] args) throws Exception {
		
		
		// TODO Auto-generated method stub
		
		String url = "jdbc:mysql://localhost:3306/testdatabase";
		String uname = "root";
		String pass = "password";
		//String query = "insert into users values (2,'windows','nulll','windows@gmail.com')";
		String username = "pascal",password="exnull",email="pascal@gmail.com",userid="3";
		//String query = "insert into users values("+userid+ "+"username,password,email)"; 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =  DriverManager.getConnection(url,uname,pass);
		Statement st = con.createStatement();
		//ResultSet rs =  st.executeQuery(query); //this is for dql  
		//rs.next();
		//String name = rs.getString("username");
		//System.out.println(name);
		
		//int count = st.executeUpdate(query);
		//System.out.println(count);
		
		st.close();
		con.close();	
	}

}

package com.cj.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try 
		 {
	      int x=0;		 
		  PrintWriter out = response.getWriter();
		  String url = "jdbc:mysql://localhost:3306/fseven";
		  String dbuname = "root";
		  String dbpass = "password";
		  String username = request.getParameter("name");
		  String firstname = request.getParameter("firstname");
		  String lastname = request.getParameter("lastname");
		  String profession = request.getParameter("profession");
		  String place = request.getParameter("place");
		  String dob = request.getParameter("dob");
		  String email = request.getParameter("email");
		  String password = request.getParameter("password");
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con =  DriverManager.getConnection(url,dbuname,dbpass);
		  
		 
		  
			  PreparedStatement ps = con.prepareStatement("insert into users (username,email,userpassword,first_name,last_name,profession,place,dob) values(?,?,?,?,?,?,?,?)");
			  ps.setString(1,username);
			  ps.setString(2,email);
			  ps.setString(3,password);
			  ps.setString(4,firstname);
			  ps.setString(5,lastname);
			  ps.setString(6,profession);
			  ps.setString(7,place);
			  ps.setString(8,dob);
			  x = ps.executeUpdate(); 
			  System.out.println(x);
		  
		  
			  
		  
			if(x!=0)
			{
				out.println("SIGNUP SUCCESSFULL");
				response.sendRedirect("login.jsp");
				
			}
			else
			{
				
				response.sendRedirect("index.html");
				out.println("SIGNUP UNSUCCESSFULL");
			}
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 }

}

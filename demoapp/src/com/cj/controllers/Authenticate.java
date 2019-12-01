package com.cj.controllers;

import com.cj.models.UserInfo;
import java.util.*;

import java.io.IOException;
import java.sql.*;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		  // UserInfo userinfo = new UserInfo();
		   
		   String user = request.getParameter("username");
		   String pass = request.getParameter("password");
		   HttpSession session = request.getSession();
		   session.setAttribute("currentuser", user);
		   System.out.println(user);
		   System.out.println(pass);
		   try 
		   {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fseven","root","password");  
	        Statement st=con.createStatement();
	        ResultSet rs=st.executeQuery("select * from users where username='"+user+"' and userpassword='"+pass+"'");
	        int count=0;
	        
	           		while(rs.next())
	           		{
	           			count++;
	           		}
	           		if(count>0)
	           		{
	           			try 
	           			{
	           				List<String> users = new ArrayList<>();
	           				String query = "SELECT username FROM users WHERE username <>"+user;
	           			     st = con.createStatement();
	           			     ResultSet ur = st.executeQuery(query);
	           			     ur.next();
	           			     	while(ur.next())
	           			     	{
	           			     		int i = 0;
	           			     		users.add(ur.getString("username"));
	           			     		i++;
	           			     	}
	           			    request.setAttribute("users",users); 	
	           				
	           			}
	           			catch(Exception e)
	           			{
	           				System.out.println(e);
	           			}
	           			rs.beforeFirst();
	           			rs.next();
	           			request.setAttribute("currentuser", user);
	           			System.out.println("Authenticated");
	           			request.setAttribute("profession", rs.getString("profession"));
	           			request.setAttribute("place", rs.getString("place"));
	           			request.setAttribute("dob", rs.getDate("dob"));
	           			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
	          
	           			rd.forward(request,response);
	          
	           		}
	       else{
	     	 // out.println("working");
	        
	        response.sendRedirect("login.jsp");
	        
	       }
		} 
		   catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
 	       
     }
	public static UserInfo loadUserInfo(ResultSet r)
	{
		UserInfo ui = new UserInfo();
		
		
		
		
		return ui;
	}

		

	

}



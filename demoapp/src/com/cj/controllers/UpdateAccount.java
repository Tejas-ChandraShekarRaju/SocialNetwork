package com.cj.controllers;

import java.io.IOException;
import com.cj.controllers.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateAccount
 */
@WebServlet("/UpdateAccount")
public class UpdateAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		  String username =  (String) session.getAttribute("currentuser");
		  String firstname = request.getParameter("firstname");
		  String lastname = request.getParameter("lastname");
		  String profession = request.getParameter("profession");
		  String place = request.getParameter("place");
		  String dob = request.getParameter("dob");
		  String email = request.getParameter("email");
		  System.out.println(username+ email+firstname+lastname+profession+place+dob);
		  try {
			int x =(int)AllFunctions.updateAccount(username, email, firstname, lastname, profession, place, dob);
			if(x==1)
			{
				request.setAttribute("currentuser", username);
	 			request.setAttribute("profession", profession);
	 			request.setAttribute("place", place);
	 			request.setAttribute("dob", dob);
	 			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
	 			rd.forward(request,response);
			}
			else response.sendRedirect("accountupdate.jsp?currentuser="+username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		    
		 
	}

}

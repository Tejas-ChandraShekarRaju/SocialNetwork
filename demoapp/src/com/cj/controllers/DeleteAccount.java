package com.cj.controllers;

import java.io.IOException;
import com.cj.controllers.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String username = session.getAttribute("currentuser").toString();
		String feedback = (String)request.getParameter("feedback");
		try {
			boolean isDeleted = AllFunctions.deleteAccount(username, feedback);
				if(isDeleted)
				{
					response.sendRedirect("index.html");
				}
				else
				{
					response.sendRedirect("deleteAccount.jsp");
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

package com.cj.controllers;

import com.cj.controllers.*;
import java.io.IOException;
import com.cj.controllers.AllFunctions;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sendFriendRequest
 */
@WebServlet("/sendFriendRequest")
public class sendFriendRequest extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession session = request.getSession();
			String currentuser = (String) session.getAttribute("currentuser");
		    String toUser  = request.getParameter("username");
		    try {
				boolean isRequestSent =AllFunctions.sendRequest(currentuser, toUser);
				if(isRequestSent)
				{
					System.out.println("friend request sent from sendFriendRequest");
				}
				else
				{
					System.out.println("Unsuccessful from sendFriendRequest");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		     
		
	}

	

}

package com.cj.controllers;
import com.cj.controllers.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StorePosts
 */
@WebServlet("/StorePosts")
public class StorePosts extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String currentuser = (String) session.getAttribute("currentuser");
		String postBody = request.getParameter("post");
		try {
			AllFunctions.storePosts(currentuser, postBody);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package demoapp;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add")
public class addServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		PrintWriter out = res.getWriter();
		//out.print("HII");
		
		
		//ServletConfig config = getServletConfig();
		//String str = config.getInitParameter("name");
		
		//out.print(str);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
////		ServletContext context = getServletContext();
////		String str = context.getInitParameter("name");
//		
//		out.println(str);
//		
		
		
		int a = Integer.parseInt(req.getParameter("num1"));
		int b = Integer.parseInt(req.getParameter("num2"));
		
		
		  int k = a+b;
		  
		  out.println("<html><body bgcolor='cyan'>");
			out.println("result is"+k);
			out.print("</body></html>");
		  
		 // HttpSession session = req.getSession();
		  //session.setAttribute("k", k); 
		  
		 // Cookie cookie = new Cookie("k",k+"");
		  //res.addCookie(cookie);
		  
		  //res.sendRedirect("sq");
		  //res.sendRedirect("sq?k="+k); redirecting to another page
		  //req.setAttribute("k", k); 
		  //PrintWriter out = res.getWriter();
			//out.println("Dispatching request");
		  //RequestDispatcher rd = req.getRequestDispatcher("sq");	
		
		  //rd.forward(req,res);
		
		//System.out.println("Answer is"+k);
		//PrintWriter out = res.getWriter();
		
		
			
		  
		  //System.out.println("sq called");
	}

}

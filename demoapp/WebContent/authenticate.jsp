<%@page import="java.sql.*"%>
<%
try{
		   String user=request.getParameter("username");
		   String pass=request.getParameter("password");
		   //System.out.println(user);
		   //System.out.println(pass);
 		   Class.forName("com.mysql.jdbc.Driver").newInstance();
    	   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","password");  
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from users where username='"+user+"' and password='"+pass+"'");
           int count=0;
           while(rs.next()){
           count++;
          }
          if(count>0){
          // response.sendRedirect("home.jsp");
        	  request.setAttribute("name", user);
             // System.out.println(request.getParameter("username"));
              RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
             
              rd.forward(request,response);
             
           }
          else{
        	 // out.println("working");
           
           response.sendRedirect("login.jsp");
           
          }
        }
    catch(Exception e){
    System.out.println(e);
}
%>
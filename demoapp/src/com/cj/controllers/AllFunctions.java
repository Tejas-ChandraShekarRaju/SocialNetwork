package com.cj.controllers;

import java.util.*;
import java.sql.*;

public class AllFunctions {
	
	public static String sqlUsername = "root";
	public static String url = "jdbc:mysql://localhost:3306/fseven";	
	public static String sqlPassword = "password";
	
	public static void main(String[] args) throws Exception
	{
		//getPendingRequests("sarosh");
		//getNewsFeed("yashasav");
		//deleteAccount("nil","what a shitty site");
		//System.out.println(getUserId("tejas"));
		//updateAccount("tejas", "t3ejascj94@gmail.com" ,"tejasc" ,"cjj","studenrt"," bangalore "," 1998-10-22" );
	}
	
	public static Connection mysqlConnect() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con =  DriverManager.getConnection(url,sqlUsername,sqlPassword);
		return con;
	}
	
	public static ArrayList getMembersDirectory(String username) throws Exception
	{
		System.out.println(username);
		ArrayList<String> members = new ArrayList<String>();
		ArrayList<String> friends = getFriendsList(username);
		ArrayList<String> sentRequestList = getSentRequestsList(username);
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String query = "select username from users";
		ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				
				if(!(friends.contains(rs.getString("username"))) && !username.equals(rs.getString("username")) && !sentRequestList.contains(rs.getString("username")))
				{
					
				      members.add(rs.getString("username"));
					
					
				}
				
			}
		
		System.out.println(members);
		
		return members;
	}
	
	public static ArrayList getFriendsList(String username) throws Exception
	{
		ArrayList<String> userlist = new ArrayList<>();
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String userId = getUserId(username);
		String query = "select username from users where user_id in (select userid_one from friends where userid_two ='"+userId+"' and status=1 union select userid_two from friends where userid_one ='"+userId+"' and status = 1 )";
;
        ResultSet rs = st.executeQuery(query);
        
        
        while(rs.next())
        {
        	
        	userlist.add(rs.getString("username"));
        	
        }
        
        	
		return userlist;
		
		
	}
	
	public static ArrayList getPendingRequests(String username) throws Exception
	{
		ArrayList<String> pendingRequests = new ArrayList<>();
		Connection con = mysqlConnect();
		String userId = getUserId(username);
		String query = "select username from users where user_id in (select userid_one from friends where userid_two ='"+userId+"' and status=0 and action_user !='"+userId+"' union select userid_two from friends where userid_one ='"+userId+"' and status = 0 and action_user !='"+userId+"')";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		int i =0;
			while(rs.next() && i!=3)
			{
				pendingRequests.add(rs.getString("username"));
				i++;
			}
			System.out.println("from pendingrequests"+pendingRequests);
		
		
		return pendingRequests;
	}
	
	
	public static ArrayList getSentRequestsList(String username) throws Exception
	{
		ArrayList<String> sentRequestList = new ArrayList<>();
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String userId = getUserId(username);
		String query = "select username from users where user_id in (select userid_one from friends where userid_two ='"+userId+"' and status=0 union select userid_two from friends where userid_one ='"+userId+"' and status = 0 )";

        ResultSet rs = st.executeQuery(query);
        
        
        while(rs.next())
        {
        	
        	sentRequestList.add(rs.getString("username"));
        	
        }
        
        	
		
		
		return sentRequestList;
	}
	
	public static boolean sendRequest(String username1,String username2) throws Exception
	{
		//if(username1>)
		
		Connection con =mysqlConnect();
		PreparedStatement ps = con.prepareStatement("insert into friends (userid_one,userid_two,status,action_user) values(?,?,?,?)");
		String userone = getUserId(username1);
		String action_user = userone;
		String usertwo = getUserId(username2);
		if(Integer.parseInt(userone)>Integer.parseInt(usertwo))
		{
			String temp = usertwo;
			usertwo = userone;
			userone = temp;
		}
		
		ps.setString(1,userone);
		ps.setString(2,usertwo);
		ps.setString(3, "0");
		ps.setString(4,action_user);
		int x = ps.executeUpdate();
			if(x==1)
			{
				System.out.println(" Friend request successful from allfunctions");
				return true;
			}
			else {
				System.out.println(" unsuccessful from allfunctions");
				return false;
			}
		
			
		
	}
	
	public static void acceptRequest(String username1,String username2) throws Exception
	{
		Connection con =mysqlConnect();
		
		String userone = getUserId(username1);
		String usertwo = getUserId(username2);
		
		if(Integer.parseInt(userone)>Integer.parseInt(usertwo))
		{
			String temp = usertwo;
			usertwo = userone;
			userone = temp;
		}
		String query = "UPDATE friends SET status = 1 WHERE userid_one = '"+userone+"' AND userid_two ='"+ usertwo+"' ";
		Statement st = con.createStatement();
		int x = st.executeUpdate(query);
		if(x==1)
		{
			System.out.println(" success from acceptRequest");
			
		}
		else
		{
			System.out.println(" unsuccessful from acceptRequest");
			
		}

		
		
	}
	
	public static Map<String,String> getNewsFeed(String username) throws Exception
	{
		String userId = getUserId(username);
		Map<String,String> userPosts = new HashMap<>();
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String queryname = "select username from users where user_id in(select user_id from posts where user_id in(select userid_one from friends where userid_two ="+userId+" and status = 1 union select userid_two from friends where userid_one="+userId+" and status=1))" ; 
		ResultSet rs = st.executeQuery(queryname);
		ArrayList<String> postedBy = new ArrayList<>();
		int count = 0;
			while(rs.next())
			{
				postedBy.add(rs.getString("username"));
				
				if(count ==3)
				{
					break;
				}
				count++;
			}
		System.out.println(postedBy);
		System.out.println(count);
		String queryposts = "select post_body from posts where user_id in(select userid_one from friends where userid_two ="+userId+" and status = 1 union select userid_two from friends where userid_one="+userId+" and status=1)";
		rs = st.executeQuery(queryposts);
		ArrayList<String> posts = new ArrayList<>();
		count = 0;
		while(rs.next())
		{
			posts.add(rs.getString("post_body"));
			if(count ==3)
			{
				break;
			}
			count++;
		}
		System.out.println(posts);
		int i = 0;
		while(count!=0)
		{
			
			userPosts.put(postedBy.get(i), posts.get(i));
			System.out.print(count);
			System.out.println(i);
			i++;
			count--;
		}
		System.out.println(count);
		System.out.println(userPosts +""+userPosts.size());
		
		return userPosts;
	}
	
	
	public static void storePosts(String username,String postBody) throws Exception
	{
		Connection con =mysqlConnect();
		PreparedStatement ps = con.prepareStatement("insert into posts(post_body,user_id) values(?,?)");
		String userId = getUserId(username);
		ps.setString(2,userId);
		ps.setString(1,postBody);
		int x = ps.executeUpdate();
			if(x==1)
			{
				System.out.println(" storing post successful from allfunctions");
				
			}
			else {
				System.out.println(" storing postunsuccessful from allfunctions");
				
			}
		
	}
	
	public static int updateAccount(String username,String email,String firstname,String lastname,String profession,String place,String dob) throws Exception
	{
		Connection con = mysqlConnect();
		String userId  =getUserId(username);
		String query = "update users set email='"+email+"',first_name='"+firstname+"',last_name='"+lastname+"',profession='"+profession+"',place='"+place+"',dob='"+dob+"' where user_id='"+userId+"';";
		Statement st = con.createStatement();
		int x=st.executeUpdate(query);
		if(x==1)
		{
			System.out.println("Account update success");
			return 1;
		}
		else
		{
			System.out.println("Account update unsuccessful");
			return 0;
		}
		
		
	}
	
	public static boolean deleteAccount(String username,String feedback) throws Exception
	{
		String userId = getUserId(username);
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String query = "DELETE FROM users WHERE user_id="+userId;
		int x = st.executeUpdate(query);
			if(x==1)
			{
				System.out.println("DELETION SUCCESSFULL");
			}
			else
			{
				System.out.println("DELETION UNSUCCESSFUL");
			}
			
			boolean status=updateFeedback(userId,feedback);
			if(status && x==1)
			{
				System.out.println("feedbackupdate successful");
				return true;
			}
			else
			{
				System.out.println("feedbackupdate unsuccessful");
				return false;
			}
		
	}
	
	public static boolean updateFeedback(String userId,String feedback) throws Exception
	{
		Connection con = mysqlConnect();
		Statement st = con.createStatement();
		String query = "CALL deleted_users('"+feedback+"',"+userId+")";
		int x = st.executeUpdate(query);
		if(x==1)
		{
			System.out.println("Inuf successful");
			return true;
		}
				
		
		return false;
	}
	
	
	public static String getUserId(String username) throws Exception
	{
		Connection con = mysqlConnect();
		String query = "Select user_id from users where username = '"+username+"' ";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		String userId = rs.getString("user_id");
		System.out.println(userId);
		return userId;
	}

}

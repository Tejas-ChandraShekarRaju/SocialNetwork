<%@ page import ="java.util.*,com.cj.controllers.*" %>
<%!String username; %>
 <%!  Map<String,String> newsFeed = new HashMap<>(); 
      ArrayList<String> pendingRequests = new ArrayList<>();
    %> 
<%username =(String)session.getAttribute("currentuser");%>
 <%  newsFeed = AllFunctions.getNewsFeed(username);	%>
<% System.out.println("athomejsp"+username); %>
<% pendingRequests = AllFunctions.getPendingRequests(username);%>

<!DOCTYPE html>
<html>
<title>FSEVENNETWORKS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">a

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
<!--   <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a> -->
  <a href="deleteAccount.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="DELTE ACCOUNT"><i class="fa fa-user-times"></i></a>
  <a href="accountupdate.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Update Account"><i class="fa fa-cog"></i></a>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
  
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">MY Profile</h4>
         
         <hr>
         <p><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i> <%=username %></p>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>  <%out.println(request.getAttribute("profession")); %></p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>  <% out.println(request.getAttribute("place")); %></p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>  <% out.println(request.getAttribute("dob")); %></p>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
           <form action = "addFriends1.jsp" >
          <button type="submit"  class="w3-button w3-block w3-theme-l1 w3-left-align" id="membersDirectory"><i class="fa fa-circle-o-notch fa-fw w3-margin-right" ></i> MEMBERS DIRECTORY</button>
          </form>
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> FRIENDS LIST</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i> <% out.println(request.getAttribute("name")); %><button type="button" class="w3-button  w3-theme" ><i class="fa fa-user"></i>SEND REQUEST</button></p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
<!--       <div class="w3-card w3-round w3-white w3-hide-small"> -->
<!--         <div class="w3-container"> -->
<!--           <p>Interests</p> -->
<!--           <p> -->
<!--             <span class="w3-tag w3-small w3-theme-d5">News</span> -->
<!--             <span class="w3-tag w3-small w3-theme-d4">W3Schools</span> -->
<!--             <span class="w3-tag w3-small w3-theme-d3">Labels</span> -->
<!--             <span class="w3-tag w3-small w3-theme-d2">Games</span> -->
<!--             <span class="w3-tag w3-small w3-theme-d1">Friends</span> -->
<!--             <span class="w3-tag w3-small w3-theme">Games</span> -->
<!--             <span class="w3-tag w3-small w3-theme-l1">Friends</span> -->
<!--             <span class="w3-tag w3-small w3-theme-l2">Food</span> -->
<!--             <span class="w3-tag w3-small w3-theme-l3">Design</span> -->
<!--             <span class="w3-tag w3-small w3-theme-l4">Art</span> -->
<!--             <span class="w3-tag w3-small w3-theme-l5">Photos</span> -->
<!--           </p> -->
<!--         </div> -->
<!--       </div> -->
<!--       <br> -->
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 id='textchange' class="w3-opacity">NEWS FEED</h6>
<!--               <p id = "post1" contenteditable="true" class="w3-border w3-padding">Write here</p> -->
				 <input type="text" placeholder="write posts" id = "post1" class="w3-col m12">
				 <br>
              <button onClick = "myPost(this)" id="post" type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>Post</button> 
            </div>
          </div>
        </div>
      </div>
      
      
      <% 
       
      for (Map.Entry<String, String> entry : newsFeed.entrySet()) {
  		String postedBy = entry.getKey();
  		String post = entry.getValue();
  		
  	
      out.write("      <!-- posts -->\n");
      out.write("      <div class=\"w3-container w3-card w3-white w3-round w3-margin\"><br>      \n");
      out.write("        <h4>"+postedBy+"</h4><br>\n");
      out.write("        <hr class=\"w3-clear\">\n");
      out.write("        <p>"+post+"</p>\n");
      out.write("        <button id='"+ postedBy +"' type=\"button\" class=\"w3-button w3-theme-d1 w3-margin-bottom\"><i class=\"fa fa-thumbs-up\"></i> Like</button> \n");
      out.write("        <button id='"+ postedBy +"' onclick=\"myFunction1('id')\" type=\"button\" class=\"w3-button w3-theme-d2 w3-margin-bottom\"><i class=\"fa fa-comment\"></i> Comment</button> \n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("      <!-- end posts -->\n");
       }

      %>
      <!-- end posts  -->
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
     <div class="w3-col m2"> 
    <!-- upcomingevents -->
<!--       <div class="w3-card w3-round w3-white w3-center"> -->
<!--         <div class="w3-container"> -->
<!--           <p>Upcoming Events:</p> -->
<!--           <img src="/w3images/forest.jpg" alt="Forest" style="width:100%;"> -->
<!--           <p><strong>Holiday</strong></p> -->
<!--           <p>Friday 15:00</p> -->
<!--           <p><button class="w3-button w3-block w3-theme-l4">Info</button></p> -->
<!--         </div> -->
<!--       </div> -->
<!--       <br> -->
 <!-- upcomingevents end-->
      
<!--       <div class="w3-card w3-round w3-white w3-center"> -->
<!--         <div class="w3-container"> -->
<!--           <p>Friend Request</p> -->
<!--           <span>Jane Doe</span> -->
<!--           <div class="w3-row w3-opacity"> -->
<!--             <div class="w3-full"> -->
<!--               <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <br> -->
<% for(int i = 0;i<pendingRequests.size();i++) {
   

out.write("      <div class=\"w3-card w3-round w3-white w3-center\">\n");
out.write("        <div class=\"w3-container\">\n");
out.write("          <p>Friend Request</p>\n");
out.write("          <span>"+pendingRequests.get(i)+"</span>\n");
out.write("          <div class=\"w3-row w3-opacity\">\n");
out.write("            <div class=\"w3-full\">\n");
out.write("              <button onClick = \"AcceptRequestActions(this)\" id='"+ pendingRequests.get(i)+"' class=\"w3-button w3-block w3-green w3-section\" title=\"Accept\"><i class=\"fa fa-check\"></i></button>\n");
out.write("            </div>\n");
out.write("          </div>\n");
out.write("        </div>\n");
out.write("      </div>\n");

}

%>
	


      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <p>ADS</p>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>WE WANT YOU TO HAVE A PRODUCTIVE TIME HERE</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by CJ & FSEVEN</p>
</footer>
 
<script>
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  console.log(x);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}


// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}



</script>

<script>
	
	
	function disableButton(btn){
		document.getElementById(btn.id).disabled = true;
		
		
	}
	function acceptRequest(btn)
	{
		
		var x = btn.id;
		var params = {
			    username: x
			};

			$.post("AcceptFriendRequests", $.param(params), function(response) {
				
			    
			});
	}


	
	function AcceptRequestActions(btn){
		
		
	   
		document.getElementById(btn.id).addEventListener('click',function(){
			acceptRequest(btn);
			disableButton(btn);
		}
				);
		
	}
	
	function storePost(btn)
	{
		
		var x = document.getElementById("post1").value;
		
		var params = {
				post:x
		}
		$.post("StorePosts", $.param(params), function(response) {
			
		    
		});
	}
	
	
	
	function myPost(btn)
	{
		
		document.getElementById('post1').disabled = true;
		document.getElementById('post1').disabled = true;
		document.getElementById('textchange').innerHTML = 'YOUR NEW POST';
		storePost(btn);
		disableButton(btn);
			
		
	}
	
	
	
	</script>





</body>
</html> 


<%@ page import ="java.util.*" %>
<%!String username ; %>
<%username = (String)session.getAttribute("currentuser"); %>
<!DOCTYPE html>
<html>
<head>
	<title>Account Update</title>
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
   	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
	<style>
		
		header{
			background:#333;
			color:#fff;
			padding:20px;
			text-align: center;
			border-bottom: 4px #000 solid;
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<header>
		<h1>FSEVEN ACCOUNT UPDATE</h1>
	</header>
	
		 <div class="row" >
    <form class="col s6" action="UpdateAccount" method="POST">
	<!--first row-->
      <div class="row">
        <div class="input-field col s6">
          <input  name="firstname" type="text" class="validate">
          <label for="firstname">First Name</label>
        </div>
        <div class="input-field col s6">
          <input name="lastname" type="text" class="validate">
          <label for="lastname">Last Name</label>
        </div>
      </div>
	
	<!--second row-->
      <div class="row">
        <div class="input-field col s12">
          <input name="dob" type="date" class="validate">
          <label for="dob">DateOfBirth</label>
        </div>
       </div>

	<!--third row-->

	 <div class="row">
        
        <div class="input-field col s12">
          <input name="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
       </div>


      <!--fourth row-->
	<div class="row">
	 <div class="input-field col s6">
          <input  name="profession" type="text" class="validate">
          <label for="profession">Profession</label>
        </div>
        <div class="input-field col s6">
          <input name="place" type="text" class="validate">
          <label for="place">Place</label>
        </div>
      </div>

	<button class="btn waves-effect waves-light" type="submit" name="action">UPDATE
    
  </button>
	
	

          
    </form>

  </div>
	
		


        
			
		
	

	<script>
		
	
	</script>
</body>
</html>

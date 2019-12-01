<%@ page import ="java.util.*" %>
<%!String username ; %>
<%username = (String)session.getAttribute("currentuser"); %>
<!DOCTYPE html>
<html>
<head>
	<title>DeleteUserAccount</title>
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
		<h1>FSEVEN DELETE ACCOUNT</h1>
		<h3>TELL US WHY YOU ARE DELETING YOUR ACCOUNT</h3>
	</header>
		
	
		 <div class="row" >
    <form class="col s6" action="DeleteAccount" method="POST">
	
	<!--first row-->
      <div class="row">
        <div class="input-field col s12">
          <input name="feedback" type="text" class="validate">
          <label for="dob">WRITE HERE</label>
        </div>
       </div>


	<button class="btn waves-effect waves-light" type="submit" name="action">DELETE
    
  </button>
	
	

          
    </form>

  </div>
	
		


        
			
		
	

	<script>
		
	
	</script>
</body>
</html>

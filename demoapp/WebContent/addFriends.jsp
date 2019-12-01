

<%@ page import ="java.util.*,com.cj.controllers.*" %>


<!DOCTYPE html>
<html>
<head>
	<title>FSEVEN FIND YOUR  FRIENDS</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	
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
		<h1>FSEVEN ADD NEW FRIENDS</h1>
	</header>
	<!-- friend card -->
	<div class="w3-container">
  <div class="w3-card-4 w3-dark-grey" style="width:100%">
    <div class="w3-container w3-center">
      <h3>F7 Member</h3>
      <h3>John Doe</h3>
      <div class="w3-section">
        <button onClick = "sendRequestActions(this)" id="btn1" class="w3-button w3-green">ADD FRIEND</button>
      </div>
    </div>
  </div>
</div>
	<!-- friend card end -->
	<div class="w3-container">
  <div class="w3-card-4 w3-dark-grey" style="width:100%">
    <div class="w3-container w3-center">
      <h3>F7 Member</h3>
      <h3>John Doe</h3>
      <div class="w3-section">
        <button onClick = "sendRequestActions(this)" id="btn2" class="w3-button w3-green">ADD FRIEND</button>
      </div>
    </div>
  </div>
</div>
	
	
	<script>
	
	
	function disableButton(btn){
		document.getElementById(btn.id).disabled = true;
		
	}
	function sendRequest(btn)
	{
		var x = btn.value;
		var value = btn.value;
		var params = {
			    username: x
			};

			$.post("sendFriendRequest", $.param(params), function(response) {
				//$("#somediv").text(responseText); 
			    
			});
	}


	
	function sendRequestActions(btn){
		$('#'+btn.id).on('click',function(){
			document.getElementById(btn.id).innerHTML = 'REQUEST SENT';
		});
		document.getElementById('btn1').addEventListener('click',function(){
			sendRequest(btn);
			disableButton(btn);
		}
				);
		
	}
	
	
	
	</script>

	
</body>
</html>

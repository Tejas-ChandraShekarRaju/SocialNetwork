

<%@ page import ="java.util.*,com.cj.controllers.*" %>
<%! ArrayList<String> members; %>
<%members = AllFunctions.getMembersDirectory(session.getAttribute("currentuser").toString()); %>


<!DOCTYPE html>
<html>
<head>
	<title>FSEVEN MEMBERS DIRECTORY</title>
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
		<h1>FSEVEN MEMBERS DIRECTORY</h1>
	</header>
	
<% 
for(int i =0;i<members.size();i++){
	
out.write("\t<div class=\"w3-container\">\n");
out.write("  <div class=\"w3-card-4 w3-dark-grey\" style=\"width:100%\">\n");
out.write("    <div class=\"w3-container w3-center\">\n");
out.write("      <h3>F7 Member</h3>\n");
out.write("      <h3>"+members.get(i)+"</h3>\n");
out.write("      <div class=\"w3-section\">\n");
out.write("        <button onClick = \"sendRequestActions(this)\" id='"+ members.get(i)+"' class=\"w3-button w3-green\">ADD FRIEND</button>\n");
out.write("      </div>\n");
out.write("    </div>\n");
out.write("  </div>\n");
out.write("</div>\n");
}
%>	
	
	
	<script>
	
	
	function disableButton(btn){
		document.getElementById(btn.id).disabled = true;
		
	}
	function sendRequest(btn)
	{
		var x = btn.id;
		var value = btn.value;
		var params = {
			    username: x
			};

			$.post("sendFriendRequest", $.param(params), function(response) {
				
			    
			});
	}


	
	function sendRequestActions(btn){
		$('#'+btn.id).on('click',function(){
			document.getElementById(btn.id).innerHTML = 'REQUEST SENT';
		});
		document.getElementById(btn.id).addEventListener('click',function(){
			sendRequest(btn);
			disableButton(btn);
		}
				);
		
	}
	
	
	
	</script>

	
</body>
</html>

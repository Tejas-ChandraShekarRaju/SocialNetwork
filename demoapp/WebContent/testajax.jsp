<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Send Requests</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
//             $(document).on("click", "#somebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
//                 $.get("Testajax", function(responseText) { 
                	
//                 	 $("#somediv").text(responseText); 
                	 
                	 
//                 	 // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
//                 });
                
//             });
//             function changeText(){
//            $(document).ready(function(){
			
// 			$('#somebutton').on('click',function(){
// 				document.getElementById('somebutton').innerHTML = 'request sent';
// 			});		
// 			});
//             }

		function sendParams(btn)
		{
			var x = btn.id;
			var value = btn.value;
			var params = {
				    foo: x,
				    bar: value,
				    baz: "bazValue"
				};

				$.post("Testajax", $.param(params), function(response) {
					//$("#somediv").text(responseText); 
				    
				});
		}
        </script>
    </head>
    <body>
        <button id="somebutton" onClick="test(this)" value="test">press here</button>
        <div id="somediv"></div>
    </body>
</html>
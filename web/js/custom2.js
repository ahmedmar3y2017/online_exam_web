 $(document).ready(function () {
      $('.photo2').height($(window).height());
 

        $('#check1').hide();
        $('#check2').hide();
        $('#check3').hide();
        $('#check4').hide();
        $('#check5').hide();
        $('#check1').hide();
        $('#check1').hide();
        $('#check1').hide();



			        
      	  $('.forma').submit( function(){
      	  return  checkusername();
            });


      	   $('.forma').submit( function(){
      	   	 return checklastname();
      	   	
      	   	 
          });

      	   $('.forma').submit( function(){
      	   
      	  return checkemail();
      	   
      	   	 
          });

      	   $('.forma').submit( function(){
      	   
      	     return checkfaculty();
          });

      	   $('.forma').submit( function(){

      	   
      	   	 return checkMob();
      	   	 
          });

      	   $('.forma').submit( function(){
      	   	
      	   	 return checkpass();
      	   	 
          });

      	   $('.forma').submit( function(){
      	   	 return checkpassword();
      	   	 
          });

      	   $('.forma').submit( function(){
      	  
      	   	 return checkphoto();
      	   	 
          });

      	


		      	function checkusername(){
		      		var user_name = document.getElementById("icon_prefix1").value;
		      		var label1 =  document.getElementById("check1");
		      		if (user_name =="") {
		      		
		              	$('#check1').html("field Required");
		              	label1.style.color="red";
		      			$('#check1').show();
		      				 error_username=false;


		      		}
		      		else{
		      			$('#check1').hide();
		      		}
		      	}


      	function checklastname(){
      		var user_name = document.getElementById("icon_prefix2").value;
      		var label1 =  document.getElementById("check2");
      		if (user_name =="") {
      		
              	$('#check2').html("field Required");
              	label1.style.color="red";
      			$('#check2').show();
      				return false;
            
      		}
      		else{
            return true;
      			
      		}
      	}

		function checkemail(){
      		var email = document.getElementById("icon_prefix3").value;
      		var label3 =  document.getElementById("check3");

      		if (email =="") {

      		
              	$('#check3').html("field Required");
              	label3.style.color="red";
      			$('#check3').show();
      		 return false;


      		}
      		else{

      			 return true;
      		}
      	}

function checkfaculty(){
      		var facult = document.getElementById("icon_prefix4").value;
      		var label4 =  document.getElementById("check4");
      		if (facult =="") {
      		
              	$('#check4').html("field Required");
              	label4.style.color="red";
      			$('#check4').show();
      				 return false;


      		}
      		else{
 return true;      		}
      	}

			function checkMob(){
		      		var mobb = document.getElementById("icon_prefix5").value;
		      		var label5 =  document.getElementById("check5");
		      		if (mobb =="") {
		      		
		              	$('#check5').html("field Required");
		              	label5.style.color="red";
		      			$('#check5').show();
		      				 return false;


		      		}
		      		else{
 return true;
 		      		}
		      	}

function checkpass(){
      		var passs = $("#password1").val().length;
      		var label16 =  document.getElementById("check6");
      		if (passs <= 6) {
      		
              	$('#check6').html("At Least 6 Charachter");
              	label16.style.color="red";
      			$('#check6').show();
      				  return false;


      		}
      		else{
      			 return true;
      		}
      	}

function checkpassword(){
      		var pass = document.getElementById("password1").value;
      		var	confpass =	document.getElementById("password2").value;
      		var label7 =  document.getElementById("check7");
      		if (pass !=confpass) {
      		
              	$('#check7').html("Password don't Match");
              	label7.style.color="red";
      			$('#check7').show();
      				 return false;


      		}
      		else{
      			 return true;
      		}
      	}

		function checkphoto(){
      		var user_name = document.getElementById("icon_prefix1").value;
      		var label8 =  document.getElementById("check8");
      		if (user_name =="") {
      		
              	$('#check8').html("You Must upload Photo");
              	label8.style.color="red";
      			$('#check8').show();
      			return false;


      		}
      		else{
      			 return true;
      		}
      	}
});
         

$(document).ready(function () {

 //For Admin Active li
 			$('.Admin-question').hide();
 			$('.Admin-Courses').hide();

         $('.nav-home li').click(function() { 
         
        $(this).addClass('select-home').siblings('li').removeClass('select-home');

        // switch of Sections

    	 $('.Admin-question , .Admin-Links , .Admin-Courses').hide();
        $('.' + $(this).data('class')).fadeIn();
        	
    });
         	/* validate first sectopn Links */
          $('.forma').submit( function(){
      	   		
      	   	 return validation("validate1" , "check1");
     });

          $('.forma').submit( function(){
          return validation("validate2" , "check2");
      });
       
           $('.forma').submit( function(){
          return validation("validate3" , "check3");
      });
           /*  end validate first sectopn Links */



         	/* validate second sectopn Links */
          $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate4" , "check4");
     });

            $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate5" , "check5");
     });

       
           $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate5" , "check5");
     });

           $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate6" , "check6");
     });

              $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate7" , "check7");
     });

    $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate8" , "check8");
     });

        $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate9" , "check9");
     });

         $('.forma2').submit( function(){
      	   		
      	   	 return validation("validate10" , "check10");
     });


           /*  end validate first sectopn Links */


         	/* validate third sectopn Links */
          $('.forma3').submit( function(){
      	   		
      	   	 return validation("validate11" , "check11");
     });


           	/* validate third sectopn Links */
          $('.foram3').submit( function(){
      	   		
      	   	 return validation("validate11" , "check11");
     });

         
          $('.foram3').submit( function(){
      	   		
      	   	 return validation("validate12" , "check12");
     });
         	/* validate third sectopn Links */
          $('.foram3').submit( function(){
      	   		
      	   	 return validation("validate13" , "check13");
     });

          	/* validate third sectopn Links */
          $('.foram3').submit( function(){
      	   		
      	   	 return validation("validate14" , "check14");
     });

              	/* validate third sectopn Links */
          $('.foram3').submit( function(){
      	   		
      	   	 return validation("validate15" , "check15");
     });

	$('.foram3').submit( function(){
      	   		
      	   	 return validation("validate16" , "check16");
     });

           /* validate function */
	function validation(postion , appear) {
		var val = document.getElementById(postion).value;
		var label =  document.getElementById(appear);
	   	if (val == "" || val < 0 ) {
	   			$('#'+ appear).html("field Required");
		             label.style.color="red";
	   		return false;
	   	}else{
	   		return true;
	   	}
	   }   
 /* end validate function */ 
	});

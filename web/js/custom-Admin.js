
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

       
   

	});

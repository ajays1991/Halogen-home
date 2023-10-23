$(document).ready(function() {    

	// setup auth header for all the requests 

    var auth_token = sessionStorage.getItem("auth_token")
    var email = sessionStorage.getItem("email")
    $.ajaxSetup({
	    beforeSend: function(xhr) {	    	
	        xhr.setRequestHeader('X-User-Email', 'ajays871@gmail.com');
	        xhr.setRequestHeader('X-User-Token', 'VP3UxpMFxqkACQnz-LG4');
	    }
	});

	// control banner height for inner pages
	$('#nino-header').css('height','100px');
});
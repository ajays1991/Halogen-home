var dashboard_controller = {

}

$(document).ready(function() {
    console.log(api_url)
    $("#test-click").on('click', function(e){       
        console.log("test");
        $.ajax({
          type: "get",
          url: api_url+"/api/v1/assignments",          
          success: function(data){
            console.log(data);
            // save auth token in local storage            
          },
          dataType: 'json'
        });
    });
});
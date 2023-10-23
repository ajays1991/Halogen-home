var flight_plan_controller = {
  init: function(){
    $.ajax({
      method: 'GET',
      url: api_url + "/api/v1/flight_plans",
      success: function(data){       
        var html_src = ""
        data.data.forEach(function(d){
          var html = "<option value="+d.id+">"+d.name+"</option>";
          html_src = html_src + html;
        });
        $('#form-flight-plan-id').append(html_src);
      }
    })
    $.ajax({
      method: 'GET',
      url: api_url + "/api/v1/drones",
      success: function(data){        
        var html_src = ""
        data.data.forEach(function(d){
          var html = "<option value="+d.id+">"+d.name+"</option>";
          html_src = html_src + html;
        });
        $('#form-drone-id').append(html_src);
      }
    })
  },

  save_form: function(){    
    var payload = {    
      name: $('#form-name').val(),    
      flight_type: $('#form-flight-type').val(),
      status: $('#form-status').val(),
      flight_plan_id: $('#form-flight-plan-id').val().trim(),
      drone_id: $('#form-drone-id').val().trim()
    };
    console.log(payload, api_url);
    $.ajax({
      method: 'POST',
      url: api_url + "/api/v1/flights",
      data: {flight: payload},
      dataType: 'json',
      success: function(data){
        console.log(data);
        window.location = "/flights";
      }
    }) 
  }
}

$(document).ready(function() {
    console.log("api_url for testing");
    flight_plan_controller.init();
    $('#form-save').on('click', function(ev){
      flight_plan_controller.save_form();
    });
});

var drone_controller = {
  sync_drone: function(){

  },

  save_form: function(){    
    var payload = {    
      name: $('#form-name').val(),    
      mac_address: $('#form-mac-address').val(),
      ipv4: $('#form-ipv4').val(),
      flight_type: $('#form-flight-type').val()
    };
    console.log(payload, api_url);
    $.ajax({
      method: 'POST',
      url: api_url + "/api/v1/drones",
      data: {drone: payload},
      dataType: 'json',
      success: function(data){
        console.log(data);
        window.location = "/drones";
      }
    }) 
  }
}

$(document).ready(function() {
    console.log("api_url for testing");    
    $('#form-save').on('click', function(ev){
      drone_controller.save_form();
    });

    $('#sync-drone').on('click', function(ev){
      console.log("syncing");
      console.log(navigator);
      navigator.bluetooth.requestDevice();
    });
});

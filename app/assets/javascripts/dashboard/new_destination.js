var new_location_controller = {

  build_location_list: function(){
    $.ajax({
      type: "get",
      url: api_url+"/api/v1/locations",
      success: function(data){
        var locations = data.data
        var source = "";
        console.log(locations[0])
        locations.forEach(function(f){             
          var html = "<option value='"+f.id+"'>"+f.name+"</>";          
          source = source + html
        })      
        $('#form-location-id').html(source)
        console.log(source, 'jojpj');
      }
    })
  },

  save_form: function(){    
    var payload = {    
      name: $('#form-name').val(),    
      control_type: $('#form-control-type').val(),
      active: $('#form-active').val(),
      location_id: $('#form-location-id').val()
    };
    console.log(payload, api_url);
    $.ajax({
      method: 'POST',
      url: api_url + "/api/v1/destinations",
      data: {destination: payload},
      dataType: 'json',
      success: function(data){
        console.log(data);
        window.location = "/destinations";
      }
    }) 
  }
}

$(document).ready(function() {
    console.log("api_url for testing");
    new_location_controller.build_location_list();
    $('#form-save').on('click', function(ev){
      new_location_controller.save_form();
    });
});

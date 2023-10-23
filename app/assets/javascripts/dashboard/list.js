var list_controller = {

  resource_column_list: function(type) {
    var flights = ["Name", "Flight Code", "Status", "Drone Name", "Drone Ipv4", "Flight Plan Name", "Flight Plan Status", "Fly Zone Name", "Fly Zone Status", "Start Location Name", "Destination Name"]
    var drones = ["Name", "MacAddress", "IPV4", "Flight Type", "Flight Counts"]
    var flight_plans = ["Name", "Plan type", "Status", "Fyzone", "Startlocation", "Destination"];
    var fly_zones = ["Name", "Status", "Regional Office address", "Coordinates"];
    var destinations = ["Name", "Control Type", "Active", "Location Name", "Location Address", "Location Coordinates"];
    var start_locations = ["Name", "Control Type", "Active", "Location Name", "Location Address", "Location Coordinates"];
    var locations = ["Name", "Location Type", "Status", "Address", "Coordinates"];
    var h = [];
    switch(type)
    {
      case 'flights':
        h = flights
      break;
      case 'drones':
        h = drones
      break;
      case 'flight_plans':
        h = flight_plans
      break;
       case 'fly_zones':
        h = fly_zones
      break;      
      case 'destinations':
        h = destinations
      break;
      case 'start_locations':
        h = start_locations
      break;
      case 'locations':
        h = locations
      break;

    }
    console.log(h, "thus us");
    return h;
  }, 

  flight_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(flight){
      console.log(flight.name)
      var html = "<tr><th>"+flight.name+"</th><th>"+flight.flight_code+"</th><th>"+flight.flight_type+"</th><th>"+flight.status+"</th><th>"+flight.drone.name+"</th><th>"+flight.drone.ipv4+"</th><th>"+flight.flight_plan.name+"</th><th>"+flight.flight_plan.status+"</th><th>"+flight.flight_plan.fly_zone.name+"</th><th>"+flight.flight_plan.fly_zone.status+"</th><th>"+flight.flight_plan.start_location.name+"</th><th>"+flight.flight_plan.destination.name+"</th><th><button class='flight-launch'>Launch</button><th><button class='flight-view'>View</button></th><th><button class='flight-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  drone_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(drone){
      console.log(drone.name)
      var html = "<tr><th>"+drone.name+"</th><th>"+drone.mac_address+"</th><th>"+drone.ipv4+"</th><th>"+drone.flight_type+"</th><th>"+drone.flight_counts+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  flight_plan_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(flight_plan){
      console.log(flight_plan.name)
      var html = "<tr><th>"+flight_plan.name+"</th><th>"+flight_plan.flight_plan_type+"</th><th>"+flight_plan.status+"</th><th>"+flight_plan.fly_zone.name+"</th><th>"+flight_plan.start_location.name+"</th><th>"+flight_plan.destination.name+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  fly_zone_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(fly_zone){
      console.log(fly_zone.name)
      var html = "<tr><th>"+fly_zone.name+"</th><th>"+fly_zone.status+"</th><th>"+fly_zone.regional_office_address+"</th><th>"+ JSON.stringify(fly_zone.coordinates)+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  destination_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(destination){
      console.log(destination.name)
      var html = "<tr><th>"+destination.name+"</th><th>"+destination.control_type+"</th><th>"+destination.active+"</th><th>"+destination.location.name+"</th><th>"+destination.location.address+"</th><th>"+JSON.stringify(destination.location.coordinates)+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  start_location_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(start_location){
      console.log(start_location.name)
      var html = "<tr><th>"+start_location.name+"</th><th>"+start_location.control_type+"</th><th>"+start_location.active+"</th><th>"+start_location.location.name+"</th><th>"+start_location.location.address+"</th><th>"+JSON.stringify(start_location.location.coordinates)+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },

  location_resource_column_value: function(type, data){
   var src_tr = "";
   console.log(data, "data");
   _.each(data, function(location){
      console.log(location.name)
      var html = "<tr><th>"+location.name+"</th><th>"+location.location_type+"</th><th>"+location.status+"</th><th>"+location.address+"</th><th>"+JSON.stringify(location.coordinates)+"</th><th><button class='flight-plan-view'>View</button></th><th><button class='flight-plan-delete'>Delete</button></th>";
      src_tr = src_tr + html
   });
   $('#list-values').append(src_tr);
  },
  
  edit_button_handlder: function(id, type){
    $(".edit-button").on('click', function(e){       
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
  },

  delete_button_handlder: function(id, type){
    $(".edit-button").on('click', function(e){       
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
  },

  fill_list: function(data, type){    
    var resource_headers = list_controller.resource_column_list(type)    
    var src = "";
    resource_headers.forEach(function(h){
      var html = "<th>"+h+"</th>";
      src = src + html
    });
    console.log(src);
    $('#list-header').html(src)
    switch(type)
    { 
      case 'flights':
        list_controller.flight_resource_column_value(type, data.data)
      break;
      case 'drones':
        list_controller.drone_resource_column_value(type, data.data) 
      break;
      case 'flight_plans':
        list_controller.flight_plan_resource_column_value(type, data.data) 
      break;
      case 'fly_zones':
        list_controller.fly_zone_resource_column_value(type, data.data) 
      break;
      case 'destinations':
        list_controller.destination_resource_column_value(type, data.data) 
      break;
      case 'start_locations':
        list_controller.start_location_resource_column_value(type, data.data) 
      break;
      case 'locations':
        list_controller.location_resource_column_value(type, data.data) 
      break;
    }
  },

  build_resource_list: function(){
    var resource_name = $('.content-wrapper').attr('data-resource-type');
    $("#list-title span").append(resource_name.split('_').join(" ").trim());
    $("#list-title").append('<button id="new-resource">New</button>');
    $('#new-resource').on('click', function(ev){
      window.location = "/" + resource_name +"/new" 
    });
    $.ajax({
      type: "get",
      url: api_url+"/api/v1/" + resource_name + "?size=100&page=1",
      dataType: "json",
      success: function(data){
        list_controller.fill_list(data, resource_name)
      }
    })
    console.log(resource_name)
  }
}

$(document).ready(function() {
  console.log(api_url)
  list_controller.build_resource_list();
});
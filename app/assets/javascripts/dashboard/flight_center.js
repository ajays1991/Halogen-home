var dashboard_controller = {
  mapbox_access_token: "pk.eyJ1IjoiYWpheXM4NzEiLCJhIjoiY2pnYjExbXR0MHkxeTJ3b3kxY2h1czVkayJ9.-QksECb7PD-YKMGT4HPJuQ",

  prepare_route: function(flight_plan){

  },

  prepare_features: function(flight_plan){
    var geo_json = [{
                            "type": "Feature",
                            "geometry": {
                                "type": "Point",
                                "coordinates": [flight_plan.start_location.location.coordinates.long, flight_plan.start_location.location.coordinates.lat]
                            },
                            "properties": {
                                "title": flight_plan.start_location.name,
                                "icon": "harbor"
                            }
                        },
                        {
                            "type": "Feature",
                            "geometry": {
                                "type": "Point",
                                //"coordinates": [76.768066, 30.741482],
                                "coordinates": [flight_plan.destination.location.coordinates.long, flight_plan.destination.location.coordinates.lat]
                            },
                            "properties": {
                                "title": flight_plan.destination.name,
                                "icon": "harbor"
                            }
                        }
                      ];
    console.log(flight_plan.metadata.waypoints);
    flight_plan.metadata.waypoints.forEach(function(way_point, index){  
    console.log(way_point);           
      var feature = {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": way_point.location
        },
        "properties": {
          "title": index,
          "icon": "harbor"
        }
      };
      geo_json.push(feature)
    })  
    console.log(geo_json);
    return geo_json

  },

  populate_flight_info: function(flight){
    $('#flight-info').empty();
    var html_src = "Name&nbsp;:&nbsp;"+flight.name+"&nbsp;&nbsp;&nbsp;&nbsp;Flight Plan&nbsp;:&nbsp;" + flight.flight_plan.name+"&nbsp;&nbsp;&nbsp;&nbsp;Type&nbsp;:&nbsp"+ flight.flight_type + "&nbsp;&nbsp;&nbsp;&nbsp;status&nbsp;:&nbsp" + flight.status + "&nbsp;&nbsp;&nbsp;&nbsp;drone&nbsp;:&nbsp" + flight.drone.name + "&nbsp;&nbsp;&nbsp;&nbsp;Mac&nbsp;:&nbsp" + flight.drone.mac_address + "<br>Start location&nbsp;:&nbsp" + flight.flight_plan.start_location.name + "&nbsp;&nbsp;&nbsp;&nbsp;Destination&nbsp;:&nbsp" + flight.flight_plan.destination.name
    $('#flight-info').append(html_src);    
  },

  build_directions: function(start_location, destination){
    //https://api.mapbox.com/directions/v5/{profile}/{coordinates}
    $.ajax({
      type: "get",
      url: "https://api.mapbox.com/directions/v5/mapbox/driving-traffic/"+start_location.long+","+start_location.lat+";"+destination.long+","+destination.lat+"?&access_token="+ dashboard_controller.mapbox_access_token,
      success: function(data){
        console.log(data)
      }
    })
  },  
  init: function(flight_id){
      console.log("flight", flight_id)
      $.ajax({
        type: "get",
        url: api_url+"/api/v1/flights/"+flight_id,          
        success: function(flight){
          dashboard_controller.populate_flight_info(flight)
          mapboxgl.accessToken = dashboard_controller.mapbox_access_token;
          var map = new mapboxgl.Map({
              container: 'map-view',
              style: 'mapbox://styles/mapbox/streets-v9',
              minZoom: 6,
              center: [ flight.flight_plan.metadata.center.lng, flight.flight_plan.metadata.center.lat]
          });
          map.on('load', function () {

            destination = flight.flight_plan.destination
            start_location = flight.flight_plan.start_location
            console.log(start_location, "start_location")            
            map.addLayer({
                "id": "points",
                "type": "symbol",
                "source": {
                    "type": "geojson",
                    "data": {
                        "type": "FeatureCollection",
                        "features": dashboard_controller.prepare_features(flight.flight_plan)
                    }
                },
                "layout": {
                    "icon-image": "{icon}-15",
                    "text-field": "{title}",
                    "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
                    "text-offset": [0, 0.6],
                    "text-anchor": "top"
                }
            });

              map.addLayer({
                "id": "route",
                "type": "line",
                "source": {
                    "type": "geojson",
                    "data": {
                        "type": "Feature",
                        "properties": {},
                        "geometry": {
                            "type": "LineString",
                            "coordinates": flight.flight_plan.metadata.routes[0].geometry.coordinates
                        }
                    }
                },
                "layout": {
                    "line-join": "round",
                    "line-cap": "round"
                },
                "paint": {
                    "line-color": "#888",
                    "line-width": 8
                }
            });
          });
            //dashboard_controller.build_directions(start_location.location.coordinates, destination.location.coordinates);
        },
      dataType: 'json'
    });
  },
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
    navigator.geolocation.getCurrentPosition(function(location) {
    console.log(location.coords.latitude);
    console.log(location.coords.longitude);
    console.log(location.coords.accuracy);   
    $.ajax({
      type: "get",
      url: api_url+"/api/v1/flights",
      success: function(data){
        var flights = data.data
        var source = "";       
        flights.forEach(function(f){             
          var html = "<option value='"+f.id+"'>"+f.name+"</>";          
          source = source + html
        })      
        dashboard_controller.init(flights[0].id)
        $('#lauch').on('click',)
        $('#flight-lists').html(source)
        $('#flight-lists').on('change', function(value){
          console.log(value, "this is the value", this.value);
          dashboard_controller.init(this.value)
        });
        console.log(source, 'jojpj');
      }
    })
  });
});
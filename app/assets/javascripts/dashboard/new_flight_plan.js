var new_flight_plan_controller = {
  init: function(){
    $.ajax({
      method: 'GET',
      url: api_url + "/api/v1/destinations",
      success: function(data){       
        var html_src = ""
        data.data.forEach(function(d){
          var html = "<option value="+d.id+">"+d.name+"</option>";
          html_src = html_src + html;
        });
        $('#form-destination-id').append(html_src);
      }
    })
    $.ajax({
      method: 'GET',
      url: api_url + "/api/v1/start_locations",
      success: function(data){        
        var html_src = ""
        data.data.forEach(function(d){
          var html = "<option value="+d.id+">"+d.name+"</option>";
          html_src = html_src + html;
        });
        $('#form-location-id').append(html_src);
      }
    })
    // navigator.geolocation.getCurrentPosition(function(location) {
    //   console.log(location.coords.latitude);
    //   console.log(location.coords.longitude);
    //   console.log(location.coords.accuracy);   
    //   mapboxgl.accessToken = 'pk.eyJ1IjoiYWpheXM4NzEiLCJhIjoiY2pnYjExbXR0MHkxeTJ3b3kxY2h1czVkayJ9.-QksECb7PD-YKMGT4HPJuQ';
    //   var map = new mapboxgl.Map({
    //       container: 'select-map-location',
    //       style: 'mapbox://styles/mapbox/streets-v9',
    //       minZoom: 7,
    //       center: [location.coords.longitude, location.coords.latitude]
    //   });
    //   var canvas = map.getCanvasContainer();

    //   var geojson = {
    //       "type": "FeatureCollection",
    //       "features": [{
    //           "type": "Feature",
    //           "geometry": {
    //               "type": "Point",
    //               "coordinates": [location.coords.longitude, location.coords.latitude]
    //           }
    //       }]
    //   };

    //   function mouseDown() {
    //       if (!isCursorOverPoint) return;

    //       isDragging = true;

    //       // Set a cursor indicator
    //       canvas.style.cursor = 'grab';

    //       // Mouse events
    //       map.on('mousemove', onMove);
    //       map.once('mouseup', onUp);
    //   }

    //   function onMove(e) {
    //       if (!isDragging) return;
    //       var coords = e.lngLat;

    //       // Set a UI indicator for dragging.
    //       canvas.style.cursor = 'grabbing';

    //       // Update the Point feature in `geojson` coordinates
    //       // and call setData to the source layer `point` on it.
    //       geojson.features[0].geometry.coordinates = [coords.lng, coords.lat];
    //       map.getSource('point').setData(geojson);
    //   }

    //   function onUp(e) {
    //       if (!isDragging) return;
    //       var coords = e.lngLat;

    //       // Print the coordinates of where the point had
    //       // finished being dragged to on the map.
    //       // coordinates.style.display = 'block';
    //       // coordinates.innerHTML = 'Longitude: ' + coords.lng + '<br />Latitude: ' + coords.lat;
    //       canvas.style.cursor = '';
    //       isDragging = false;

    //       // Unbind mouse events
    //       map.off('mousemove', onMove);
    //       console.log("selected". coords, e)
    //       $('#form-long').val(e.lngLat.lng)
    //       $('#form-lat').val(e.lngLat.lat)
          
    //   }

    //   map.on('load', function() {

    //       // Add a single point to the map
    //       map.addSource('point', {
    //           "type": "geojson",
    //           "data": geojson
    //       });

    //       map.addLayer({
    //           "id": "point",
    //           "type": "circle",
    //           "source": "point",
    //           "paint": {
    //               "circle-radius": 10,
    //               "circle-color": "#3887be"
    //           }
    //       });

    //       // When the cursor enters a feature in the point layer, prepare for dragging.
    //       map.on('mouseenter', 'point', function() {
    //           map.setPaintProperty('point', 'circle-color', '#3bb2d0');
    //           canvas.style.cursor = 'move';
    //           isCursorOverPoint = true;
    //           map.dragPan.disable();
    //       });

    //       map.on('mouseleave', 'point', function() {
    //           map.setPaintProperty('point', 'circle-color', '#3887be');
    //           canvas.style.cursor = '';
    //           isCursorOverPoint = false;
    //           map.dragPan.enable();
    //       });

    //       map.on('mousedown', mouseDown);
    //   });
    // });    
  },

  save_form: function(){    
    var payload = {    
      name: $('#form-name').val(),    
      flight_plan_type: $('#form-flight-plan-type').val(),
      status: $('#form-status').val(),
      destination_id: $('#form-destination-id').val().trim(),
      start_location_id: $('#form-location-id').val().trim(),
      fly_zone_ids: [1]
    };
    console.log(payload, api_url);
    $.ajax({
      method: 'POST',
      url: api_url + "/api/v1/flight_plans",
      data: {flight_plan: payload},
      dataType: 'json',
      success: function(data){
        console.log(data);
        window.location = "/flight-plans";
      }
    }) 
  }
}

$(document).ready(function() {
    console.log("api_url for testing");
    new_flight_plan_controller.init();
    $('#form-save').on('click', function(ev){
      new_flight_plan_controller.save_form();
    });
});

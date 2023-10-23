class GpsBeamerLogsIndex < BaseSettings

  define_type GpsBeamerLog.all do
  	root parent: 'flight', parent_id: ->{ flight.id } do
      template 'metadata.*', 'date', type: 'date', index: 'no'
      template 'metadata.*', 'long', type: 'integer', index: 'no'
      template 'metadata.*', 'string', type: 'text', fields: { keyword: { type: 'keyword' } }

      field :flight_id
      field :metadata, type: 'object' 
      field :coordinates, type: 'geo_point', value: ->{ {lat: latitude, lon: longitude} }
      field :created_at, type: "date", format: "epoch_millis", value: ->(camera_log) { camera_log.created_at.to_i * 1000 }  
    end     
  end
end
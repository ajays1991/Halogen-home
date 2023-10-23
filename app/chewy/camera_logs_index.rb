class CameraLogsIndex < BaseSettings

  define_type CameraLog.includes(:flight).all do
  	root parent: 'flight', parent_id: ->{ flight.id } do
      template 'metadata.*', 'date', type: 'date', index: 'no'
      template 'metadata.*', 'long', type: 'integer', index: 'no'
      template 'metadata.*', 'string', type: 'text', fields: { keyword: { type: 'keyword' } }
      
      template 'camera_specifications.*', 'date', type: 'date', index: 'no'
      template 'camera_specifications.*', 'long', type: 'integer', index: 'no'
      template 'camera_specifications.*', 'string', type: 'text', fields: { keyword: { type: 'keyword' } }
 
      field :name
      field :flight_id
      field :user_id
      field :camera_specifications, type: 'object'
      field :metadata, type: 'object' 
      field :created_at, type: "date", format: "epoch_millis", value: ->(camera_log) { camera_log.created_at.to_i * 1000 }      
    end     
  end
end
class RenameTyploeToType < ActiveRecord::Migration[5.1]
  def change
  	rename_column :start_locations, :control_tylope, :control_type
  end
end

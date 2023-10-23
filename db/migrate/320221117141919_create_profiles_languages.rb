class CreateProfilesLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles_languages do |t|
      t.string :profile_id
      t.string :language_id
      t.timestamps
    end
  end
end
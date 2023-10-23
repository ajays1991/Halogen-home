class User < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string "fname"
      t.string "lname"
      t.string "email"
      t.string "mobile"
      t.string "avatar"
      t.string "password_digest"
      t.string "role"
      t.timestamps
    end
  end
end

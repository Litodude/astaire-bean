class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "full_name"
      t.string   "email", null: false
      t.datetime "birth_date"
      t.string "phone_number" 
      t.timestamps null: false

    end
  end
end

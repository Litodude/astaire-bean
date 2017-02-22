class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   "class_name"
      t.datetime "start_time"
      t.integer "duration"
      t.timestamps null: false

    end
  end
end


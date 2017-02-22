class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string   "class_name"
      t.string "start_time"
      t.int "duration"
      t.timestamps null: false

    end
  end
end


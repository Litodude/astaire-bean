class AdjustCourseNameField < ActiveRecord::Migration
  def change
    remove_column :courses, :class_name  
    add_column :courses, :name, :string  
  end
end

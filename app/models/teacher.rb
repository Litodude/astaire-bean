class Teacher < ActiveRecord::Base
  has_many :courses, :dependent => :destroy
  has_many :students, :dependent => :destroy
end

class Teacher < ActiveRecord::Base
  has_many :courses, dependent => :destroy
end

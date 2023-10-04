class Course < ApplicationRecord
  validates_presence_of :name 

  has_many :resident_courses
  has_many :residents, through: :resident_courses

  def resident_count 
    residents.count 
  end
end

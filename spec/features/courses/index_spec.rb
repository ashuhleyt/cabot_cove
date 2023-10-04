require 'rails_helper'

RSpec.describe 'course index' do 
  before :each do 
    @res1 = Resident.create!(name: "Ashley", age: 34, occupation: "unemployed")
    @res2 = Resident.create!(name: "Lauren", age: 34, occupation: "HR Director")
    @res3 = Resident.create!(name: "Mona", age: 38, occupation: "Store Manager")
    @course1 = Course.create!(name: "fingerpainting")
    @course2 = Course.create!(name: "cooking with an easy-bake")
    @course3 = Course.create!(name: "how to hustle")
    @rescourse1 = ResidentCourse.create!(resident_id: @res1.id, course_id: @course1.id)
    @rescourse2 = ResidentCourse.create!(resident_id: @res1.id, course_id: @course2.id)
    @rescourse3 = ResidentCourse.create!(resident_id: @res1.id, course_id: @course3.id)
    visit "/courses"
  end

  it 'see a list of the courses and the number of people enrolled in each' do 
    expect(page).to have_content(@course1.name)
    expect(page).to have_content(@course2.name)
    expect(page).to have_content(@course3.name)
    expect(page).to have_content(@course1.residents.count)
  end
end
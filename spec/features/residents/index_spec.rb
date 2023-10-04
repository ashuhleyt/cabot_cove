require 'rails_helper'

RSpec.describe 'Residents index' do 
  before :each do 
    @res1 = Resident.create!(name: "Ashley", age: 34, occupation: "unemployed")
    @res2 = Resident.create!(name: "Lauren", age: 34, occupation: "HR Director")
    @res3 = Resident.create!(name: "Mona", age: 38, occupation: "Store Manager")

  end
  
  describe 'index page info' do 
    it 'has all attributes listed for all residents' do 
      visit "/residents"
      expect(page).to have_content(@res1.name)
      expect(page).to have_content(@res2.name)
      expect(page).to have_content(@res3.name)
      expect(page).to have_content(@res1.age)
      expect(page).to have_content(@res2.age)
      expect(page).to have_content(@res3.age)
      expect(page).to have_content(@res1.occupation)
      expect(page).to have_content(@res2.occupation)
      expect(page).to have_content(@res3.occupation)
    end

    it 'has the average age of all the residents' do 
      visit "/residents"

      expect(page).to have_content("Average Age: 35.3")
    end
  end
end
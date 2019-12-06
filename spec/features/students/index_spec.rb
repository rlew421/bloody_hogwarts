require 'rails_helper'

RSpec.describe "students index page" do
  it "I see a list of students with the following information:
  - Name
  - Age
  - House" do

    student_1 = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
    student_2 = Student.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
    student_3 = Student.create!(name: "Luna Lovegood", age: 15, house: "Ravenclaw")

    visit '/students'


      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_1.age)
      expect(page).to have_content(student_1.house)



      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_2.age)
      expect(page).to have_content(student_2.house)



      expect(page).to have_content(student_3.name)
      expect(page).to have_content(student_3.age)
      expect(page).to have_content(student_3.house)

  end

  it "I see the average age of all students" do
    student_1 = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
    student_2 = Student.create!(name: "Moaning Myrtle", age: 54, house: "Slytherin")
    student_3 = Student.create!(name: "Colin Creevey", age: 11, house: "Gryffindor")

    visit '/students'

    expect(page).to have_content("Average age: 26.7")
  end
end

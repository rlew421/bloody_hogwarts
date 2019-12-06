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

  it "shows students in alphabetical order" do
    herbology = Course.create!(name: "Herbology")

    student_1 = herbology.students.create!(name: "Albus Dumbledore", age: 15, house: "Gryffindor")
    student_2 = herbology.students.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
    student_3 = herbology.students.create!(name: "Luna Lovegood", age: 15, house: "Ravenclaw")
    student_4 = herbology.students.create!(name: "Parvati Patil", age: 15, house: "Ravenclaw")
    student_5 = herbology.students.create!(name: "Neville Longbottom", age: 16, house: "Gryffindor")

    visit '/students'
    save_and_open_page
    expect(page.find_all('.students')[0]).to have_content("#{student_1.name}")
    expect(page.find_all('.students')[1]).to have_content("#{student_2.name}")
    expect(page.find_all('.students')[2]).to have_content("#{student_3.name}")
    expect(page.find_all('.students')[3]).to have_content("#{student_5.name}")
    expect(page.find_all('.students')[4]).to have_content("#{student_4.name}")
  end
end

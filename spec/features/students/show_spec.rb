require 'rails_helper'

RSpec.describe "student show page" do
  it "I see a list of the student's courses" do
    student_1 = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
    herbology = student_1.courses.create!(name: "Herbology")
    potions = student_1.courses.create!(name: "Potions")
    divination = student_1.courses.create!(name: "Divination")

    visit "/students/#{student_1.id}"

    expect(page).to have_content(herbology.name)
    expect(page).to have_content(potions.name)
    expect(page).to have_content(divination.name)
  end
end

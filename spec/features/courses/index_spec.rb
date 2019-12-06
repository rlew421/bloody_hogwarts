require 'rails_helper'

RSpec.describe "courses index page" do
  it "I see a list of courses and the number of students enrolled in each course" do
    herbology = Course.create!(name: "Herbology")
    potions = Course.create!(name: "Potions")
    divination = Course.create!(name: "Divination")

    hermione = herbology.students.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
    neville = herbology.students.create!(name: "Neville Longbottom", age: 16, house: "Gryffindor")
    parvati = herbology.students.create!(name: "Parvati Patil", age: 15, house: "Ravenclaw")

    ginny = divination.students.create!(name: "Ginny Weasley", age: 14, house: "Gryffindor")
    harry = divination.students.create!(name: "Harry Potter", age: 15, house: "Gryffindor")

    draco = potions.students.create!(name: "Draco Malfoy", age: 16, house: "Slytherin")
    blaise = potions.students.create!(name: "Blaise Zabini", age: 15, house: "Slytherin")

    visit '/courses'

    within "#course-#{herbology.id}" do
      expect(page).to have_content("Herbology: 3")
    end

    within "#course-#{potions.id}" do
      expect(page).to have_content("Potions: 2")
    end

    within "#course-#{divination.id}" do
      expect(page).to have_content("Divination: 2")
    end
  end

  it "shows courses in alphabetical order" do
    herbology = Course.create(name: "Herbology")
    defence_against_the_dark_arts = Course.create(name: "Defence Against the Dark Arts")
    transfiguration = Course.create(name: "transfiguration")

    visit '/courses'

    expect(page.find_all('.courses')[0]).to have_content("#{defence_against_the_dark_arts.name}")
    expect(page.find_all('.courses')[1]).to have_content("#{herbology.name}")
    expect(page.find_all('.courses')[2]).to have_content("#{transfiguration.name}")
  end
end

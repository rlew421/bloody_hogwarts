require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    it "#total_enrolled" do
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

      expect(herbology.total_enrolled).to eq(3)
      expect(potions.total_enrolled).to eq(2)
      expect(divination.total_enrolled).to eq(2)
    end
  end
end

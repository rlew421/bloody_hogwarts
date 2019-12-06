require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it ".average_age" do
      student_1 = Student.create!(name: "Hermione Granger", age: 15, house: "Gryffindor")
      student_2 = Student.create!(name: "Moaning Myrtle", age: 54, house: "Slytherin")
      student_3 = Student.create!(name: "Colin Creevey", age: 11, house: "Gryffindor")

      expect(Student.average_age).to eq(26.7)
    end

    it ".sort_alphabetically" do
      herbology = Course.create!(name: "Herbology")

      student_1 = herbology.students.create!(name: "Albus Dumbledore", age: 15, house: "Gryffindor")
      student_2 = herbology.students.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
      student_3 = herbology.students.create!(name: "Luna Lovegood", age: 15, house: "Ravenclaw")
      student_4 = herbology.students.create!(name: "Parvati Patil", age: 15, house: "Ravenclaw")
      student_5 = herbology.students.create!(name: "Neville Longbottom", age: 16, house: "Gryffindor")

      expected = ([student_1, student_2, student_3, student_5, student_4])
      expect(Student.sort_alphabetically).to eq(expected)
    end
  end
end

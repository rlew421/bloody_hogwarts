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
  end
end

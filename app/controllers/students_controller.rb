class StudentsController < ApplicationController
  def index
    @students = Student.all.sort_alphabetically
  end

  def show
    @student = Student.find(params[:student_id])
  end
end

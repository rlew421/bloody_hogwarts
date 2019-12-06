class CoursesController < ApplicationController
  def index
    @courses = Course.all.sort_alphabetically
  end
end

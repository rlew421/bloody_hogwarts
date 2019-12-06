class Course <ApplicationRecord
  validates_presence_of :name
  has_many :student_courses
  has_many :students, through: :student_courses

  def total_enrolled
    students.count
  end

  def self.sort_alphabetically
    Course.order(name: :asc)
  end
end

class Course < ApplicationRecord
  has_many :enrollments, dependent: :restrict_with_exception
  has_many :students, through: :enrollments
end

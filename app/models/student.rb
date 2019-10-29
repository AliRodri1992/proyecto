class Student < ApplicationRecord
  has_many :enrollments, dependent: :restrict_with_exception
  has_many :courses, through: :enrollments

  validates :name, presence: true
end

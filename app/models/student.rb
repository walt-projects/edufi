class Student < ApplicationRecord
  belongs_to :school
  has_many :enrollments
  has_many :cohorts, through: :enrollments

  validates :school, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def enrolled_courses
    cohorts.collect(&:name).join(', ')
  end
end

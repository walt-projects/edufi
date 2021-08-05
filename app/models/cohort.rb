class Cohort < ApplicationRecord
  belongs_to :school
  belongs_to :teacher
  belongs_to :curriculum

  has_many :enrollments
  has_many :students, through: :enrollments

  validates :school, :teacher, :curriculum, presence: true
end

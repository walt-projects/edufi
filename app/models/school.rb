class School < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :cohorts, dependent: :destroy
  has_many :teachers, dependent: :destroy
end

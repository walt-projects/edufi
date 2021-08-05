FactoryBot.define do
  factory :enrollment do
    start_date { 7.days.ago }
    end_date { 7.days.from_now }
    school
    student
    cohort
  end
end

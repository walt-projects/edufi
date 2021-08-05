FactoryBot.define do
  factory :cohort do
    sequence(:name) { |n| "Cohort #{n}" }

    school
    curriculum
    teacher
  end
end

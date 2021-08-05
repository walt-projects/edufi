FactoryBot.define do
  factory :student do
    sequence(:first_name) { |n| "Student#{n}" }
    last_name { 'Edu' }

    school
  end
end

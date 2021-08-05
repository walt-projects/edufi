FactoryBot.define do
  factory :teacher do
    sequence(:first_name) { |n| "Teacher#{n}" }
    last_name { 'Edu' }

    school
  end
end

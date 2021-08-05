FactoryBot.define do
  factory :curriculum do
    sequence(:title) { |n| "Curriculum #{n}" }
    description { 'Nice curriculum' }
    capacity { 5 }
  end
end

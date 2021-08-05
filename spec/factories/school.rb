FactoryBot.define do
  factory :school do
    sequence(:name) { |n| "School #{n}" }
    description { 'Nice school' }
    location { '13 San Marcos Loop, Santa Fe, NM 87508' }
  end
end

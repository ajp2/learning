FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password "random_string"
  end
end

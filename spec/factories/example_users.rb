FactoryGirl.define do
  factory :example_user do
    name Faker::Name.name
    email Faker::Internet.email
    age Faker::Number.between(1, 100)
    password Faker::Internet.password
    is_available false

    trait :dad do
      name "daddy"
      email "daddy@5xruby.tw"
      age 60
      is_available true
    end
  end
end

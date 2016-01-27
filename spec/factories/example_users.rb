FactoryGirl.define do
  factory :my_dad, class: ExampleUser do
    name "KK"
    email "kk@5xruby.tw"
    age 60
    password "jflkdjflskflkdjlk"
  end

  factory :random_user, class: ExampleUser do
    name Faker::Name.name
    email Faker::Internet.email
    age Faker::Number.between(1..100)
    password Faker::Internet.password
  end
end

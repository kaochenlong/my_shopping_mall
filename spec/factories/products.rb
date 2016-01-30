FactoryGirl.define do
  factory :product do
    title Faker::Book.title
    description Faker::Lorem.paragraph
    price Faker::Number.between(10, 1000)

    factory :ruby_book do
      title "Ruby Book"
      description "A Text book for Ruby"
      price 100
    end

    factory :php_book do
      title "PHP Book"
      description "A Text book for PHP"
      price 150
    end
  end
end

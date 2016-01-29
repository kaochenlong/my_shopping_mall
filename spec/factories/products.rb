FactoryGirl.define do
  factory :ruby_book, class: Product do
    title "Ruby Book"
    description "A Text book for Ruby"
    price 100
  end

  factory :php_book, class: Product do
    title "PHP Book"
    description "A Text book for PHP"
    price 150
  end
end

FactoryGirl.define do
  factory :session_hash, class: Hash do
    initialize_with {
      {
        "cart" => {
          "items" => [
            {"product_id" => 2, "quantity" => 3},
            {"product_id" => 5, "quantity" => 4}
          ]
        }
      }
    }
  end
end

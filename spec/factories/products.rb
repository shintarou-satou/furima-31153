FactoryBot.define do
  factory :product do

    association :user 
    
    
    product                {"ああ"}    
    explanation            {"あ"}
    category_id            {"2"}
    condition_id           {"3"}
    delivery_fee_id        {"2"}
    todoufuken_address_id  {"5"}
    shipping_time_id       {"2"}
    price                  {"10000"}  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

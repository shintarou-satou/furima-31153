FactoryBot.define do
  factory :order_address do
    postal_code            {"111-1111"}
    todoufuken_address_id  {1}
    shityouson_address     {"あ"}
    banchi_address         {"い"}
    phone_number           {"11122223333"}
    token                  {"tok_abcdefghijk00000000000000000"}

  end
end

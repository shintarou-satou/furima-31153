FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6,mix_case:false)}
    password_confirmation {password}
    lastname              {"佐藤"}
    firstname             {"信太郎"}
    lastname_kana         {"サトウ"}
    firstname_kana        {"シンタロウ"}
    birthday              {"19801223"}

  end
end
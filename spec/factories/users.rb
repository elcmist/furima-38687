
FactoryBot.define do
  factory :user do
    nickname              {"cat"}
    email                 {"test@test.com"}
    password              {"Kouji1212"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    kana_last_name        {"タナカ"}
    kana_first_name       {"タロウ"}
    birthday              {"1988-12-12"}
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@gmail.com" }
    username "cartman"
    first_name "jeez"
    last_name "shit"
    password "123456"
  end

  factory :question do
    title 'What is this?'
    body 'don doodie'
    user_id 1
  end
end

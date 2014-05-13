# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

   factory :user2, class: User do
    name 'Test User 2'
    email 'example2@example.com'
    password 'please2'
    password_confirmation 'please2'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

end


FactoryGirl.define do
  sequence(:username) {|n| "username#{n}"}

  sequence(:email) {|n| "username#{n}@example.com"}

  factory :user do
    username { FactoryGirl.generate(:username) }
    email { FactoryGirl.generate(:email) }
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end
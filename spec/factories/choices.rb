# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do
    user_id 1
    role_id 1
    meeting_id 1
    want false
  end
end

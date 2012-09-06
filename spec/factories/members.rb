# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member do
    meeting_id 1
    user_id 1
  end

  factory :member_status_false, class: Member do
    meeting_id 1
    user_id 1
    status false
  end

end  

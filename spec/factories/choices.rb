# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do
    user factory: :user
    role factory: :role
    meeting factory: :meeting
    want false
  end
end


FactoryGirl.define do
  factory :choice_no_user_id, class: Choice do
    user_id nil
    role_id 1
    meeting_id 1
    want false
  end

  factory :choice_no_role_id, class: Choice do
    user_id 1
    role_id nil
    meeting_id 1
    want false
  end

  factory :choice_no_meeting_id, class: Choice do
    user_id 1
    role_id 1
    meeting_id nil
    want false
  end

end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "MyString"
    meeting_id 1
    assign_id 1
  end
end

FactoryGirl.define do
  factory :role_no_meeting_id, class: Role do
    name "MyString"
    meeting_id nil
    assign_id 1
  end

  factory :role_no_assign_id, class: Role do
    name "MyString"
    meeting_id 1
    assign_id 1
  end

  factory :role_no_name, class: Role do
    name nil
    meeting_id 1
    assign_id 1
  end

end  

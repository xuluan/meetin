# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    title "MyString"
    agenda "MyText"
    role_list "MyString"
    member_list "MyString"
    started_at "2012-07-24 21:54:16"
    location "MyString"
  end
end

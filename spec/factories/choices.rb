# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do
    member factory: :member
    role factory: :role
    meeting factory: :meeting
    want false
  end

end
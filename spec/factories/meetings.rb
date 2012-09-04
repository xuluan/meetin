# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    title "MyString"
    intro "MyText"
    member_list "aa@bb.com"
    started_at "2012-09-24 21:54:16"
    location "MyString"
    manager factory: :user
  end
end

FactoryGirl.define do

  factory :err_email_memberlist, :class => Meeting do
    title "MyString"
    intro "MyText"
    member_list "MyString"
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager factory: :user
  end

  factory :meeting2, :class => Meeting   do
    title "MyString"
    intro "MyText"
    member_list "aa@bb.com; example@example.com; "
    started_at "2012-08-24 21:54:17"
    location "MyString"
    manager factory: :user
  end

  factory :empty_memberlist, :class => Meeting   do
    title "MyString"
    intro "MyText"
    member_list "  ; \t  ;  \n   ; "
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager factory: :user
  end
end
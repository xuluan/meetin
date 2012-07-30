# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    title "MyString"
    agenda "MyText"
    role_list "MyString"
    member_list "aa@bb.com"
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager_id 1
  end
end

FactoryGirl.define do
  factory :empty_rolelist, :class => Meeting do
    title "MyString"
    agenda "MyText"
    role_list "  \s \n \t"
    member_list "MyString"
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager_id 1    
  end

  factory :err_email_memberlist, :class => Meeting do
    title "MyString"
    agenda "MyText"
    role_list "MyString"
    member_list "MyString"
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager_id 1    
  end

  factory :meeting2, :class => Meeting   do
    title "MyString"
    agenda "MyText"
    role_list "MyString; role_2"
    member_list "aa@bb.com; email_name@email.net; "
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager_id 1    
  end

  factory :empty_memberlist, :class => Meeting   do
    title "MyString"
    agenda "MyText"
    role_list "MyString; role_2"
    member_list "  ; \t  ;  \n   ; "
    started_at "2012-07-24 21:54:16"
    location "MyString"
    manager_id 1    
  end
end
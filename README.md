Meetin
======

TODO

------

* refactoring
>- rbp

* STAGE 2
protect mass assignment
http://rails-bestpractices.com/posts/148-protect-mass-assignment

>- invatation some one
>- Send notify mail for meeting status 
>- check send email issue
   1 cannot send mail
   2 use observer and put in queue
   3 use multipart/alternative as content_type of email

>- list the members who signoff

>- invalid access
>- member exit issue ?

* STAGE 3

* deploy
* kankan and admin

* Strong Parameters
>- meeting: {} will be error?
>- start_at error?  "started_at(1i)"=>"2012"

DONE
------
* refactoring

>- assign (user->member)
>- choice (user->member)
>- member status (hidden)

>- change name
   member_list -> invitation_list
   manager_id -> organizer_id


* STAGE 2
>- add X and set color(update)

>- add test (model and controller)

>- before_delete hook for attendance
>- invatation list to attendance
>- template operate (set as template, create by template, list template)


>- edit attendance (just show)
>- delete attendance
>- edit attendance by template

>- edit role
>- delete role
>- add role
>- edit role by template

* STAGE 1 improve
>- multi page
>- index: all, organizer, member
>- add new_meeting| old_meeting class in index page
>- merge show and edit page to enter page

* MEMBER JOIN/EXIT

* ASSIGN ROLE TO THE MEETING
>- assign role (roles:assign_id, update)
>- cancel role (roles:assign_id, update)
>- set home page


* MEMBER EDIT

>- want  (choices:want create or update)
>- don't want (choices:want create or update)
>- sync to roles and choices when member join or exit


* CREATE MEETING
>- rich editor
>- create meeting
>- remove metting edit and update
>- create db: roles, members, choices
>- add manamger_id
>- validate roles and members
>- parser roles and members
>- add roles
>- add members 
>- send mail
>- setup FactoryGirl


* INIT && SIGNUP && LOGIN
>- add signup login logout 
>- add username
>- setup rspec



* * *
Table
======

#### User
- email
- username

#### Meeting
- title
- agenda
- location
- date time
- roles
- members
- manager_id


#### Role
- name
- meeting_id
- assign_id

#### Member
- user_id
- meeeting_id

#### Choice
- user_id
- role_id
- meeting_id
- want
Meetin
======

TODO
------

* ASSIGN ROLE TO THE MEETING
>- assign function
>- Send notify mail for meeting status 
>- set home page
>- assign role (roles:assign_id, update)
>- cancel role (roles:assign_id, update)

* MEMBER EDIT
>- want  (choices:want create or update)
>- don't want (choices:want create or update)

>- sync to roles and choices when member join or exit

* deploy

STAGE 2

* kankan
* multi page
* profile

DONE
------
* INIT && SIGNUP && LOGIN
>- add signup login logout 
>- add username
>- setup rspec

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

* MEMBER JOIN/EXIT

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
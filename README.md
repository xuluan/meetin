Meetin
======

TODO
------
>- add test
>- add X and set color(update)
>- list the members who signoff
>- Send notify mail for meeting status 

* deploy

STAGE 2

* profile
* kankan and admin


DONE
------

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
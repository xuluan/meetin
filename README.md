Meetin
======

TODO
------
* 2 MEMBER JOIN/EXIT

* 3 ASSIGN ROLE TO THE MEETING

* 4 MEMBER EDIT

* 5 Send notify mail for meeting status 

* 6 AJAX

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
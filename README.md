Meetin
======

TODO
------

* 1 CREATE MEETING
 
>- validate roles and members
>- parser roles and members
>- add roles
>- add members
>- send mail
 
* 2 ASSIGN ROLE TO THE MEETING

* 3 MEMBER JOIN/EXIT

* 4 MEMBER EDIT

DONE
------

- add signup login logout 
- add username
- send mail
- add cucumber and rspec
- rich editor
- create meeting

- remove metting edit and update
- create db: roles, members, choices
- add manamger_id


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
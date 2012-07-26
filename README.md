meetin
======

TODO
------

>- remove metting edit and update

* CREATE MEETING

>- validate roles and members
>- parser roles and members
>- create db: roles, members, choices
>- add roles
>- add members
>- add manamger_id
>- send mail


* ASSIGN ROLE TO THE MEETING

* MEMBER JOIN/EXIT

* MEMBER EDIT



Pending
------

Study
------
- editor plugin


DONE
------

- add signup login logout 
- add username
- send mail
- add cucumber and rspec
- rich editor
- create meeting

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
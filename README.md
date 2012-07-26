meetin
======

TODO
------

- remove metting edit and update

1. CREATE MEETING
- validate roles and members
- parser roles and members
- create db: roles, members, choices
- add roles
- add members
- add manamger_id
- send mail

2. ASSIGN ROLE TO THE MEETING
3. MEMBER JOIN/EXIT
4. MEMBER EDIT



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

===table

- user
email
username

- meeting
title
agenda
location
date time
roles
members
status (open?)
manager_id


- role
name
meeting_id
assign_member
status


- role_assign
user_id
role_id
assign?
user_choice(decline|request|confirm|none)
status
signin?
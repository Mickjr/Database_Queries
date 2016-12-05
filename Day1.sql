select * from users;

select userId, firstname, lastname
from users;

select userId, firstname, lastname
from users
where lastname = 'Smith'
and firstname = 'Grant';

select userId, firstname, lastname, dob
from users
where dob >= '1996-01-01';


select userEmail, firstname, lastname
from users
join userEmail on
users.userId = userEmail.userId
where firstname = 'Colt';

select firstname, lastname, userType
from users
join userType on
users.userTypeId = userType.userTypeId;
where userType = 'client';

insert into users (firstname, lastname, username, password, DOB, gender, userStatusId, userTypeId)
values('Jon', 'Doe', 'JDoe', '12345', '1990-01-02', 'M', 1, 3);

select * from users where username = 'JDoe';

update users set middlename = 'Ralph'
where userId = 'abc123';


delete from users where lastname = 'Horton';

insert into users (userid, firstname, lastname, username, password, DOB, gender, occupationId, userStatusId, userTypeId)
values('abc2345', 'Manton', 'Horton', 'MJhorton', 'yekcim23', '1980-05-05', 'M', 1, 1, 2);

select * from users where username = 'MJhorton';

insert into userEmail (userId, userEmail, userEmailTypeId)
values ('abc2345','mantonhorton@gmail.com', 1);

insert into userEmail (userId, userEmail, userEmailTypeId)
values ('abc2345','mickjr@fullsail.edu', 1);

insert into userPhone (userId, userPhone, userPhoneTypeId)
values ('abc2345', '843-464-8729', 2);

insert into userPhone (userId, userPhone, userPhoneTypeId)
values ('abc2345', '321-263-9764', 1);

select users.userid, userEmail, firstname, lastname
from users
join userEmail on
users.userId = userEmail.userId
where users.userId = 'abc2345';

select * from users;

select users.userid, userEmail, firstname, lastname
from users
join userEmail on
users.userId = userEmail.userId
where users.userId = 'abc2345';

update users set lastname = 'Jr.'
where users.userId = 'abc2345';

select * from users
where userid  = 'abc2345';


local
127.0.0.1
root
root
8889
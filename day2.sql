select users.userid, firstname, lastname, userEmail
from users
join userEmail on users.userid = userEmail.userid;

select u.userid, firstname, lastname, ue.useremail as email
from users as u
inner join userEmail as ue on u.userid = ue.userid;

select * from 
join userEmail;

--- Outer Join (left or Right)
select u.userid, firstname, lastname, useremail
from users as u
inner join userEmail as ue on u.userid = ue.userid;



select u.userid, firstname, lastname, useremail
from users as u
left join userEmail as ue on u.userid = ue.userid
where userEmail is null;

alter table activitylog add foreign key (orderId)
references orders (orderId);

select * from users
where lastname = 'Smith';
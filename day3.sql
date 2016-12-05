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


insert into users (userId, firstname, middlename, lastname, username, password, dob, gender)values ('2238', 'Manton', 'Yekcim', 'Horton', 'Yekcim23', 'mullins', '1980-05-05', 'M');insert into orders (userId, orderDate)values ('2238', '2014-04-07 01:51:00');insert into orderItem (orderId, itemId, quantity)values (21277, 7, 1);insert into orderItem (orderId, itemId, quantity)values (21277, 4, 1);insert into orders (userId, orderDate)values ('2238', '2014-04-07 01:47:00');insert into orderItem (orderId, itemId, quantity)values (21278, 32, 1);insert into orderItem (orderId, itemId, quantity)values (21278, 10, 1);
explain select firstname, lastname from users
where firstname = 'Joe';

explain select firstname, lastname from users
where lastname = 'Smith';
explain select firstname, lastname, useremail
from users
inner join userEmail on users.userId = 
userEmail.userId;

explain select firstname, lastname, useremail
from users
inner join userEmail on users.userId = userEmail.userId
where lastname = 'Smith';

select count(*) from users;

select ucase(lastname) from users limit 100;
select lcase(lastname) from users limit 100;

select mid(lastname,1,3) from users limit 100;

select concat(firstname,' ',mid(middlename,1,1), ' ', lastname) as
fullname
from users;

select round(itemPrice,2), itemPrice from item;

select round(itemPrice,2), itemPrice,
ceiling(itemPrice), floor(itemPrice)
 from item;
 
select now();

select date_format(orderDate, '%b %d %Y %h %i %p'), orderDate
from orders
limit 100;

select date_format(orderDate, '%m %d %y'), orderDate
from orders
limit 100;

select dob, floor(datediff(now(), dob)/365) as age
from users limit 100;

select dateDiff(dob, now())
from users limit 100;

select * from users
where floor(datediff(now(), dob)/365) < 21;

select distinct(station) from cableRawData
order by station;

select concat('$', round(avg(itemPrice),2)) as avgPrice,
min(itemPrice) as minPrice,
max(itemPrice) as maxPrice,
sum(itemPrice) as sumPrice,
( sum(itemPrice) / count(*)) as avgVerified
from item;


select itemCategory, count(*),
concat('$', round(avg(itemPrice),2)) as avgPrice,
min(itemPrice) as minPrice,
max(itemPrice) as maxPrice,
sum(itemPrice) as sumPrice,
( sum(itemPrice) / count(*)) as avgVerified
from item
group by itemCategory;

select avg(publicRating) from dvd;

select genre, avg(publicRating) as apr
from dvd
where publicRating > 2
group by genre
having apr >= 3.7;

CREATE TABLE `usersArchive` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `middleName` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `occupationId` int(11) DEFAULT NULL,
  `userStatusId` int(11) DEFAULT NULL,
  `userTypeId` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
 select * from users 
 where created <= '2013-07-01';
 
 insert into usersArchive
 (select * from users 
 where created <= '2013-07-01');


delete from listing;
delete from genre;
delete from station;

insert into genre (genreName)
(select distinct(genre) from cableRawData);

insert into station (stationName)
(select distinct(station) from cableRawData);

select show1 as listingName, stationId, genreId, premierDate
from cableRawData
join station on cableRawData.station = station.stationName
join genre on genre.genreName = cableRawData.genre;

insert into listing(listingName, stationId, genreId, premierDate)
(select show1 as listingName, stationId, genreId, premierDate
from cableRawData
join station on cableRawData.station = station.stationName
join genre on genre.genreName = cableRawData.genre);

update vehicle set
mpgH = mpgHighway,
mpgC = mpgCity;

select avg(mpgCity) 
from vehicle
limit 10;

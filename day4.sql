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

select itemCategory, count(*),
concat('$', round(avg(itemPrice),2)) as avgPrice,
min(itemPrice) as minPrice,
max(itemPrice) as maxPrice,
sum(itemPrice) as sumPrice,
( sum(itemPrice) / count(*)) as avgVerified
from item
group by itemCategory;

select make, count(model)
from vehicle
where year = '1997'
group by make;

select * from users
union all
select * from usersArchive;

select lastname from users
union all
select lastname from usersArchive;

select lastname, 'u' from users
union all
select lastname, 'a' from usersArchive
order by lastname;

select lastname from users
union
select lastname from usersArchive;

select lastname, firstname from users
union
select lastname, firstname from usersArchive;

select lastname, firstname,  from users
union all
select lastname, 'Unknown' from usersArchive
order by lastname;

select lastname, firstname, 'Before time'  from users
union all
select lastname, 'Unknown', dob from usersArchive
order by lastname;


select userId, firstname, lastname,
(select count(*) from userEmail ue
where ue.userId = u.userId)
as emailCount
from users as u;

select userId, firstname, lastname,
(select userEmail from userEmail ue
where ue.userId = u.userId limit 1)
as emailCount
from users as u;

-- Inner Join, Count: 8001
select users.userId, firstname, lastname, userEmail
from users
inner join userEmail on users.userId = userEmail.userId;

-- Outer Join, Count: 183931, because some users have 2 emails
select users.userId, firstname, lastname, userEmail
from users
left join userEmail on users.userId = userEmail.userId;

-- Scalar Sub-Query, count: 175371 One row per user 
select userId, firstname, lastname,
(select userEmail from userEmail ue
where ue.userId = u.userId limit 1)
as emailCount
from users as u;

select dvdId, DVD_Title,
(select count(*) from userDvd
where userDVD.dvdId = dvd.dvdid)
as copyCount
from dvd
having copyCount > 0;

-- Order Counts
select userId, count(*) orderCount
from orders
group by userId;

-- Inline View (Get everything from users and join against virtual table)
select u.userId, firstname, lastname, orderCount
from users u
left join (
select userId, count(*) as orderCount
from orders group by userId) as oc
on oc.userId = u.userId
limit 10;

-- Correlated
select userId,
(select count(*) from userEmail ue
where ue.userId = u.userId)
as emailCount
from users u;

-- Inline View
select u.userId, firstname, lastname, orderCount
from users u
left join (
select userId, count(*) as orderCount
from orders group by userId) as oc
on oc.userId = u.userId
limit 10;

create view userOrderCount as (
select userId, count(*) as orderCount
from orders group by userId);


CREATE VIEW `userView`
AS select
   `users`.`firstname` AS `firstname`,
   `users`.`lastname` AS `lastname`,
   `users`.`username` AS `username`,
   `users`.`DOB` AS `dob`,
   `userStatus`.`userStatus` AS `userStatus`,
   `userType`.`userType` AS `userType`,
   `users`.`created` AS `createdDate`
from ((`users` join `userStatus`) join `userType`)
where ((`users`.`userStatusId` = `userStatus`.`userStatusId`) 
and (`users`.`userTypeId` = `userType`.`userTypeId`));



select * from userview where username = 'ctrinks2121';

CREATE TABLE `vehicleMake` (
  `vehicleMakeId` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vehicleMakeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicleModel` (
  `vehicleModelId` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vehicleModelId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicleDrive` (
  `vehicleDriveId` int(11) NOT NULL AUTO_INCREMENT,
  `drive` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vehicleDriveId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `vehicleFuelType` (
  `vehicleFuelTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleFuelType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vehicleFuelTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


select make, count(model)
from vehicle
where year = '1997'
group by make
having count(model) >= 5
order by make;
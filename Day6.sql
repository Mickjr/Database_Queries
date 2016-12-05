insert into vehicleMake(make)(select distinct(make) from vehicle);

insert into vehicleModel(model)(select distinct(model) from vehicle);

insert into vehicleDrive(drive)(select distinct(drive) from vehicle);

insert into vehicleFuelType(vehicleFuelType)(select distinct(FuelType) from vehicle);create table `vehicleNormal` (  `vehicleId` int(11) not null auto_increment,  `makeId` int(11) default null,  `modelId` int(11) default null,  `year` int(11) default null,  `cylinders` int(11) default null,  `driveId` int(11) default null,  `mpgHighway` decimal(11,4) default null,  `mpgCity` decimal(11,4) default null,  `fueltypeId` int(11) default null,  primary key (`vehicleId`)) engine=InnoDB auto_increment=1 default charset=latin1;


insert into vehicleNormal (vehicleId, makeId, modelId, year, cylinders, driveId, mpgHighway, mpgCity, fueltypeid)(select vehicleId, vehicleMakeId, vehicleModelid, year, cylinders, vehicledriveid, mpgHighway, mpgCity, vehiclefueltypeidfrom vehiclejoin vehicleDrive on vehicle.drive = vehicleDrive.drivejoin vehicleFuelType on vehicle.fueltype = vehicleFuelType.vehiclefueltypejoin vehicleMake on vehicle.make = vehicleMake.makejoin vehicleModel on vehicle.model = vehicleModel.model);insert into vehicleMake(make)(select distinct(make) from vehicle);

insert into vehicleModel(model)(select distinct(model) from vehicle);

insert into vehicleDrive(drive)(select distinct(drive) from vehicle);

insert into vehicleFuelType(vehicleFuelType)(select distinct(FuelType) from vehicle);create table `vehicleNormal` (  `vehicleId` int(11) not null auto_increment,  `makeId` int(11) default null,  `modelId` int(11) default null,  `year` int(11) default null,  `cylinders` int(11) default null,  `driveId` int(11) default null,  `mpgHighway` decimal(11,4) default null,  `mpgCity` decimal(11,4) default null,  `fueltypeId` int(11) default null,  primary key (`vehicleId`)) engine=InnoDB auto_increment=1 default charset=latin1;


insert into vehicleNormal (vehicleId, makeId, modelId, year, cylinders, driveId, mpgHighway, mpgCity, fueltypeid)(select vehicleId, make, model, year, cylinders, drive, mpgHighway, mpgCity, fueltypefrom vehiclejoin vehicleDrive on vehicle.drive = vehicleDrive.drivejoin vehicleFuelType on vehicle.fueltype = vehicleFuelType.fueltypejoin vehicleMake on vehicle.make = vehicleMake.makejoin vehicleModel on vehicle.model = vehicleModel.model);insert into vehicleMake(make)(select distinct(make) from vehicle);

insert into vehicleModel(model)(select distinct(model) from vehicle);

insert into vehicleDrive(drive)(select distinct(drive) from vehicle);

insert into vehicleFuelType(vehicleFuelType)(select distinct(FuelType) from vehicle);create table `vehicleNormal` (  `vehicleId` int(11) not null auto_increment,  `makeId` int(11) default null,  `modelId` int(11) default null,  `year` int(11) default null,  `cylinders` int(11) default null,  `driveId` int(11) default null,  `mpgHighway` decimal(11,4) default null,  `mpgCity` decimal(11,4) default null,  `fueltypeId` int(11) default null,  primary key (`vehicleId`)) engine=InnoDB auto_increment=1 default charset=latin1;


insert into vehicleNormal (vehicleId, makeId, modelId, year, cylinders, driveId, mpgHighway, mpgCity, fueltypeid)(select vehicleId, make, model, year, cylinders, drive, mpgHighway, mpgCity, fueltypefrom vehiclejoin vehicleDrive on vehicle.drive = vehicleDrive.drivejoin vehicleFuelType on vehicle.fueltype = vehicleFuelType.fueltypejoin vehicleMake on vehicle.make = vehicleMake.makejoin vehicleModel on vehicle.model = vehicleModel.model);select gender,
	case
	when gender = 'M' then 'Male'
	when gender = 'F' then 'Female'
	else 'unknown'
	end as genderText
from users
limit 10;



select dob, 
	case
	when dob > '2002-01-01' then 'child'
	when dob > '1994-01-01' then 'teen'
	when dob > '1976-01-01' then 'adult'
	when dob > '1964-01-01' then 'Mid Life'
	else 'over the hill'
	end as ageCategory
from users
limit 10;

select u.userId, firstname, lastname,
case when orderCount is null then 0
else orderCount
end as orderCount
from users u
left join userordercount as oc
on oc.userId = u.userid
limit 100;

insert into users(userId, firstname, username)
values ('abc', 'Karl', 'zombiKiller');

alter table users add column age int;
update users set age = floor(dateDiff(NOW(), DOB)/365);

delimiter $$

create trigger usersAgeInsert
before insert on users
for each row begin
	set new.created = now();
	set new.age = floor(DATEDIFF(NOW(), new.DOB)/365);
end $$

insert into users(userId, firstname, username, dob)
values ('aaa', 'Zack', 'troll', '1990-04-15');

delimiter $$

CREATE TRIGGER usersCreateActivity
AFTER INSERT ON users
FOR EACH ROW
BEGIN 
insert into activityLog(activityDate, activityText, userId)
values (now(),'User Created', new.userId);
END$$

delimiter ;
insert into users (userId, firstname, username, dob)
values ('ccc', 'Bob', 'Dilbert', '1993-04-15');

update users set age = 22 where age = 21;
update users set age = 30 where age = 31;


-- Say I want the sum total of all items purchased grouped by age. The return data would be a dollar amount per year from 18 to 65. If there are no users on a specific year or no purchases made by users whose age is the specified year, a 0 (or null) would be returned. 
SELECT 	age,  sum(itemPrice * quantity)
from 	users
join	orders on orders.userId = users.userId
join 	orderItem on orderItem.orderId = orders.orderId
join	item on item.itemId = orderItem.itemId
group by age
order by age;


-- Creating a table called numbers 
CREATE TABLE `numbers` (
  `n` int(11) NOT NULL,
  PRIMARY KEY (`n`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` (`n`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20),
	(21),
	(22),
	(23),
	(24),
	(25),
	(26),
	(27),
	(28),
	(29),
	(30),
	(31),
	(32),
	(33),
	(34),
	(35),
	(36),
	(37),
	(38),
	(39),
	(40),
	(41),
	(42),
	(43),
	(44),
	(45),
	(46),
	(47),
	(48),
	(49),
	(50),
	(51),
	(52),
	(53),
	(54),
	(55),
	(56),
	(57),
	(58),
	(59),
	(60),
	(61),
	(62),
	(63),
	(64),
	(65),
	(66),
	(67),
	(68),
	(69),
	(70),
	(71),
	(72),
	(73),
	(74),
	(75),
	(76),
	(77),
	(78),
	(79),
	(80),
	(81),
	(82),
	(83),
	(84),
	(85),
	(86),
	(87),
	(88),
	(89),
	(90),
	(91),
	(92),
	(93),
	(94),
	(95),
	(96),
	(97),
	(98),
	(99),
	(100);

select n as age
from numbers
where n >=18
and n <=65;

-- Scalar sub query 
select n as age,
(
	SELECT case
		when sum(itemPrice * quantity) is null then 0
		else sum(itemPrice * quantity)
		end
	from 	users
	join	orders on orders.userId = users.userId
	join 	orderItem on orderItem.orderId = orders.orderId
	join	item on item.itemId = orderItem.itemId
	where age = n
) as totalSold
from numbers
where n >=18
and n <=65;


-- Inline view
select n as age, totalSold
from numbers
left join (
	SELECT 	age,  sum(itemPrice * quantity) as totalSold
	from 	users
	join	orders on orders.userId = users.userId
	join 	orderItem on orderItem.orderId = orders.orderId
	join	item on item.itemId = orderItem.itemId
	group by age
	order by age
) as ud on ud.age = numbers.n
where n >=18
and n <= 65;


-- Create a view
create view ageSold as
SELECT 	age,  sum(itemPrice * quantity) as totalSold
from 	users
join	orders on orders.userId = users.userId
join 	orderItem on orderItem.orderId = orders.orderId
join	item on item.itemId = orderItem.itemId
group by age
order by age;


-- View 
select n as age, 
	case
	when totalSold is null then 0
	else totalSold
	end as totalSold
from numbers
left join 
	ageSold on ageSold.age = numbers.n
where n >=18
and n <= 65;


-- Day 6 - Functions and Stored Procedures

-- Using "IN" with a sub-query

select * from dvd where genre = 'Silent';

-- deleting from dvd, using "IN"
delete from userDVD where dvdId in
(select dvdId from dvd where genre = 'Silent');

delete from dvd where genre = 'Silent';


-- Day 6 - Functions and Stored Procedures

-- Using "IN" with a sub-query
select * from dvd 
where DVD_Title = '7th Voyage Of Sinbad'
or 	DVD_title = 'Animaniacs, Vol. 1'
or 	DVD_Title = 'ParaNorman';

select * from dvd 
where DVD_Title in ('7th Voyage Of Sinbad','Animaniacs, Vol. 1','ParaNorman');


-- Using "IN" with a sub-query - deleting


select * from dvd where genre = 'Silent';

delete from dvd where genre = 'Silent';

delete from userDVD where dvdId in 
(select dvdId from dvd where genre = 'Silent');

delete from dvd where genre = 'Silent';



-- Function: getSum
delimiter $$


drop function if exists getSum $$

CREATE FUNCTION getSum(a DECIMAL(12,4), b DECIMAL(12,4), c DECIMAL(12,4)) 
RETURNS DECIMAL(12,4)
BEGIN
    RETURN a + b + c;
END$$


-- Test getSum
delimiter ;

select getSum(1.1, 2.4, 3.6) as sum;



-- Scalar Function 
SELECT userId, 
	(SELECT count(*) FROM userEmail ue
	WHERE ue.userId = u.userId)
	AS emailCount
FROM users u
limit 100;

-- Replacing a scalar sub-query with a function

delimiter $$

drop function if exists getUserEmailCount $$

CREATE FUNCTION getUserEmailCount(fId varchar(50)) 
RETURNS int
READS SQL DATA
BEGIN
	declare r int;
	SELECT count(*) into r FROM userEmail WHERE userId = fId;
	return(r);
END$$

-- Test getUserEmailCount
delimiter ; 

SELECT userId, 	getUserEmailCount(userId) AS emailCount
FROM users limit 100;


-- Procedure: procTest1
DELIMITER $$  
CREATE PROCEDURE procTest1 (IN var1 INT, OUT var2 INT, OUT var3 INT)  
BEGIN  
  set var2 = var1 + 2; 
  set var3 = var1 * 2;  
END $$


DELIMITER ;
call procTest1(14,@result1,@result2);
select @result1, @result2;


-- Procedure: getFullName(Complex Procedure)
delimiter $$
DROP PROCEDURE IF EXISTS getFullName $$

create procedure getFullName(in uId varchar(50), out fullname varchar(500))
begin 
	select 	concat(firstname, ' ', lastname) into fullname 
	from 		users 
	where 	userId = uId;
end $$

-- Test getFullName
DELIMITER ;

call getFullName('00bcf640-e245-11e2-89f5-c42c03098f6c',@fullname);
select @fullname;



-- Procedure: createUser
delimiter $$

DROP PROCEDURE IF EXISTS createUser $$

create procedure createUser(in firstname varchar(100), in lastname varchar(100), in middlename varchar(100), in uname varchar(20), in pwd varchar(20), in gender varchar(1), in birth varchar(20), in cellphone varchar(50), in primaryEmail varchar(50), in address varchar(500),	in city varchar(100), in state varchar(20), in zip varchar(20), out uId varchar(50) )
begin 
	
	declare newUserId VARCHAR(50);
	set newUserId = uuid();
	set uId = newUserId;

	start transaction;

	insert into users (userId, firstname, lastname, middlename, username, password, gender, dob) values (
		uId,
		firstname,
		lastname,
		middlename,
		uname,
		pwd,
		gender,
		birth
	);

	insert into userEmail (userId, userEmail, userEmailTypeId) values(
		uId,
		primaryEmail,
		1
	);

	insert into userPhone (userId, userPhone, userPhoneTypeId) values(
		uId,
		cellphone,
		1
	);
	
	insert into userAddress (userId, userAddressTypeId, address, city, state, zip) values(
		uId,
		1,
		address,
		city,
		state,
		zip
	);
	
	commit;
end $$

-- Test createUser
DELIMITER ;

call createUser('Bane','Bloodlust','Crazy','bcb','password','M','1990-05-05','321-555-1212','bane@bloodlust.com','123 Main Street','Orlando','FL','32806',@uId);
select @uId;
select * from users where userId = @uId;

-- Removing a user without violating FKs
delete from userEmail where userId = @uId;
delete from userPhone where userId = @uId;
delete from userAddress where userId = @uId;
delete from activityLog where userId = @uId;
delete from users where userId = @uId;

select state, count(userAddressTypeId) as residentsfrom userAddresswhere userAddressTypeId = 1group by state;

select dvd_title, publicRating, yearfrom dvdgroup by yearorder by publicRating desclimit 10;

select year, genre, avg(publicRating) as avgRatingfrom dvdwhere year = 2002group by genrehaving avgRating >= 2.2order by avgRating asc;

select round(avg(floor(datediff(now(), dob)/365)),2) as avgAgefrom users where occupationId = 164 and gender = 'M';create table `DVDNormal` (  `dvdId` int(11) not null,  `dvdTitle` varchar(255) default null,
  `year` varchar(255) default null,
  `publicRating` decimal(4,2) default null,
  `dvdStudioId` int(11) default null,  `dvdStatusId` int(11) default null,   `dvdGenreId` int(11) default null,  primary key (`dvdId`)) engine=InnoDB default charset=latin1;create table `dvdStudio` (  `studioId` int(11) not null auto_increment,  `studioName` varchar(255) default null,  primary key(`studioId`)) engine=InnoDB auto_increment=1;create table `dvdStatus` (  `statusId` int(11) not null auto_increment,  `statusName` varchar(255) default null,  primary key (`statusId`)) engine=InnoDB auto_increment=1;create table `dvdGenre` (  `genreId` int(11) not null auto_increment,  `genreName` varchar(255) default null,  primary key (`genreId`)) engine=InnoDB auto_increment=1;alter table DVDNormaladd constraint foreign key (`dvdStudioId`) references  `dvdStudio` (`studioId`) on delete cascade on update cascade;alter table DVDNormaladd constraint foreign key (`dvdStatusId`) references  `dvdStatus` (`statusId`) on delete cascade on update cascade;
alter table DVDNormaladd constraint foreign key (`dvdGenreId`) references `dvdGenre` (`genreId`) on delete cascade on update cascade;alter table dvdStatusadd constraint unique index (`statusName`);alter table dvdStudioadd constraint unique index (`studioName`);alter table dvdGenreadd constraint unique index (`genreName`);

alter table dvdadd index (`Status`);

alter table dvdadd index (`Studio`);alter table dvdadd index (`Genre`);

insert into dvdStudio (studioName)(select distinct(Studio) from dvd);

insert into dvdStatus (statusName)(select distinct(Status) from dvd);insert into dvdGenre (genreName)(select distinct(Genre) from dvd);insert into DVDNormal (dvdId, dvdTitle, year, dvdGenreId, dvdStatusId, dvdStudioId, publicRating)(select dvdId, dvd_title, year, genreId, statusId, studioId, publicRating from dvdjoin dvdGenre on dvdGenre.genreName = dvd.Genrejoin dvdStudio on dvdStudio.studioName = dvd.Studiojoin dvdStatus on dvdStatus.statusName = dvd.Status);CREATE VIEW dvdViewAS SELECT	DVDNormal.dvdId as dvdId,	DVDNormal.dvdTitle as dvd_title,	dvdStudio.studioName as dvdStudio,	dvdStatus.statusName as dvdStatus,	dvdGenre.genreName as dvdGenrefrom (((DVDNormal join dvdStudio) join dvdStatus) join dvdGenre)where ((DVDNormal.dvdStudioId = dvdStudio.studioId)and (DVDNormal.dvdStatusId = dvdStatus.statusId)and (DVDNormal.dvdGenreId = dvdGenre.genreId));

select userId, count(dvdId) as DVDsfrom userDVDgroup by userId
limit 100;
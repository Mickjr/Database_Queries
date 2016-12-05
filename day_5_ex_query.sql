select gender,
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
left join userorercount as oc
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










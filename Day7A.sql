


/* Insert */
insert into dvdGenre (dvdGenre)
	values ('Instructional');


/* Update */
update dvdNormal set 
	dvdGenreId = 1
where dvdId = 363;


/* Delete */
delete from dvdGenre where dvdGenre = 'Instructional';


/* Select */
select count(*) from users;
select count(*) from userEmail;


/* Inner Join */
select * from users 
join userEmail on users.userId = userEmail.userId;/* Outer Join */select * from users right join userEmail on	users.userId = userEmail.userId;

/* Cross Join (Cartesian Product) */select * from users join userEmail; /* Scalar Function */
select concat(firstname,' ',lastname) as fullname
from users
limit 10;/* Aggregate Function - Group By */select orderItem.itemId, sum(itemPrice * quantity) as ip
from 	orderItem
join 	item on item.itemId = orderItem.itemId
group by itemId;


/* On, Where and Having */select 	orderItem.itemId, sum(itemPrice * quantity) as sumitemPrice
from 	orderItem
join 	item on item.itemId = orderItem.itemId
where 	itemPrice > 2
group by itemId
having 	sumitemPrice > 20.00;


/* Create Table */
CREATE TABLE `ordersArchive` (
  `orderId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_2a` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/* Insert into Select */
insert into ordersArchive (orderId, userId, orderDate)
	select orderId, userId, orderDateTime 
	from orders where orderId <= 10;


/* Create Index */
create index genreIndex on dvdGenre (dvdGenre);


/* Unions */
select * from ordersunionselect * from ordersArchive;


/* Unions All */
select * from ordersunion allselect * from ordersArchive
order by orderId;

/* Correlated Sub Query*/
select 	* from 	orderItem oiwhere 	1 < (	select count(*) 	from orderItem oi2 	where oi2.orderId = oi.orderId);


/* Correlated Scalar Sub Query*/
SELECT userId, 	(SELECT count(*) FROM userEmail ue	WHERE ue.userId = u.userId)	AS emailCountFROM users u;


/* Non-Correlated Sub Query*/
select 	* from 	item iwhere	i.itemPrice >= (	select avg(i2.itemPrice) as averagePrice 	from item i2);


/* Self Join */
select 	* from 	orderItem oi
where 	1 < (select count(*) from orderItem oi2 
	where oi2.orderId = oi.orderId);


/* Inline View */
select u.userId, firstname, lastname, orderCountfrom users uleft join  (	select userId, count(*) as orderCount 	from orders group by userId) as oc	on  oc.userId = u.userId ;


/* Case */
SELECT firstname, lastname, dob,	CASE WHEN DOB < '1980-01-01'			THEN 'I am Legal'	ELSE 'Go home kid'	END AS nicknameFROM users; /* Numbers Table */
SELECT 	n,  CASE when sumItemPrice is not null THEN sumItemPrice else 0 end as sumItemPricefrom 	numbersleft join (	SELECT	 	age,  sum(itemPrice) as sumItemPrice	from 	users	join	orders on orders.userId = users.userId	join 	orderItem on orderItem.orderId = orders.orderId	join	item on item.itemId = orderItem.itemId	group by age	order by age) as orderSum on orderSum.age = numbers.nwhere 	numbers.n >= 18 and 	numbers.n <= 65;


/* Triggers */
delimiter $$CREATE TRIGGER usersCreateActivityAFTER INSERT ON usersFOR EACH ROW BEGIN	insert into activityLog (activityDate, activityText, userId)	values (now(),'User Created',new.userId);END$$
/*User Defined Functions*/
delimiter $$CREATE FUNCTION bigger(a DECIMAL(12,4), b DECIMAL(12,4) ) RETURNS DECIMAL(12,4)BEGIN
	if (a > b) then  		return a;
	else
		return b;
	end if;END$$delimiter ;
select bigger(10,20);

/* Stored Procedures*/

delimiter $$DROP PROCEDURE IF EXISTS getUser $$create procedure getUser(in uId varchar(50), out fullname varchar(500), out uname varchar(500), out birth date
)begin 	select 	concat(firstname, ' ', lastname), username, dob 
		into fullname, uname, birth	from 	users 	where 	userId = uId;end $$DELIMITER ;call getUser('00bcf640-e245-11e2-89f5-c42c03098f6c',@fullname,@username,@DOB);select @fullname,@username,@DOB;
select count(*) from msa_raw;



alter table msa_jobs
add primary key(jobId);alter table msa_areas
add primary key(areaId);

alter table msa_states
add primary key(state);

alter table msa_facts
add primary key(jobId,areaID);ALTER TABLE msa_factsADD CONSTRAINT FK_jobId FOREIGN KEY(jobId) REFERENCES msa_jobs(jobId);

ALTER TABLE msa_factsADD CONSTRAINT FK_areaId FOREIGN KEY(areaId) REFERENCES msa_areas(areaId);

ALTER TABLE msa_areasADD CONSTRAINT FK_stateFOREIGN KEY(areaState) REFERENCES msa_states(state);

CREATE UNIQUE INDEX jobName ON table(msa_jobs);

ALTER TABLE msa_jobs
ADD UNIQUE (jobName);ALTER TABLE msa_areas
ADD UNIQUE (areaName);

insert into msa_states(states)
select  
from orders 
where orderId <= 10;
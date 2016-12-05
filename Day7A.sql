


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
join userEmail on users.userId = userEmail.userId;


select concat(firstname,' ',lastname) as fullname
from users
limit 10;
from 	orderItem
join 	item on item.itemId = orderItem.itemId
group by itemId;


/* On, Where and Having */
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
select * from orders


/* Unions All */
select * from orders
order by orderId;

/* Correlated Sub Query*/
select 	* 


/* Correlated Scalar Sub Query*/
SELECT userId, 


/* Non-Correlated Sub Query*/
select 	* 


/* Self Join */
select 	* 
where 	1 < (select count(*) from orderItem oi2 
	where oi2.orderId = oi.orderId);


/* Inline View */
select u.userId, firstname, lastname, orderCount


/* Case */
SELECT firstname, lastname, dob,
SELECT 	n,  


/* Triggers */
delimiter $$
/*User Defined Functions*/
delimiter $$
	if (a > b) then
	else
		return b;
	end if;




delimiter $$
)
		into fullname, uname, birth




alter table msa_jobs
add primary key(jobId);
add primary key(areaId);

alter table msa_states
add primary key(state);

alter table msa_facts
add primary key(jobId,areaID);

ALTER TABLE msa_facts

ALTER TABLE msa_areas

CREATE UNIQUE INDEX jobName ON table(msa_jobs);

ALTER TABLE msa_jobs
ADD UNIQUE (jobName);
ADD UNIQUE (areaName);

insert into msa_states(states)
select  
from orders 
where orderId <= 10;
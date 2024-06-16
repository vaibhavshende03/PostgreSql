-- create table
CREATE TABLE customer_table(cust_id int,first_name varchar,last_name varchar,age int,email_id varchar);
-- insert value without specifying the column name 
insert into customer_table VALUES(1,'bee','cee',32,'bc@xyz.com');
-- insert value with colimn name specifying
INSERT into customer_table(cust_id,first_name,age,email_id) VALUES(2,'dee',22,'d@gmail.com');
-- insert multiple values
INSERT into customer_table VALUES (3,'ee','ef',27,'ef@xyz.com'),
(4,'gee','eh',35,'gh@xyz.com');

-- copy csv file
copy customer_table from 'D:\2023\DBMS\PostgreSql\SQL Masterclass_ SQL for Data Analytics\Data\copy.csv' 
DELIMITER ',' CSV HEADER;
--copy text file
copy customer_table from 'D:\2023\DBMS\PostgreSql\SQL Masterclass_ SQL for Data Analytics\Data\copytext.txt' 
DELIMITER ',';

--select
select * from customer_table
--select distinct
SELECT DISTINCT * from customer_table
--
select DISTINCT first_name FROM customer_table
--
--where condition
select first_name from customer_table where age =25;
select first_name,age from customer_table where age >25;
select * from customer_table where first_name='Jay';
--logical operator :and,or and not 
--update
update customer_table set age=17,last_name='pe' where cust_id=2;
update customer_table set email_id='gee@gmail.com' where first_name='Gee' or first_name='gee';
--delete
select * from customer_table;
delete from customer_table where cust_id=2;
delete from customer_table where age>30;
delete from customer_table;
--alter
--add 
alter TABLE customer_table add test VARCHAR(255);
--drop
alter table customer_table drop test;
alter table customer_table drop column test;
--modify
alter table customer_table alter column age type varchar(255);
--rename
alter table customer_table RENAME column email_id to customer_email;
--constraint
--set not null
alter table customer_table alter column cust_id SET NOT NULL;
insert into customer_table (first_name,last_name,age,customer_email) VALUES('aa','bb','25','ab@xyz.com');
--drop not null
alter table customer_table alter column cust_id DROP NOT NULL;
--check
alter TABLE customer_table add constraint cust_id CHECK (cust_id>0);
insert into customer_table (cust_id,first_name,last_name,age,customer_email) VALUES(-1,'cc','dd','28','cd@xyz.com');
--alter primary key
alter TABLE customer_table add primary key (cust_id);
DELETE from customer_table;
insert into customer_table (cust_id,first_name,last_name,age,customer_email) VALUES(1,'cc','dd','28','cd@xyz.com');

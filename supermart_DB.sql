select * from customer where (city='Philadelphia' or city='Seattle');
--in 
select * from customer where city in ('Philadelphia','Seattle');
--between 
select * from customer WHERE age between 20 and 30;
--similar to 
select * from customer WHERE age>=20 and age<=30;
-- not between
select * from customer where age not between 20 and 30;
--
SELECT * from sales where ship_date BETWEEN '2015-04-01' and '2016-04-01';
--single line command
/*multi-
line command
*/
-- like command
select * from customer where customer_name like 'J%';  -- string start with j

select * from customer where customer_name like '%Nelson%'; --string consisting between /first/last

select * from customer where customer_name like '____ %'; --string has customer_name as 4 character and after that any number

select distinct city from customer where city not like 's%';

/*Ex 6*/
select * from customer;

select distinct city from customer where region in ('South','East');
select * from sales where sales between 100 and 500;
select * from customer where customer_name like '% ____'; --last name end with 4 character
/*----OrderBy command----*/
select * from customer where state='California' order by customer_name; --by default it order the data into ascending order
select * from customer where state='California' order by customer_name ASC; --by default it order the data into ascending order

select * from customer ORDER BY city asc, customer_name desc;
select * from customer order by 2 asc;--acending order
select * from customer order by age;

/*limit*/

select * from customer where age > 25 order by age DESC limit 8;
select * from customer where age>25 order by age ASC limit 10;

---------
--Ex 7
select * from sales where discount>0 order by discount desc;
select * from sales where discount>0 order by discount desc limit 10;

/*As (alias*)*/
SELECT customer_id as "Serail Number",customer_name as name,age as customer_age from customer;

/*Agrregate function*/
--count
SELECT * from sales;
SELECT count(*) from sales;

select count(order_line) as "Number of Number of product order",count(DISTINCT order_id) as "number of order" from sales where customer_id='CG-12520';
--sum
select sum(profit) as "total profit" from sales;
select sum(quantity) as "Total Quantity" from sales where product_id='FUR-TA-10000577';
--average
select avg(age) as "average Customer Age" from customer;
select avg(sales*0.10) as "average commision value" from sales;

--min-max()
select min(sales) as "min_sale_Jun 15" from sales where order_date between '2015-06-01' and '2015-06-30';
select sales from sales where order_date between '2015-06-01' and '2015-06-30' order by sales;
select max(sales) as "max_sale_Jun 15" from sales where order_date between '2015-06-01' and '2015-06-30';
/*Ex 8*/
select sum(sales) from sales;
select count(*) from customer where region='North'and age BETWEEN 20 and 30;
select count(*) from customer where  age BETWEEN 20 and 30;
select avg(age) from customer where region='East';
select min(age) as Minimun_age,max(age) as Maximum_age from customer where city='Philadelphia';

/* Group by comman	 */
--group by 
select region,count(customer_id) as customer_count
from customer
GROUP by region;
--
select product_id,sum(quantity) as quantity_sold from sales GROUP by product_id order by quantity_sold desc;
--
select customer_id,
min(sales) as min_sales,
max(sales) as max_sales,
avg(sales)as average_sales,
sum(sales) as Total_sales
from sales
group by customer_id
order by total_sales Desc
limit 5;
--
--having clause
select region,count(customer_id) as "customer count" from customer group by region having count(customer_id)>200;
select region,count(customer_id) as "customer_id" from customer where customer_name like 'A%' group by region;
select region,count(customer_id) as "customer_id" from customer where customer_name like 'A%' group by region having count(customer_id)>15;
/*Ex 9*/
select product_id,sum(sales) as "total_Sales",sum(quantity) as "total_quantity",count(order_id) as "total_order",max(sales) as "maximum sales",min(sales) as "minimun Sales",avg(sales) as "average sales Value" from sales group by product_id order by sum(sales) DESC;
select product_id,sum(quantity) as "total_quantity" from sales group by product_id having sum(quantity)>10;
/*case*/
select *,CASE
	when age<30 then 'Young'
	when age>60 then 'Senior Citizen'
	else 'Middle age'
	end as Age_category
from customer;
/*joins*/
--creating two seperate tables
/*creating sales able of year 2015*/
create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
select count(*) from sales_2015;--2131
select count(distinct customer_id) from sales_2015;--578
/*customer with age between 20 and 60*/
create table  customer_20_60 as select * from customer where age between 20 and 60;
select count(*) from customer_20_60;--597
/*Inner join*/
select 
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
inner join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;
/*Left join*/
SELECT a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id=b.customer_id
order by customer_id;

/*Right join*/
SELECT
a.order_line,
a.product_id,
a.customer_id,
--a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a
right join customer_20_60 as b
on a.customer_id=b.customer_id
order by customer_id;

/*Full outer join*/
select 
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age,
b.customer_id
from sales_2015 as a
full join customer_20_60 as b
on a.customer_id = b.customer_id
order by customer_id;
/*Cross join*/
create table months_values(MM int);
create table years_values(YYYY int);
insert into months_values values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
insert into years_values values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);
select * from months_values;
select * from years_values;
--cross join
select a.YYYY,b.MM
from years_values as a,months_values as b
order by a.YYYY,b.MM;

/*combining query*/
--intersect
select customer_id from sales_2015
intersect 
select customer_id from customer_20_60;
--except
select customer_id
from sales_2015
EXCEPT
select customer_id
from customer_20_60
order by customer_id;
--union
select customer_id from sales_2015
union
SELECT customer_id from customer_20_60
order by customer_id;
/*Ex 10*/
select * from sales_2015
select * from customer_20_60
--1
select sum(sales),
b.state
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id=b.customer_id
group by state;

--2
select a.*,sum(b.sales) as total_sales,sum(quantity) as total_quantity
from product as a
left join sales as b
on a.product_id = b.product_id
group by a.product_id;
/*-------------------------------------------------*/
/*Subquery in where part*/
select * from sales
where customer_id in(
select DISTINCT customer_id
from customer where age>60);
/*Subquery in from part*/
SELECT a.product_id,
a.product_name,
a.category,b.quantity
from product as a
left join (SELECT product_id,sum(quantity)as quantity from sales group by product_id) as b
on a.product_id=b.product_id
order by b.quantity desc;

/*Subquery in select part*/
select customer_id,order_line,(select customer_name from customer where customer.customer_id=sales.customer_id)
from sales order by customer_id;
/*Ex 11*/
select sp.*,c.Customer_name,c.age
from customer as c
right join (select s.*,p.product_name,p.category
		   from sales as s
		   left join product as p
		   on s.product_id = p.product_id) as sp
		   on c.customer_id=sp.customer_id;
/*Views*/
create VIEW logistic AS
select a.order_line,
a.order_id,
b.customer_name,
b.city,
b.state,
b.country
from sales as a
left join customer as b
on a.customer_id=b.customer_id
order by a.order_line;
--display the view
select * from logistic;
/*index*/
create index mon_inx
on months_values(MM);
/*ex 12*/
--1
create view daily_billing AS select order_line,product_id,sales,discount
from sales
where order_date in (select max(order_date) from sales);
select * from daily_billing;
--2
drop view daily_billing;

/*sting function*/
--lenght()
select customer_name,length(customer_name) as character_num
from customer
where age>30;
-- where length(customer_name)>30;
/*Ex 13*/
--1
select product_name,max(length(product_name)) as Max_len
from product
group by product_name;
--1
select max(length(product_name)) as Max_len
from product;
--2
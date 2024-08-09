select * from product

--having subquery

select product_id from product where product_id in(
	select product_id 
	from sales
	group by product_id
	having sum(sales)>2000)   

--Find if we can do insert, update, alter , delete on view 

select * from customer

create view customer_data as
select c.customer_id,customer_name,c.age,sum(sales),avg(sales) from sales as s
       inner join customer as c
      on c.customer_id=s.customer_id
      group by c.customer_id,customer_name,c.age


select * from customer_data

--insert

insert into customer_data(customer_name,age) values('sita',33)  ---error

--update

update  customer_data set customer_name='c1' where customer_id='CB-12535'  --error

--alter

alter table customer_data add column city double precision    --error

--delete

delete from customer_data where customer_id='HZ-14950'   --error
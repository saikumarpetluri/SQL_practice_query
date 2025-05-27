create database Sales;
use Sales;
select * from sales_data;
alter table sales_data rename column ORDERDATE to ORDERDATES;
select * from sales_data;
select ORDERNUMBER from sales_data;
select count(*) from sales_data;
select * from sales_data where  ORDERNUMBER='10121';
select count(ORDERNUMBER) from sales_data;
select * from sales_data;
alter table sales_data add district varchar(20) ;
delete from sales_data where ORDERNUMBER='10121';
select * from sales_data where  ORDERNUMBER='10121';
alter table sales_data drop column district;
alter table sales_data rename column ORDERDATES to ORDERDATE;
alter table sales_data rename to sales_datas;
alter table sales_datas rename to sales_data;
drop table deportment;
drop database employee;
select * from sales_data;
select ORDERNUMBER,SALES,PRODUCTLINE,CUSTOMERNAME from sales_data;
select count(distinct(CUSTOMERNAME)) as Names from sales_data;
select count(*) from sales_data where CUSTOMERNAME='Corporate Gift Ideas Co.';
select  * from sales_data where ORDERNUMBER='10145';
select  count(distinct(ORDERNUMBER)) from sales_data;
select * from sales_data where SALES<=3000;
select count(*) from sales_data where SALES>5500;
select * from sales_data;
select * from sales_data where ORDERDATE='10/10/2003 0:00' and ORDERLINENUMBER='15';
select *from sales_data where ORDERDATE='2/24/2003 0:00' or ORDERLINENUMBER='2';
select * from sales_data where not PRICEEACH='99' and PRICEEACH='92.83';
select * from sales_data where ORDERDATE='8/25/2003 0:00' and SALES='3746.7' or ORDERNUMBER='10100';
select PRODUCTLINE,ORDERNUMBER,ORDERDATE from sales_data where PRODUCTLINE='Motorcycles' and ORDERDATE='11/11/2003 0:00' order by ORDERNUMBER asc;
select * from sales_data;
select PRICEEACH,ORDERDATE  from sales_data where ORDERDATE='1/29/2003 0:00' order by PRICEEACH asc;
select * from sales_data where CUSTOMERNAME='Toys4GrownUps.com' order by ORDERLINENUMBER asc;
select * from sales_data where CUSTOMERNAME='Toys4GrownUps.com' order by ORDERLINENUMBER desc;
select * from sales_data where CUSTOMERNAME is  null;
select * from sales_data where ORDERNUMBER is not null;
select count(*) from sales_data where ORDERNUMBER is not null;
select * from sales_data;
select sum(SALES) as sales from sales_data where YEAR_ID='2004';
select count(*) from sales_data where MONTH_ID='2' and YEAR_ID='2004';
select * from sales_data where MONTH_ID='2' and YEAR_ID='2004' order by ORDERLINENUMBER desc limit 2,4;
select min(SALES) from sales_data where STATE='CA';
 
select count(*) from sales_data where not  STATE ='CA'; 
-- Find the count of missing values in state column.
select count(*) from sales_data where STATE='';
select * from sales_data;
-- Find the all records in the mounth 2,7,8.
select * from sales_data where MONTH_ID in (2,7,8);
-- limit function.
-- Find the customer detailes who places the hight order by quantity. 
select CUSTOMERNAME,ORDERNUMBER from sales_data order by  QUANTITYORDERED desc limit 1;
select * from sales_data;
-- Find the total orders between 2003 and 2004.
select count(*) from sales_data where YEAR_ID between '2003' and '2004'; 
select max(QUANTITYORDERED) from sales_data;
select * from sales_data where ORDERDATE ='2/24/2003 0:00' order by ORDERLINENUMBER desc limit 2,3;
-- Like functuon.
select CITY from sales_data where CITY like 'p%';
select CITY from sales_data where CITY like 'p%a';
select CUSTOMERNAME from sales_data where CUSTOMERNAME like 'L%';
select * from sales_data;
select count(*) from sales_data where ADDRESSLINE1 like '%hillside%';
select CITY from sales_data where CITY like '_____';
select CITY from sales_data where CITY like '____s';
select CITY from sales_data where CITY like 'B____';
-- group by .
select round(sum(SALES),2) as sales,PRODUCTLINE from sales_data group by PRODUCTLINE;
select * from sales_data;
select count(ORDERNUMBER)as orders,COUNTRY from sales_data group by COUNTRY;
select round(sum(SALES)),YEAR_ID,MONTH_ID from sales_data group by YEAR_ID,MONTH_ID;
select * from sales_data;
select count(SALES),PRODUCTLINE from sales_data group by PRODUCTLINE;
select round(sum(SALES),2)as sales,MONTH_ID,YEAR_ID from sales_data group by MONTH_ID,YEAR_ID;
-- find the PRODUCTLINE which has order >500.
-- Having clause = where clause.
select count(ORDERNUMBER),PRODUCTLINE from sales_data group by PRODUCTLINE having count(ORDERNUMBER)>500;
select round(avg(SALES),2) as sales,PRODUCTLINE from sales_data group by PRODUCTLINE having avg(SALES)>=3520;
select max(SALES),PRODUCTLINE from sales_data group by PRODUCTLINE;
select min(SALES),PRODUCTLINE from sales_data group by PRODUCTLINE having min(SALES)>500;
select * from sales_data;
select count(PHONE),PRODUCTLINE,CUSTOMERNAME from sales_data group by CUSTOMERNAME,PRODUCTLINE;
select sum(SALES),COUNTRY from sales_data group by COUNTRY order by sum(SALES),COUNTRY desc;
create database Subquery;
use Subquery;
select *  from customer;
select *  from payment;
-- Find the details of those costomers,whose payment ammount
-- is grater than the avg of amount paid by all customers.
select * from payment where amount>
(select avg(amount) from payment);
-- In 
select * from customer where customer_id in 
(select customer_id from payment where amount>(select avg(amount) from payment));
-- get the payment detailes of customer whose coustomer_id>12.
select * from payment where customer_id in
(select customer_id from payment where customer_id>12);












-- SQL Retail Sales Analysis - P1
create database sql_project_p2;

--create table
--if table with similar name exist then use below code drop table if exists retail_sales
create table retail_sales
			(
				transactions_id int primary key,
				sale_date date,
				sale_time time,
				customer_id	int,
				gender varchar(10),
				age int,
				category varchar(15),
				quantity int,
				price_per_unit float,
				cogs float,
				total_sale float
			);

select * from retail_sales
limit 10;

select 
	count(*)
from retail_sales

--DATA CLEANING
--checking null values in a column
select * from retail_sales
where transactions_id is null

select * from retail_sales
where sale_date is null

select * from retail_sales
where sale_time is null

--Best way to check null values in all of the columns at once
select * from retail_sales
where 
	transactions_id is null
	or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
	or 
	category is null
	or
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null

--let's delete the null records
delete from retail_sales
where 
	transactions_id is null
	or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
	or 
	category is null
	or
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null

--Data Exploration
--How many sales we have?
select 
	count(*) as total_sale
from retail_sales

--How many customers we have?
select
	count(customer_id) as customer_count
from retail_sales

--How many unique customers ?
select
	distinct(count(customer_id)) as customers_count
from retail_sales

--List of Unique Categories in Dataset
select 
	distinct(category) as category_names
from retail_sales

--MAIN DATA ANALYSIS/BUSINESS KEY PROBLEMS & ANSWERS
--Q1)SQL query to retrieve all columns for sales made on '2022-11-05'

select *
from retail_sales
where sale_date = '2022-11-05';

/*Q2)SQL query to retrieve all transactions where the category is 'Clothing' & the quantity sold
is more than 10 in the month of Nov-2022*/ --check
--1
select
	*
from retail_sales
where category = 'Clothing'
  and quantity >= 4
  and extract(month from sale_date) = 11
  and extract(year from sale_date) = 2022;

--2
select *
from retail_sales
where category = 'Clothing'
and to_char(sale_date, 'yyyy-mm') = '2022-11'
and quantity >=4;

/*3-when we are given the hard coded value
select *
from retail_sales
where sale_date >= '2022-11-01'
and sale_date < '2022-11-02';
*/

 /*
 sale_date::date means “take the value in sale_date and treat it as a date”.helpful when we are sure what's the data type
 and extract(month from sale_date::date) = 11
 */

--Q3)SQL query to calculate the total sales for each category

select
	sum(total_sale) as Category_Sales,
	category
from retail_sales
group by category
order by Category_Sales DESC;

--Q4)SQL query to find the avg. age of customers who purchased items from the 'Beauty' category

select
	round(avg(age),0) as avg_customer_age,
	category
from retail_sales
where category = 'Beauty'
group by category;

--Q5)SQL query to find all transactions where the total_sale is greater than 1000

select
	transactions_id,
	total_sale
from retail_sales
where total_sale > 1000
order by total_sale desc;

--Q6)SQL query to find total number of transactions(transaction_id) made by each gender in each category.

select
	category,
	gender,
	count(*) as total_transactions
from retail_sales
group by category, gender
order by 1;
--order by total_transactions;

--Q7)SQL query to calculate the average sale for each month.Find out best selling month in each year

select
    extract(year from sale_date) as sales_year,
    extract(month from sale_date) as sales_month,
    avg(total_sale) as avg_total_sales
from retail_sales
group by sales_year, sales_month
order by 1,3 desc;
--above code gives highest avg sales by year.to get highest avg. sales for each year we would need to use RANK()

select
	sales_year,
	sales_month,
	avg_sales
from (
select
	extract(year from sale_date) as sales_year,
	extract(month from sale_date) as sales_month,
	avg(total_sale) as avg_sales,
	rank() over (partition by extract(year from sale_date) order by avg(total_sale) desc) as rank1
from retail_sales
group by sales_year, sales_month
order by sales_year, avg_sales desc
)as t1
where rank1=1;

--Q8)SQL query to find the Top 5 customers based on the highest total sales

select
	customer_id,
	sum(total_sale) as total_sales
from retail_sales
group by customer_id
order by total_sales desc
LIMIT 5;

--Q9)Query to find the number of unique customers who purchased items from each category.

select
	category,
	count(distinct(customer_id)) as unique_customer_count
from retail_sales
group by category
order by unique_customer_count;

--Q10)Query to create each shift and number of orders(exp Morning<12, Afternoon Between 12 & 17, evening>17)
/*
select
		case (
				if sale_time is between 00:00:00 and 12:00:00 then "Morning",
				if sale_time is between 12:00:00 and 17:00:00 then "Afternoon",
				if sale_time is between 17:00:00 and 00:00:00 then "evening"
		) as order_shift,
		count(transactions_id) as count_transaction 
from reatil_sales
group by order_shift
order by count_transaction desc;
*/
--1
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    else 'Evening'
  END AS shift,
  SUM(total_sale) AS total_sales
FROM retail_sales
WHERE total_sale IS NOT NULL
GROUP BY shift
ORDER BY total_sales DESC;

--2
with hourly_sales
as 
(
SELECT *,
  CASE
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    else 'Evening'
  END AS shift
FROM retail_sales
)
select 
	shift,
	count(*) as total_orders
from hourly_sales
group by shift
order by total_orders desc;
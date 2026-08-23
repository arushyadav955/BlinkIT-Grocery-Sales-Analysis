

create database Blinkit_Project

create table blinkit_data (
    item_fat_content varchar(20),
    item_identifier varchar(50),
    item_type varchar(50),
    outlet_establishment_year int,
    outlet_identifier varchar(50),
    outlet_location_type varchar(50),
    outlet_size varchar(20),
    outlet_type varchar(50),
    item_visibility decimal(10,4),
    item_weight decimal(10,2),
    sales decimal(12,2),
    rating decimal(3,1)
)
-- Inserting data into the table
bulk insert blinkit_data
from 'E:\Skills\Projects\Blinkit Project\BlinkIT Grocery Data Cleaned.csv'
with (
    firstrow = 2,
    fieldterminator = ',',S
    rowterminator = '0x0a',
    tablock
);

select * from blinkit_data;

update blinkit_data
set item_fat_content = case
    when item_fat_content in ('LF','low fat') then 'Low Fat'
    when item_fat_content = 'reg' then 'Regular'
    else item_fat_content end;

select distinct item_fat_content from blinkit_data;

-- total sales
select sum(sales) as total_sales from blinkit_data;

-- total sales in millions
select cast(sum(sales)/1000000 as decimal(10,2)) as total_sales_in_millions
from blinkit_data;

-- avg sales
select round(avg(sales),2) as avg_sales from blinkit_data;

select cast(avg(sales) as decimal(10,2)) as avg_sales from blinkit_data;

-- avg sales per year
select outlet_establishment_year,
    cast(avg(sales) as decimal(10,2)) as avg_sales
from blinkit_data
group by outlet_establishment_year
order by outlet_establishment_year desc;

-- number of items
select distinct item_type from blinkit_data;

select item_type, count(item_type) as item_count
from blinkit_data
group by item_type;

select count(*) as total_items from blinkit_data;

-- total sales based on 'item_fat_content'
select item_fat_content, cast(sum(sales) as decimal(10,2)) as total_sales
from blinkit_data
group by item_fat_content;

-- total sales per year
select outlet_establishment_year, sum(sales) as total_sales
from blinkit_data
group by outlet_establishment_year
order by outlet_establishment_year desc;

select item_fat_content, outlet_establishment_year, sum(sales) as total_sales
from blinkit_data
group by outlet_establishment_year, item_fat_content
order by outlet_establishment_year desc;

-- avg rating
select cast(avg(rating) as decimal(10,1)) as avg_rating from blinkit_data;

select item_type, cast(avg(rating) as decimal(10,1)) as avg_rating
from blinkit_data
group by item_type
order by avg_rating desc;

-- total avg sales and avg rating
select item_fat_content,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    cast(avg(rating) as decimal(10,1)) as avg_rating,
    count(*) as total_items
from blinkit_data
group by item_fat_content;

select item_fat_content, outlet_establishment_year,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    cast(avg(rating) as decimal(10,1)) as avg_rating,
    count(*) as total_items
from blinkit_data
group by item_fat_content, outlet_establishment_year;

-- total sales by item type
select item_type, cast(sum(sales) as decimal(10,2)) as total_sales
from blinkit_data
group by item_type;

select top 5 item_type,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    cast(avg(rating) as decimal(10,1)) as avg_rating,
    count(*) as total_items
from blinkit_data
group by item_type
order by total_sales desc;

-- fat content by outlet for total sales
select outlet_location_type, item_fat_content,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,1)) as avg_rating
from blinkit_data
group by outlet_location_type, item_fat_content
order by total_sales;

select
    outlet_location_type,
    coalesce(sum(case when item_fat_content = 'Low Fat' then sales end), 0) as low_fat,
    coalesce(sum(case when item_fat_content = 'Regular' then sales end), 0) as regular
from blinkit_data
group by outlet_location_type
order by outlet_location_type;

-- total sales by outlet establishment
select outlet_establishment_year,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as total_avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,1)) as avg_rating
from blinkit_data
group by outlet_establishment_year
order by total_sales desc;

-- percentage of sales by outlet size
select * from blinkit_data;

select outlet_size,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast((sum(sales) * 100.0 / sum(sum(sales)) over()) as decimal(10,2)) as sales_percentage
from blinkit_data
group by outlet_size
order by total_sales desc;

-- sales by outlet location
select outlet_location_type,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as total_avg_sales,
    coalesce(sum(case when outlet_size = 'Small' then sales end), 0) as small,
    coalesce(sum(case when outlet_size = 'Medium' then sales end), 0) as medium,
    coalesce(sum(case when outlet_size = 'High' then sales end), 0) as high
from blinkit_data
group by outlet_location_type
order by outlet_location_type;

select outlet_location_type,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as total_avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,1)) as avg_rating,
    cast((sum(sales) * 100.0 / sum(sum(sales)) over()) as decimal(10,2)) as sales_percentage
from blinkit_data
group by outlet_location_type
order by outlet_location_type desc;

-- all metrics by outlet type
select outlet_type,
    cast(sum(sales) as decimal(10,2)) as total_sales,
    cast(avg(sales) as decimal(10,2)) as total_avg_sales,
    count(*) as no_of_items,
    cast(avg(rating) as decimal(10,1)) as avg_rating,
    cast((sum(sales) * 100.0 / sum(sum(sales)) over()) as decimal(10,2)) as sales_percentage
from blinkit_data
group by outlet_type
order by total_sales desc;
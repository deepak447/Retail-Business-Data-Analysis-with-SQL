-- Question: Update the ship_mode to 'Express Air' for all orders shipped with 'Same Day' mode in the 'West'
-- region.

select * from store
where ship_mode = 'Same Day' and region = 'West';

update store
set ship_mode = 'express air' 
where ship_mode = 'Same Day' and region = 'West';


select * from store 
where ship_mode = 'express air'

-- Question: Increase the profit by 10% for all sales records where the category is 'Technology' and 
-- profit is positive.
select * from store
where category = 'Technology' and profit > 0;

update store 
set profit = profit * 1.10
where category = 'Technology' and profit > 0;

-- Question: Set the returns status to 1 (returned) for order_id 'CA-2019-125206'.

update store
set returns = 1
where order_id = 'CA-2019-125206';

select returns from store
where order_id = 'CA-2019-125206';

-- Question: Update customer_name from 'Brendan Murry' to 'Brendan S. Murry' for customer_id 'BM-11575'.

update store
set customer_name = 'Brendan S'
where customer_id  = 'BM-11575';

-- Question: For orders placed in '2019-01-02' (YYYY-MM-DD format), 
-- update the payment_mode to 'Debit Card' if it was originally 'Online'.
select *
from store
where order_date = '2019-01-02';

update store
set payment_mode =  'Debit Card'
where payment_mode = 'Online';

-- Question: Decrease the sales amount by 5% for all 'Office Supplies' items where the quantity sold is greater than 5.

select * 
from store
where category = 'Office Supplies' and quantity >5;

update store
set sales = sales*0.95
where category = 'Office Supplies' and quantity >5;

-- Question: Rename the column profit to net_profit.

alter table store
rename profit to net_profit;
select * from store;

-- Question: Add a new column delivery_status of type VARCHAR(20) with a default value of 'Pending'.
alter table store
add column delivery_status varchar(20) default  'Pending';

-- Question: Change the data type of the order_id column from VARCHAR(50) to VARCHAR(100).
alter table store
alter column ordeR_id type varchar(100);

-- Question: Convert the returns column from INT to BOOLEAN, assuming 0 is FALSE and 1 is TRUE.

alter table store
alter column returns type boolean using case when returns = 1 then True else false end; 

-- Question: Modify the sales column to have a precision of NUMERIC(12, 3).

alter table store
alter column sales type numeric(12,3);
select * from store;

-- Question: Change the data type of quantity from INT to SMALLINT, assuming quantities are always small.

alter table store 
alter column quantity type smallint;

-- Question: Add a check constraint to ensure quantity is always positive.

alter table store
add constraint quantity_positivity check (quantity >0);

update  store
set quantity = -1
where customer_id  = 'BM-11575' and payment_mode = 'Debit Card' and region = 'East';

select * 
from store
where customer_id  = 'BM-11575' and payment_mode = 'Debit Card' and region = 'East';

-- Question: Delete all sales records where the profit is negative and sales < 1.5.
select * from store
where net_profit < 0 and sales < 1.5;

delete from store
where net_profit < 0 and sales < 1.5;

-- Question: Calculate the number of days between order_date and ship_date for each record.
select order_date
from store;

alter table store
alter column order_date type date using order_date :: date;

select order_id, order_date , ship_date,
(ship_date-order_date)  as shpping_days
from store ;

-- Question: Select sales and profit rounded to two decimal places.

select order_id,
	round(sales,2) as rounded_sales,
	round(net_profit,2) as rounded_profit
from store;




















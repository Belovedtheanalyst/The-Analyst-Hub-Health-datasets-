##QUESTION6
##Provide the name for each region for every order, as well as the account name and 
##the unit price they paid (total_amt_usd/total) for the order. However, 
##you should only provide the results if the standard order quantity exceeds 100 and
##the poster order quantity exceeds 50. 
## Your final table should have 3 columns: region name, account name, and unit price. 
 ##Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to 
 ##the denominator here is helpful (total_amt_usd/(total+0.01).
 
select region.name, accounts.name, orders.total_amt_usd, orders.total,
(orders.total_amt_usd/(orders.total+0.01))  Unit_price
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
inner join region
on region.id = sales_reps.region_id
where orders.standard_qty >100 and orders.poster_qty > 50
order by Unit_price desc;

select region.name, accounts.name,
round((orders.total_amt_usd/(orders.total+0.01)))  Unit_price
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
inner join region
on region.id = sales_reps.region_id
where orders.standard_qty >100 and orders.poster_qty > 50
order by Unit_price desc;

select * from orders;
select * from region;
select * from accounts;
select * from web_events;
select * from sales_reps;

##What are the different channels used by account id 1001? 
##Your final table should have only 2 columns: account name and the different channels.
## You can try SELECT DISTINCT to narrow down the results to only the unique values.

select distinct accounts.id, accounts.name, web_events.channels
from accounts
inner join web_events
on accounts.id = web_events.account_id
where accounts.id = 1001;

select distinct accounts.name, web_events.channels
from accounts
inner join web_events
on accounts.id = web_events.account_id
where accounts.id = 1001;

select distinct accounts.name, web_events.channels
from accounts
inner join web_events
on accounts.id = web_events.account_id
where accounts.id = 1001;

select accounts.name, web_events.channels
from accounts
inner join web_events
on accounts.id = web_events.account_id
where accounts.id = 1001;


##	Which channel generated more revenue?

select web_events.channels, sum(orders.total_amt_usd) Total_revenue
from web_events
inner join accounts
on accounts.id = web_events.account_id
inner join orders
on accounts.id = orders.account_id
group by web_events.channels
order by  Total_revenue desc;

select web_events.channels, (round(sum(orders.total_amt_usd)))  Total_revenue
from web_events
inner join accounts
on accounts.id = web_events.account_id
inner join orders
on accounts.id = orders.account_id
group by web_events.channels
order by  Total_revenue desc
limit 1;


select web_events.channels, format(round(sum(orders.total_amt_usd)),0) Total_revenue
from web_events
inner join accounts
on accounts.id = web_events.account_id
inner join orders
on accounts.id = orders.account_id
group by web_events.channels
order by web_events.channels desc;


## Which account had an order with the most items?

 select accounts.name, Sum(orders.total) Total_orders
 from orders
 inner join accounts
 on accounts.id = orders.account_id
 group by accounts.name
 order by Total_orders desc; 
 
 select accounts.name, Sum(orders.total) Total_orders
 from orders
 inner join accounts
 on accounts.id = orders.account_id
 group by accounts.name
 order by Total_orders desc; 
 
 select * from orders;
 select * from accounts;
 
 ##Which sales_rep had the most orders? 
## or least orders?

select sales_reps.name, count(orders.id)  Order_qty
from accounts
inner  join sales_reps
on sales_reps.id = accounts.sales_rep_id
inner join orders
on accounts.id = orders.account_id
group by  sales_reps.name
order by Order_qty desc;


select sales_reps.name, count(orders.id)  Order_qty
from accounts
inner  join sales_reps
on sales_reps.id = accounts.sales_rep_id
inner join orders
on accounts.id = orders.account_id
group by  sales_reps.name
order by Order_qty asc;


#1.	Find the total amount of poster_qty paper ordered in the orders table.
select format(sum(orders.poster_qty),0) Poster_qty from orders;
  #Find the total amount of standard_qty paper ordered in the orders table.
select format(sum(orders.standard_qty),0) Standary_qty from orders;


##Find the total dollar amount of sales using the total_amt_usd in the orders table.
select   format(sum(orders.total_amt_usd),0) Total_amt from orders;

##	Find the total amount spent on standard_amt_usd and gloss_amt_usd paper
## for each order in the orders table. 
## This should give a dollar amount for each order in the table.

select sum(orders.standard_amt_usd), sum(orders.gloss_amt_usd) from orders;

select orders.id, sum(orders.standard_amt_usd + orders.gloss_amt_usd) as Total_amt
from orders
group by orders.id
order by sum(orders.standard_amt_usd + orders.gloss_amt_usd) desc;


select orders.id Orders_id, format(round(sum(orders.standard_amt_usd + orders.gloss_amt_usd)),0) 
as Total_amt
from orders
group by orders.id
order by sum(orders.standard_amt_usd + orders.gloss_amt_usd) desc;


	##Find the standard_amt_usd per unit of standard_qty paper.
## Your solution should use both an aggregation and a mathematical operator.

select (orders.standard_amt_usd/orders.standard_qty) Unit_price
from orders;

select avg(round(orders.standard_amt_usd/orders.standard_qty)) Unit_price
from orders;


select   round(avg(orders.standard_amt_usd/orders.standard_qty)) Unit_price
from orders;

##How many of the sales reps have more than 5 accounts that they manage?

select sales_reps.name, count(accounts.id)  Managed_Account from
accounts
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by  sales_reps.name 
having count(accounts.id)  > 5
order by count(accounts.id) desc;

select sales_reps.name, count(accounts.id)  Managed_Account from
accounts
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
where accounts.id  > 5
group by  sales_reps.name 
order by count(accounts.id) desc;


##How many accounts have more than 20 orders?
select accounts.id, count(orders.id) Count_of_Orders
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.id
having count(orders.id) > 20
order by count(orders.id) desc;

##Which account has the most orders?
select accounts.id, count(orders.id) Count_of_Orders
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.id
order by count(orders.id) desc
limit 1;

## Which accounts spent more than 30,000 usd total across all orders?

select orders.total_amt_usd from orders
where orders.total_amt_usd > 30000
order by orders.total_amt_usd desc;

select accounts.name, orders.total_amt_usd 
from orders
inner join accounts
on accounts.id = orders.account_id
where orders.total_amt_usd > 30000
order by orders.total_amt_usd desc;


select accounts.name, format((orders.total_amt_usd),0) Total_amt
from orders
inner join accounts
on accounts.id = orders.account_id
where orders.total_amt_usd > 30000
order by orders.total_amt_usd desc;

##Which accounts spent less than 1,000 usd total across all orders?
select accounts.name, format((orders.total_amt_usd),0) Total_amt
from orders
inner join accounts
on accounts.id = orders.account_id
where orders.total_amt_usd < 1000
order by orders.total_amt_usd desc;

##Which account has spent the most with us?
select accounts.name, format((orders.total_amt_usd),0) Total_amt
from orders
inner join accounts
on accounts.id = orders.account_id
order by orders.total_amt_usd desc
limit 1;


select accounts.name, format((orders.total_amt_usd),0) Total_amt
from orders
inner join accounts
on accounts.id = orders.account_id
order by orders.total_amt_usd asc
limit 19;

select Count(format((orders.total_amt_usd),0)) Total_amt
from orders
where orders.total_amt_usd <= 0;

## Which accounts used facebook as a channel to contact customers more than 6 times?

select accounts.name, web_events.channels, 
count(web_events.channels) Channels
  from
accounts
inner join web_events
on accounts.id = web_events.account_id
where web_events.channels = "facebook"
group by accounts.name;


select accounts.name, web_events.channels, 
count(web_events.channels) Channels
  from 
accounts
inner join web_events
on accounts.id = web_events.account_id
where web_events.channels = "facebook"
group by accounts.name
Having count(web_events.channels) > 6
order by count(web_events.channels) desc;


select avg(orders.standard_amt_usd), avg(orders.standard_qty)
from orders;


##Find the total amount of poster_qty paper ordered in the orders table.

select * from orders;

select sum(orders.poster_amt_usd) from orders;

select format(round(sum(orders.poster_amt_usd)),0) from orders;

select format(round(sum(orders.poster_amt_usd)),0) Poster_amt
 from orders;

##Find the total amount of standard_qty paper ordered in the orders table.

select format(round(sum(orders.standard_amt_usd)),0) Standard_amt
 from orders;

##Find the total dollar amount of sales using the total_amt_usd in the orders table.
select format(round(sum(orders.total_amt_usd)),0) Total_amt
 from orders;
 
 ##Find the total amount spent on standard_amt_usd and 
 ##gloss_amt_usd paper for each order in the orders table. 
 ##This should give a dollar amount for each order in the table.
 
 select sum(orders.standard_amt_usd + orders.gloss_amt_usd) as Total_Standard_Gloss
 from orders;


select orders.id, orders.standard_amt_usd, orders.gloss_amt_usd, 
(orders.standard_amt_usd + orders.gloss_amt_usd)  Total_Standard_Gloss
 from orders;

select orders.id, orders.standard_amt_usd, orders.gloss_amt_usd, 
(orders.standard_amt_usd + orders.gloss_amt_usd)  Total_Standard_Gloss
 from orders
 order by (orders.standard_amt_usd + orders.gloss_amt_usd) desc ;
 
 ##	Which channel was most frequently used by most accounts?
select accounts.id, accounts.name, web_events.channels, count(web_events.channels)
from accounts
inner join web_events
on accounts.id = web_events.account_id
group by accounts.name, web_events.channels, accounts.id
order by count(web_events.channels) desc;


select accounts.id, accounts.name, web_events.channels, count(web_events.channels)
from accounts
inner join web_events
on accounts.id = web_events.account_id
group by accounts.name, web_events.channels, accounts.id
order by count(web_events.channels) desc
limit 3;


select sales_reps.name from sales_reps;

select sales_reps.name , extract(6) from sales_reps;







## Provide a table that provides the region for each sales_rep along with their associated accounts.
 ##This time only for the Midwest region. 
 ##Your final table should include three columns: the region name, the sales rep name, 
 ## and the account name. Sort the accounts alphabetically (A-Z) according to account name.
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" 
order by accounts.name;
 
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" ;

select region.id, region.name, sales_reps.id, sales_reps.name, 
accounts.sales_rep_id
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id ;



select * from accounts;
select * from orders;
select * from region;
select * from sales_reps;
select * from web_events;

##Provide a table that provides the region for each sales_rep along with their associated accounts. 
##This time only for accounts where the sales rep has a first name starting with S and in the Midwest region.
 ##Your final table should include three columns: the region name, the sales rep name, and the account name.
## Sort the accounts alphabetically (A-Z) according to account name.

select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" and accounts.name like 'S%'
order by accounts.name;
 
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" and accounts.name like 'S%'
order by accounts.name;
 
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" and sales_reps.name like 'S%'
order by accounts.name;
 
 ##question 2
##Provide a table for all web_events associated with account name of Walmart. There should be three columns. 
##Be sure to include the primary_poc, time of the event, and the channel for each event.
 ##Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

select web_events.account_id, web_events.channels, accounts.name, 
accounts.primary_poc, 
web_events.occurred_at from 
web_events
inner join accounts
on web_events.account_id = accounts.id
where accounts.name = "Walmart";
 
 
 ##Provide a table that provides the region for each sales_rep along with their associated accounts. 
 ##This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
 ##Your final table should include three columns: the region name, the sales rep name, and the account name. 
 ##Sort the accounts alphabetically (A-Z) according to account name.
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" and accounts.name like "%K"
order by accounts.name;

 
 
 select accounts.name, sales_reps.name sales_reps_name,
 region.name Region_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
Where region.name = "Midwest" and accounts.name like "k%"
order by accounts.name;


##Provide the name for each region for every order, as well as the account name 
##and the unit price they paid (total_amt_usd/total) for the order. However, 
##you should only provide the results if the standard order quantity exceeds 100.
 ##Your final table should have 3 columns: region name, account name, and unit price. 
 ##In order to av oid a division by zero error, adding .01 to the denominator
 ##here is helpful total_amt_usd/(total+0.01)

select  accounts.name Account_name,
 region.name Region_name, orders.standard_qty,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id
where orders.standard_qty >100 and orders.poster_qty >50
order by orders.standard_qty ;

select  accounts.name Account_name,
 region.name Region_name, orders.standard_qty,
orders.poster_qty,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id
where orders.standard_qty >100 and orders.poster_qty >50 ;
 
select orders.id, accounts.name, region.name, 
sales_reps.region_id,
 orders.total, 
orders.total_amt_usd,
(orders.total_amt_usd/(orders.total+0.01)) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id;

select  accounts.name Account_name,
 region.name Region_name, orders.standard_qty,
  orders.poster_qty,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id
where orders.standard_qty >100 and orders.poster_qty >50 ;

##Provide the name for each region for every order, as well as the account name and 
##the unit price they paid (total_amt_usd/total) for the order. However, 
##you should only provide the results if the standard order quantity exceeds 100 and
##the poster order quantity exceeds 50. 
## Your final table should have 3 columns: region name, account name, and unit price. 
 ##Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to 
 ##the denominator here is helpful (total_amt_usd/(total+0.01).

 
select  accounts.name Account_name,
 region.name Region_name, 
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id
where orders.standard_qty >100 and orders.poster_qty >50 
 order by Unit_price desc;


 

select orders.id, accounts.name, region.name, 
sales_reps.region_id,
 orders.total, 
orders.total_amt_usd,
(orders.total_amt_usd/(orders.total+0.01)) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id;

 
select  accounts.name Account_name,
 region.name Region_name, 
 orders.total, 
orders.total_amt_usd,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id;

 select  accounts.name Account_name,
 region.name Region_name, 
 orders.total, 
orders.total_amt_usd,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id;

select  accounts.name Account_name,
 region.name Region_name, 
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price
from orders
inner join accounts 
on orders.account_id= accounts.id
inner join sales_reps
on accounts.sales_rep_id =  sales_reps.id
inner join region
on sales_reps.region_id =region.id;



##Provide a table that provides the region for each sales_rep along with their associated accounts. 
##Your final table should include three columns: the region name, the sales rep name, and the account name. 
##Sort the accounts alphabetically (A-Z) according to account name.

select region.id, region.name, sales_reps.id, sales_reps.name, 
accounts.sales_rep_id
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id ;
 

##Provide a table that provides the region for each sales_rep along with their associated accounts. 
##Your final table should include three columns: the region name, the sales rep name, 
## and the account name. 
##Sort the accounts alphabetically (A-Z) according to account name.

select  region.name Region_name,  
sales_reps.name sales_reps_name, 
 accounts.name Accounts_name
from region
inner  join sales_reps
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id 
order by accounts.name;

##What are the different channels used by account id 1001? 
##Your final table should have only 2 columns: account name and the different channels.
## You can try SELECT DISTINCT to narrow down the results to only the unique values.
 
 select distinct(accounts.id), accounts.name, web_events.channels
 from accounts
 inner join web_events
 on web_events.account_id = accounts.id
 where accounts.id = "1001";
 
select distinct accounts.name, web_events.channels
 from accounts
 inner join web_events
 on web_events.account_id = accounts.id
 where accounts.id = "1001";

select distinct accounts.name, web_events.channels,
count(web_events.channels) Count_of_Channels
 from accounts
 inner join web_events
 on web_events.account_id = accounts.id
 where accounts.id = "1001"
 group by web_events.channels, accounts.name
 
Find all the orders that occurred in 2015. 
Your final table should have 4 columns: occurred_at, 
account name, order total, and order total_amt_usd.


select * from accounts;
select * from orders;
select * from region;
select * from sales_reps;
select * from web_events;

 

##calculate total revenue by account name

select accounts.name Account_name,
round(sum(orders.total_amt_usd)) as Revenue
from orders
inner join  accounts
on orders.account_id = accounts.id
group by accounts.name
order by revenue desc
limit 5;


select accounts.name Account_name,
format(round(sum(orders.total_amt_usd)),2) as Revenue
from orders
inner join  accounts
on orders.account_id = accounts.id
group by accounts.name
order by  revenue desc, accounts.name ;

##Most ordered on average per month

select orders.account_id, avg(orders.total) Avg_per_month
from orders
group by orders.account_id
order by  Avg_per_month desc
limit 10;

select orders.account_id, round(avg(orders.total)) Avg_per_month
from orders
group by orders.account_id
order by  Avg_per_month desc
limit 10;

##All accounts and total orders using counts
select accounts.id Accounts_id, accounts.name Accounts_name, 
Count(orders.id) as Total_orders
from accounts
inner join orders
on accounts.id = orders.account_id
group by accounts.id, accounts.name
order by Total_orders desc;


##Highest revenue by region

select region.name region_name , format(sum(orders.total_amt_usd),0) as 
Total_revenue
 from orders
 inner  join accounts
 on accounts.id = orders.account_id
 inner join sales_reps
 on accounts.sales_rep_id = sales_reps.id
 inner join region
 on region.id = sales_reps.region_id
 group by region_name
 order by Total_revenue desc;
 
 
 Select orders.account_id, round(avg(orders.total_amt_usd))
 Avg_revenue
 from orders
 group by orders.account_id
 order by Avg_revenue desc;
 
 select orders.account_id, sum(orders.total_amt_usd) total_revenue , 
 count(orders.id) order_count
 from orders 
 group by orders.account_id
 having count(orders.id)  > 10
 order by order_count desc
 limit 10;
 
 select accounts.name accounts_name, orders.account_id, sum(orders.total_amt_usd) total_revenue , 
 count(orders.id) order_count
 from orders 
 inner join accounts
 on accounts.id = orders.account_id
 group by orders.account_id, accounts.name
 having count(orders.id)  > 10
 order by order_count desc
 limit 10;
 
 
 select accounts.name accounts_name, orders.account_id, sum(orders.total_amt_usd) total_revenue , 
 count(orders.id) order_count
 from orders 
 inner join accounts
 on accounts.id = orders.account_id
 where (orders.id) > 10
 group by orders.account_id, accounts.name
order by order_count desc
limit 10;



select accounts.name accounts_nam
?>/,.;, mn8nbe, region.name region_name , 
sales_reps.name sales_rep_name,  
sum(orders.total_amt_usd) as 
Total_revenue
 from orders
 inner  join accounts
 on accounts.id = orders.account_id
 inner join sales_reps
 on accounts.sales_rep_id = sales_reps.id
 inner join region
 on region.id = sales_reps.region_id
 Where region.name = "Northeast"
 group by region_name, accounts_name, sales_rep_name
 order by Total_revenue desc;

	## Provide a table that provides the region for each sales_rep along with their associated accounts.
  	 ##This time only for the Midwest region.
##Your final table should include three columns: the region name, the sales rep name, and the account name. 
##Sort the accounts alphabetically (A-Z) according to account name.

Select region.name Region_name , sales_reps.name Sales_rep, 
accounts.name Account_name
from sales_reps
inner join region
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
where region.name = "Midwest"
order by accounts.name;

select * from accounts;
select * from orders;
select * from region;
select * from sales_reps;
select * from web_events;


•	##Provide a table that provides the region for each sales_rep along with their associated accounts. 
##This time only for accounts where the sales rep has a first name starting with S and in the Midwest region.
Your final table should include three columns: the region name, the sales rep_ name, and the account name.
## Sort the accounts alphabetically (A-Z) according to account name.

Select region.name Region_name , sales_reps.name Sales_rep,
 accounts.name Account_name
from sales_reps
inner join region
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
where region.name = "Midwest" and Sales_reps.name like "S%"
order by accounts.name;


##question 3
##Provide a table for all web_events associated with account name of Walmart. There should be three columns. 
##Be sure to include the primary_poc, time of the event, and the channel for each event.
##Additionally, you might choose to add a fourth column to assure only Walmart 
events were chosen.

Select web_events.occurred_at, web_events.channels, 
accounts.primary_poc, accounts.name
From web_events
Inner join accounts
On web_events.account_id = accounts.id
Where accounts.name = "Walmart"


QUESTION 4
##Provide a table that provides the region for each sales_rep along with their associated accounts. 
 ##This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
 ##Your final table should include three columns: the region name, the sales rep name, and the account name. 
 ##Sort the accounts alphabetically (A-Z) according to account name.

Select region.name Region_name , sales_reps.name Sales_reps, 
accounts.name  Accounts_name
from sales_reps
inner join region
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
where region.name = "Midwest" and Sales_reps.name like "%K%"
order by accounts.name;


Select region.name Region_name , sales_reps.name Sales_reps, 
accounts.name  Accounts_name
from sales_reps
inner join region
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
where region.name = "Midwest" and Sales_reps.name like "%K"
order by accounts.name;


Select region.name Region_name , sales_reps.name Sales_reps, 
accounts.name  Accounts_name
from sales_reps
inner join region
on sales_reps.region_id = region.id
inner join accounts
on accounts.sales_rep_id = sales_reps.id
where region.name = "Midwest" and Sales_reps.name like "% K%"
order by accounts.name;


##QUESTION 5
##Provide the name for each region for every order, as well as the account name 
##and the unit price they paid (total_amt_usd/total) for the order. However, 
##you should only provide the results if the standard order quantity exceeds 100.
 ##Your final table should have 3 columns: region name, account name, and unit price. 
 ##In order to avoid a division by zero error, adding 0.01 to the denominator
 ##here is helpful total_amt_usd/(total+0.01)

select region.name Region_name, accounts.name Account_name,
 orders.total, orders.total_amt_usd, 
(orders.total_amt_usd/(orders.total+0.01)) Unit_price
from orders
inner join accounts
on orders.account_id = accounts.id
inner join sales_reps
on accounts.sales_rep_id = sales_reps.id
inner join region
on sales_reps.region_id = region.id;
where orders.standard_qty >100;

select region.name Region_name, accounts.name Account_name,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price,
format((orders.standard_qty),0) Standard_qty
from orders
inner join accounts
on orders.account_id = accounts.id
inner join sales_reps
on accounts.sales_rep_id = sales_reps.id
inner join region
on sales_reps.region_id = region.id
where orders.standard_qty >1000
order by orders.standard_qty desc
Limit 5;


select region.name Region_name, accounts.name Account_name, 
web_events.channels,
round((orders.total_amt_usd/(orders.total+0.01))) Unit_price,
format((orders.standard_qty),0) Standard_qty
from orders
inner join accounts
on orders.account_id = accounts.id
inner join web_events
on web_events.account_id = accounts.id
inner join sales_reps
on accounts.sales_rep_id = sales_reps.id
inner join region
on sales_reps.region_id = region.id
where orders.standard_qty >1000 and web_events.channels = "Direct"
order by orders.standard_qty desc
Limit 5;






select  accounts.name, orders.total, orders.total_amt_usd, 
(orders.total_amt_usd/(orders.total+0.01)) Unit_price
from orders
inner join accounts
on orders.account_id = accounts.id

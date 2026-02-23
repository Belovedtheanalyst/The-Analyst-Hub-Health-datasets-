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
on orders.account_id = accounts.id;


select * from orders;

select avg(orders.total_amt_usd) from orders;
select min(orders.total_amt_usd) from orders;
select format(max(orders.total_amt_usd),0) from orders;

select avg(orders.total) from orders;
select min(orders.total) from orders;
select format(max(orders.total),0) from orders;


select orders.id, accounts.name, avg(orders.total_amt_usd) Avg total
 from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id, accounts.name;


select orders.id ,accounts.name, Format(round(avg(orders.total_amt_usd)),0)
 from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by avg(orders.total_amt_usd) desc;



select orders.id ,accounts.name, Format(round(avg(orders.total)),0)
 from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by avg(orders.total) desc;





select orders.id ,accounts.name, Format(max(orders.total),0) Highest_qty_sold
  from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by max(orders.total) desc;

select min(orders.total_amt_usd) from orders;
select format(max(orders.total_amt_usd),0) from orders;


select orders.id ,accounts.name, Format(round(avg(orders.total)),0) Avg,
case avg(orders.total)
When 30000 then "Very High Qty"
when 20000 then "HigH Qty"
when 15000 then "Medium Qty"
when 10000 then "Low Qty"
when  500
else "Very Low Qty"
end as Qty_category
  from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by avg(orders.total) desc


select orders.id ,accounts.name, Format(round(max(orders.total)),0) Max,
case max(orders.total)
When max(orders.total) > 30000 then "Very High Qty"
when max(orders.total) > 20000 then "HigH Qty"
when max(orders.total) > 18000 then "Somewhat High"
when max(orders.total) >= 11000 then "Medium Qty" 
when max(orders.total) > 10000 then  "Somewhat Low Qty"
when max(orders.total) < 5000 then "Low Qty"
else "Very Low Qty"
end as Qty_category
  from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by max(orders.total) desc

select orders.id ,accounts.name, Format(max(orders.total),0) Highest_qty_sold
  from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.id ,accounts.name
order by max(orders.total) desc;

##Which channel generated more revenue?

select web_events.channels, accounts.name,
round(sum(orders.total_amt_usd)) total_revenue
from orders
inner join accounts
on accounts.id = orders.account_id
inner join web_events
on  accounts.id = web_events.account_id 
group by web_events.channels, accounts.name
order by total_revenue desc;


##	Which account had an order with the most items?

select orders.account_id, count(*) as order_count
from orders
group by orders.account_id
order by order_count desc;



select accounts.name, orders.account_id, count(*) as order_count 
from orders
inner join accounts
on accounts.id = orders.account_id
group by orders.account_id, accounts.name
having order_count >= 50
order by order_count desc;

select count(*) from orders;
select * from orders;

select orders.account_id, count(*) as order_count 
from orders
group by orders.account_id
having  order_count >= 50
order by order_count desc; 


select orders.account_id, count(*) as order_count
from orders
group by orders.account_id
order by order_count desc;



#	Which sales_rep had the most orders? 
#	 or least orders?
# How many orders did they have?

select accounts.name accounts_name, sales_reps.name sales_reps, 
orders.account_id,
count(*) orders_count
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by accounts.name, sales_reps.name, orders.account_id
order by orders_count desc;

select accounts.name accounts_name, sales_reps.name sales_reps, 
orders.account_id,
count(*) orders_count
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by accounts.name, sales_reps.name, orders.account_id
order by orders_count desc;

select accounts.name accounts_name, sales_reps.name sales_reps, 
orders.account_id,
count(*) orders_count
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by accounts.name, sales_reps.name, orders.account_id
order by orders_count desc
limit 1;

#	Which sales_rep had the most orders? 
#	 or least orders?
# How many orders did they have
select accounts.name accounts_name, sales_reps.name sales_reps, 
orders.account_id,
count(*) orders_count
from orders
inner join accounts
on accounts.id = orders.account_id
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by accounts.name, sales_reps.name, orders.account_id
order by orders_count desc
limit 1 offset 335;


select  format(sum(orders.poster_qty),0) 
Total_poster_qty_ordered
from orders;

select * from orders;

select orders.standard_amt_usd, orders.gloss_amt_usd, 
(orders.standard_amt_usd+ orders.gloss_amt_usd) Total_standardgloss
from orders;


## How many of the sales reps have more than 5 accounts that they manage?

select * from accounts;

select sales_reps.id, sales_reps.name, 
count(*) num_accounts
from  accounts
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by  sales_reps.id, sales_reps.name
having num_accounts >5
order by num_accounts desc;


select sales_reps.id, sales_reps.name, 
count(*) num_accounts
from  accounts
inner join sales_reps
on sales_reps.id = accounts.sales_rep_id
group by  sales_reps.id, sales_reps.name
having num_accounts >=5
order by num_accounts ;

##	How many accounts have more than 20 orders?

select accounts.name, orders.account_id, 
count(*) orders_count
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.name,orders.account_id
having orders_count > 20
order by orders_count desc;

## Which accounts spent more than 30,000 usd total across all orders?

select accounts.name, orders.account_id, 
count(*) orders_count, format(sum(orders.total),0)
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.name,orders.account_id
having sum(orders.total)> 30000
order by sum(orders.total) desc;

##	Which accounts spent less than 1,000 usd total across all orders?
select accounts.name, orders.account_id, 
count(*) orders_count, format(sum(orders.total),0)
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.name,orders.account_id
having sum(orders.total) < 1000
order by sum(orders.total) desc;

##	Which account has spent the most with us?
select accounts.name, orders.account_id, 
count(*) orders_count, format(sum(orders.total),0)
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.name,orders.account_id
order by sum(orders.total) desc
limit 1;

##	Which account has spent the least with us?
select accounts.name, orders.account_id, 
count(*) orders_count, format(sum(orders.total),0)
from orders
inner join accounts
on accounts.id = orders.account_id
group by accounts.name,orders.account_id
order by sum(orders.total) desc
limit 1 offset 335;


##	Which accounts used facebook as a channel to contact customers more than 6 times?

select accounts.name, web_events.channels, 
count(web_events.channels)  Channels_count
from web_events
inner join accounts
on accounts.id = web_events.account_id
where channels = "facebook"
group by accounts.name, web_events.channels
having  Channels_count > 6
order by  Channels_count desc ;

select accounts.name, web_events.channels, 
count(web_events.channels)  Channels_count
from web_events
inner join accounts
on accounts.id = web_events.account_id
group by accounts.name, web_events.channels
having  Channels_count > 6 and channels = "facebook"
order by  Channels_count desc ;



SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;





SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;



##	Which account used facebook most as a channel?
select accounts.name, web_events.channels, 
count(web_events.channels)  Channels_count
from web_events
inner join accounts
on accounts.id = web_events.account_id
where web_events.channels = "facebook"
group by accounts.name, web_events.channels
order by  Channels_count desc 
limit 1;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;





##10.	Which channel was most frequently used by most accounts?

select accounts.name, web_events.channels,
 count(web_events.channels) Freq_used
from web_events
inner join accounts
on accounts.id = web_events.account_id
group by  accounts.name, web_events.channels
order by Freq_used desc;

select accounts.id, accounts.name, web_events.channels,
 count(*) Freq_used
from accounts
inner join web_events
on accounts.id = web_events.account_id
group by accounts.id, accounts.name, web_events.channels
order by Freq_used desc
limit 10;

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;
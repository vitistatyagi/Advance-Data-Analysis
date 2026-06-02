SELECT * FROM retail_black_friday_sales;

select gender, count(*)
from retail_black_friday_sales
group by 1;

select product_category, count(*)
from retail_black_friday_sales
group by 1;

select product_category, count(*), round(sum(purchase_amount),1) as cat_rev
from retail_black_friday_sales
group by 1
order by 3 desc, 2 desc;

select customer_segment, count(*)
from retail_black_friday_sales
group by 1;

select customer_segment, round(sum(final_price),1) as amt
from retail_black_friday_sales
group by 1
order by 2 desc;

select age_group, count(*), sum(final_price)
from retail_black_friday_sales
group by 1
order by 3 desc, 2 desc;

select city, count(*)
from retail_black_friday_sales
where age_group='36-45'
group by 1
order by 2 desc;

with time_zone as (
	select count(*) as num_people, 
    case
		when (purchase_hour between 22 and 24) or (purchase_hour between 0 and 4) then 'Late Night'
        when purchase_hour between 5 and 12 then 'Morning'
        when purchase_hour between 13 and 17 then 'Afternoon'
        when purchase_hour between 18 and 21 then 'Night'
	end as time_zones,
    sum(original_price) org_prc,
    round(sum(final_price),0) fin_prc
    from retail_black_friday_sales
    group by 2
)
select time_zones, ceil(org_prc-fin_prc) savings
from time_zon
order by 2 desc;

with top_cust as (select customer_id, rank() over(partition by age_group order by final_price desc) rk, 
	age_group 
from retail_black_friday_sales)
select customer_id, age_group
from top_cust
where rk=1;

#Spenders more than average
with demo as (select city, round(avg(final_price),2) avg_spend, max(final_price) max_spend
	from retail_black_friday_sales
    group by 1)
select r.city, count(r.customer_id) spender_more_than_avg
from retail_black_friday_sales r
join demo d
on r.city= d.city
where r.final_price>avg_spend
group by 1;

#top 3 within category
with top_cust as (select customer_id, product_category,
 dense_rank() over(partition by product_category order by final_price desc) as rk, final_price
from retail_black_friday_sales)
select * from top_cust
where rk<=3;

#products category within spending quartiles
with cat_rev as (select product_category, ceil(sum(final_price)) rev
from retail_black_friday_sales
group by 1
order by 2 desc),
cumulative as (select *, sum(rev) over(order by rev desc) cum_rev, sum(rev) over() total
from cat_rev)
select *, ceil((cum_rev/total)*100) from cumulative;

#Age groups within spending quartiles
with cat_rev as (select age_group, ceil(sum(final_price)) rev
from retail_black_friday_sales
group by 1
order by 2 desc),
cumulative as (select *, sum(rev) over(order by rev desc) cum_rev, sum(rev) over() total
from cat_rev)
select *, ceil((cum_rev/total)*100) spend_percent from cumulative;

#hidden-high value customers
select customer_id, sum(final_price), count(transaction_id), count(product_id), 
	rank() over(order by sum(final_price) desc, count(transaction_id) desc, count(product_id) desc) rk
from retail_black_friday_sales
group by 1
order by 2 desc
limit 10;

with tiles as (select customer_id, ceil(sum(final_price)) fin_p, 
		ntile(4) over(order by sum(final_price) desc) quartile, customer_segment
	from retail_black_friday_sales
	group by 1,4),
segments_ct as (select quartile, customer_segment, count(*) num, sum(count(*)) over(partition by quartile) tot_cust
from tiles 
group by 1,2),
segments_mn as (select quartile, customer_segment, sum(fin_p) price
from tiles 
group by 1,2), 
segments_mn2 as(select *, sum(price) over(partition by quartile) tot_spend from segments_mn)
select a.quartile, a.customer_segment, 
	ceil((num/tot_cust)*100) num_dist_percent, 
    ceil((price/tot_spend)*100) spend_dist_percent
from segments_ct a
join segments_mn2 b
on a.quartile= b.quartile and a.customer_segment=b.customer_segment
order by 1, 4 desc;


with dist_brac as (select *, case 
	when ceil(((original_price-final_price)/original_price)*100) >=80 then 'Discounts from 80% off'
    when ceil(((original_price-final_price)/original_price)*100) >=50 then 'Get it at 50% off'
    when ceil(((original_price-final_price)/original_price)*100) >=30 then 'Starting from 30% off'
    when ceil(((original_price-final_price)/original_price)*100) >=0 then 'Discounts 0-20%'
end as discount_bracket
from retail_black_friday_sales)
select discount_bracket, count(*) num_articles, ceil(sum(final_price)) revenue
from dist_brac 
group by 1 order by 3 desc;

select payment_method, count(*), ceil(sum(final_price))
from retail_black_friday_sales
group by 1
order by 3 desc, 2 desc;

with pay_meths as (select customer_segment, payment_method, count(payment_method), 
	rank() over(partition by customer_segment order by count(payment_method) desc) rk,
    ceil(sum(final_price))
from retail_black_friday_sales
group by 1,2)
select * from pay_meths where rk=1

with pay_meths as (select customer_segment, payment_method, count(payment_method), 
	rank() over(partition by customer_segment order by count(payment_method) desc) rk,
    ceil(sum(final_price))
from retail_black_friday_sales
group by 1,2)
select * from pay_meths where rk=1;

select 'weekend', ceil(sum(final_price)) revenue from retail_black_friday_sales where is_weekend=1
UNION
select 'black friday', ceil(sum(final_price)) revenue from retail_black_friday_sales where is_black_friday=1;

with category_revenue as (
	select product_category, sum(final_price) cat_rev
	from retail_black_friday_sales
	where is_weekend=1
	group by 1)
select product_category, ceil((cat_rev/sum(cat_rev) over())*100) percent_rev
from category_revenue
group by 1
order by 2 desc;

with category_revenue as (
	select product_category, sum(final_price) cat_rev
	from retail_black_friday_sales
	where is_black_friday=1
	group by 1)
select product_category, ceil((cat_rev/sum(cat_rev) over())*100) percent_rev
from category_revenue
group by 1
order by 2 desc;

select 'weekend', ceil(sum(discount_pct)) revenue from retail_black_friday_sales where is_weekend=1
UNION
select 'black friday', ceil(sum(discount_pct)) revenue from retail_black_friday_sales where is_black_friday=1;

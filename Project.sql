create database Project ;
use  project ;

select * from olist_order_items_dataset ;

select Payment_type , sum(pay_val) as total_pay from olist_order_items_dataset group by Payment_type order by total_pay ;

select   round(sum(Pay_Val),2)as tot_pay,
case 
when weekday(order_purchase_timestamp) in (5,6) then "weekend"
else "weekday" 
end as Days from olist_order_items_dataset group by Days ;


select Products , round(sum(Price)-sum(Pay_Val),2) as Profit from olist_order_items_dataset group by Products ;


select review_score , count(order_id) as tot_count from olist_order_items_dataset 
group by review_score order by review_score ;


select review_score , count(order_id) as 5_sco_tot from olist_order_items_dataset 
where review_score = 5  group by review_score ;


select review_score , payment_type , count(order_id) as sco_tot from olist_order_items_dataset 
where review_score = 5 and Payment_type= "credit_card" group by review_score, Payment_type ;

 
 select O .Products, round(avg(ord.order_delivered_customer_date-ord.order_purchase_timestamp), 3) as avg_deliver_days
  from olist_order_items_dataset  as O join olist_orders_dataset as Ord on ord.order_id=o.order_id where Products = "Pet_shop";


SELECT city , round(avg(Price),2) AS avg_price,
round(AVG(Pay_Val),2) AS avg_payment_value
FROM  olist_order_items_dataset 
WHERE city = 'sao paulo';


select O.review_score , round(avg(ord.order_delivered_customer_date-ord.order_purchase_timestamp),3) as Ship_days 
from olist_order_items_dataset as o join olist_orders_dataset as ord
on ord.order_id=o.order_id group by o.review_score order by review_score ;



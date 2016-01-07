--Advanced Premiere Queries
use Premiere
go 

--i. For each customer that placed an order, list the customer name, order id and date the order was placed
select cust_Name, order_num, order_date
from Customer inner join Orders
on Customer.cust_Num= orders.cust_num

--ii. For each part that was ordered, list the part description, order id and date the order was placed
--(below is another query where it is sorted)
select part_Description, ORDER_LINE.ORDER_NUM, order_date
from Part inner join order_line
on Part.PART_NUM= ORDER_LINE.PART_NUM
inner join ORDERS 
on ORDER_LINE.ORDER_NUM= Orders.ORDER_NUM

--to sort the list and have all of a part near eachother...do the following(takes more time)
select part_Description, ORDER_LINE.ORDER_NUM, order_date
from Part inner join order_line
on Part.PART_NUM= ORDER_LINE.PART_NUM
inner join ORDERS 
on ORDER_LINE.ORDER_NUM= Orders.ORDER_NUM
order by PART_DESCRIPTION

--iii. For each part that was ordered, list the name(s) of the customers that ordered that part
--(below is another query where it is sorted by part description)
select part_description, cust_name
from Part inner join Order_Line
on Part.PART_NUM= ORDER_LINE.PART_NUM
inner join ORDERS 
on ORDER_LINE.ORDER_NUM= ORDERS.ORDER_NUM
inner join CUSTOMER
on ORDERS.CUST_NUM= CUSTOMER.CUST_NUM

--although order by takes more time, I added that here so that all of one item can be listed near eachother
select part_description, cust_name
from Part inner join Order_Line
on Part.PART_NUM= ORDER_LINE.PART_NUM
inner join ORDERS 
on ORDER_LINE.ORDER_NUM= ORDERS.ORDER_NUM
inner join CUSTOMER
on ORDERS.CUST_NUM= CUSTOMER.CUST_NUM
order by PART_DESCRIPTION

--iv. Which parts were never ordered
--more efficient
select part_description
from PART
left join ORDER_LINE
on part.PART_NUM= order_line.PART_NUM
where ORDER_LINE.PART_NUM is null

--less effiecient
select part_description 
from PART
where PART_NUM not in
(select distinct part_num
from ORDER_LINE)

--v. For each sales representative, list his name and the orders he placed
select rep_fname, REP_LNAME, order_num
from SALESREP inner join CUSTOMER
on Salesrep.REP_NUM= CUSTOMER.REP_NUM
inner join orders 
on Customer.cust_num = ORDERS.CUST_NUM

--vi. Which part is the most expensive part that we stock, list the part id and description
select PART_NUM, part_Description
from Part 
where price=
(select max(price)
from part)


--vii. Which customer balance is more than the average customer balance
select CUST_NAME, CUST_BALANCE
from CUSTOMER
where cust_Balance>
(select AVG(CUST_BALANCE)
from CUSTOMER)

--viii.	Which customer (list the name) ordered both a gas range and a washer
select cust_name
from customer
inner join ORDERS
on CUSTOMER.CUST_NUM= ORDERS.CUST_NUM
inner join order_line
on orders.ORDER_NUM= ORDER_LINE.ORDER_NUM
inner join PART
on ORDER_LINE.PART_NUM= PART.PART_NUM
where PART_DESCRIPTION= 'Gas Range'
intersect
select cust_name
from customer
inner join ORDERS
on CUSTOMER.CUST_NUM= ORDERS.CUST_NUM
inner join order_line
on orders.ORDER_NUM= ORDER_LINE.ORDER_NUM
inner join PART
on ORDER_LINE.PART_NUM= PART.PART_NUM
where PART_DESCRIPTION= 'Washer'

--ix. For each order, list the name of the customer that ordered the order and total amount due for that order
select Order_Line.order_num, Orders.CUST_NUM, sum(QUOTED_PRICE * QTY_ORDERED) AS TotalDue
from CUSTOMER inner join ORDERS
on orders.CUST_NUM = customer.CUST_NUM
inner join ORDER_LINE
on ORDERs.ORDER_NUM= ORDER_LINE.ORDER_NUM
group by order_Line.ORDER_NUM, Orders.CUST_NUM


--x. For each representative, list his name and the names of the customers he handles
--I sorted the output for nicer format--so you can see all the customers of a representative together
select rep_fname, rep_lname, cust_name
from salesrep inner join CUSTOMER
on Salesrep.REP_NUM= CUSTOMER.REP_NUM
order by REP_FNAME, REP_LNAME

--xi. List the representative that handles the most customers
select rep_fname, rep_lname
from SALESREP 
inner join CUSTOMER
on SALESREP.REP_NUM= CUSTOMER.REP_NUM
group by REP_LNAME, REP_FNAME
having count(CUST_NUM) =
(select max(NumCustomers)
from
(select count(cust_name) AS NumCustomers
from CUSTOMER
group by REP_NUM) AS MaxCustomers)

--xii. Which cities have more than 2 customers
select cust_city, count(*) AS NumCustomers
from CUSTOMER
group by CUST_CITY
having COUNT(CUST_NUM) >2

--xiii.	List the customer that has the largest credit limit
select cust_name
from customer
where credit_limit=
(select max(credit_limit)
from CUSTOMER)

--xiv. For each representative, list his name and how many customers he is currently servicing
--I used left join so that it would include 0 for any representative that isn't serving any customers
select rep_fname, rep_lname, count(cust_num) AS NumCustomers
from SALESREP
left join CUSTOMER
on SALESREP.REP_NUM= CUSTOMER.REP_NUM
group by rep_fname, REP_LNAME

--xv. Which warehouse stores most of the products?
select warehouse
from PART 
group by WAREHOUSE
having count(part_num)=
(select max(NumParts)
from
(select warehouse, count(part_num) AS NumParts
from part
group by WAREHOUSE) AS MAXParts)
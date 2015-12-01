use premiere
go
select *
from SALESREP

--list names of sales reps
select rep_lname, rep_fname
from salesrep

--list names as one field
select rep_fname + ' ' + rep_lname
from salesrep

--trim the trailing blanks
select rtrim(rep_fname) + ' ' + rep_lname
from salesrep

--supply column name
select rtrim (rep_fname) + ' ' + rep_lname
As [Salesrep Name]
from salesrep

--switched the order of the columns
select rtrim(rep_lname) + ', ' + rep_fname
As [Salesrep Name]
from salesrep

--list the names and prices of all products
select part_description, price
from part

--2. list the names and prices of all products with new column headings
--the column names must be added right after each variable name.
select part_description as [Product Name], price as Price
from part

--3. which states do our customers come from- each state should only be listed once. the word "distinct" makes it only appear once
select distinct cust_state
from customer

--3a modify the way the data appears using case statements
select distinct cust_state =
case cust_state
	when 'FL' then 'FLORIDA'
	when 'NY' then 'NEW YORK'
end
from customer

--what types of products do we have, names of each product  by type
--sort by type, product name
select category, PART_DESCRIPTION
from part
order by category, PART_DESCRIPTION

--using a case statement to define the abreviations. 
--Here the column name is changed in the beginning and the case statement 
--defines the values that will be spit out
select [Product Type] =
case category
	when 'AP' then 'Appliances'
	when 'HW' then 'Housewares'
	when 'SG' then 'Sporting Goods'
	end
	, part_description As [Part Name]
	from part

--select a list of unique product types
	select distinct category
	from part

--with full word
select distinct [Product Type] =
case category
	when 'AP' then 'Appliances'
	when 'HW' then 'Housewares'
	when 'SG' then 'Sporting Goods'
end
from part

--6. for each product ordered, what is the total amount that must be paid
 --sum gives us all the times a part was ordered together even if it was 
 --in a few orders. Then we must group it.
 select part_num, sum(quoted_price * qty_ordered) As [Total Cost]
 from order_line
 group by part_num

 --adding the whole table together
 select sum(quoted_price * qty_ordered) As [Total Sales]
 from order_line

 select *
 from ORDER_LINE
 --group by is not a detail. it's a total for that specific group

 --group by order num and find the totals of each order
 select order_num, sum(quoted_price * QTY_ORDERED) As [Total Sales]
 from ORDER_LINE
 group by ORDER_NUM
 
 --find the number or orders a customer made
 select CUST_NUM, count(ORDER_NUM) As [Total Orders]
 from Orders
 group by CUST_NUM

 --7. if it takes 5 days to process an order, when will the order be shipped
 --this is date manipulation- it automatically adds 5 as days
 select ORDER_NUM, order_date, ORDER_DATE+5 as [Shipping Date]
 from ORDERS

 --if you want to use data manipulation that isnot the days, use functions
 select order_num, order_date, DATEADD(month, 1, order_date)
 As[Return Date]
 from ORDERS

 --how much time has elapsed since the orders were placed?
 --find today's date and compare it with the order date
 select order_num, order_date, DATEDIFF(day,order_date,GETDATE())
 As [Total Elapsed Days]
 from ORDERS
 --this can be useful as a constraint to make sure one is old enough etc

 --8. what would be the price of each product after 5% discount. we write the price
 --and the discounted price so you can see the difference after the discount
 select PART_DESCRIPTION, price, price *.95 As [Discount Price]
 from part

 --9. which customers live in the city, Grove
 --here we only want to retrieve certain rows and certain columns
 select CUST_NAME 
 from customer
 where CUST_CITY = 'Grove'
 --where cust_city like 'Grove'

 --10. show all orders placed after 10/23/07
 select ORDER_NUM, ORDER_DATE
 from orders
 where order_Date > '10/23/07'
 
--11. show me a list of products with retail price
--of four hundred or less
select PART_DESCRIPTION, price
from part
where price <= 400

--12. which orders were placed in October, 2007
select ORDER_NUM, ORDER_DATE
from orders
where ORDER_DATE between '10/1/2007' and '10/31/2007'

select order_num, order_date
from ORDERS
where order_date >= '10/1/2007' and
	  order_date <= '10/31/2007'

--display all orders placed in October
select ORDER_NUM, order_date
from ORDERS
where month(ORDER_DATE) =10
	and year(ORDER_DATE) = 2007

--list all customers whose names begins with an A
select cust_name
from customer
where cust_name like 'A%'
--an underscore will say that in that position you don't care what's there
--where cust_name like '_A%'
--where cust_name like '%A'   --just must end in an A

--14. give a list of products that are either housewares or appliances
select PART_DESCRIPTION, CATEGORY
from part
where CATEGORY = 'HW' or category = 'AP'

select part_description, category
from PART
where (CATEGORY in ('HW', 'AP'))

--16. which sales rep have a first name entered?
select REP_FNAME, REP_LNAME
from salesrep
where REP_FNAME is not null

--15. show me a list of customer names that have department in their name
select cust_name
from customer
where CUST_NAME like '%Department%'

--for each salesrep, how manu customers does the salesrep service. only 
--include customers who don't owe more than $5000. sort the data by salesrep and 
--only include salesrep that service more than 3 customers

select REP_NUM, count(cust_name) AS [Number of Customers]
from customer
where CUST_BALANCE <= 5000
group by REP_NUM
having count(cust_name) > 1
order by [Number of Customers]


use TinyVideo
go

--i. list the names of the members that owe money
select mem_fname, mem_lname, mem_balance
from rentals.MEMBERSHIP

--ii. which member owes the most money?(identify by name)
select mem_fname, mem_lname
from rentals.membership
where mem_balance=
(select max(mem_balance)
from rentals.MEMBERSHIP)

--iii. list the ids of all members that have rented a video

select distinct mem_num
from rentals.RENTAL

--iv.which members have not rented any videos- list names
select  mem_fname, mem_lname
from rentals.MEMBERSHIP
where MEM_NUM not in
(select distinct mem_num
from rentals.RENTAL)

--v. how many times has each video been rented?
select vid_num, count(vid_num) AS [Times Rented]
from rentals.RENTALDETAILS
group by vid_num

--vi. for each movie, how many videos does the store have?
select vid_movie_Num, count(vid_num) AS [Number of Videos]
from Inventory.VIDEO
group by vid_movie_Num

--vii.For each type of movie genre, what is the average movie cost?
select Movie_Genre, avg(movie_cost) AS [Average_Cost]
from Inventory.MOvie
group by MOVIE_GENRE


--viii. Which type of movie genre has the highest average movie cost?
select movie_genre
from Inventory.MOVIE
group by movie_genre
having avg(movie_cost)=
(select max([Average Cost])
from
(select Movie_Genre, avg(movie_cost) AS [Average Cost]
from Inventory.MOvie
group by MOVIE_GENRE )AS [Max Cost])

--ix. Which is the oldest movie?
select movie_title, movie_year
from Inventory.MOVIE
where movie_year =
(select min(movie_year)
from Inventory.MOVIE)

--x. For each type of employee, how many employees have been hired?
select Emp_Type, count(EmpID) [Employees Hired]
from HumanResources.EMPLOYEE
group by Emp_type

--xi. Which type of employee does the company not have in the database?
select EmpType_Description
from HumanResources.EMPTYPES
where EmptypeID not in 
(select Emp_Type
from HumanResources.EMPLOYEE
group by Emp_type)

--xii. Which employee is earning the most money?
select Emp_fname + ' ' + Emp_LName AS Name, Emp_Salary
from HumanResources.EMPLOYEE
where emp_salary =
(select max(emp_salary)
from HumanResources.EMPLOYEE)

--xiii. Which employee is working for the company the most time?
select Emp_fname + ' ' + Emp_lname
from HumanResources.Employee
where emp_hiredate =
(select min(Emp_hiredate)
from HumanResources.EMPLOYEE)

--xiv. List the current age of each employee
select Emp_fname, Emp_lname, DATEdiff(Year, Emp_hireDate, getDate()) AS Age
from HumanResources.EMPLOYEE

--xv. Who is the oldest employee?
select Emp_FName, Emp_LName
from HumanResources.EMPLOYEE
where Datediff(Year, Emp_hiredate, getDate()) =
(select max(DATEdiff(Year, Emp_hireDate, getDate())) AS Age
from HumanResources.EMPLOYEE)
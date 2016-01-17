use constructionCo
go

--complex queries
--for each employee, list which projects he is working on

select EmpFirstName, EmpLastName, projname
from Employee inner join ProjectEmployees
on Employee.EmployeeID= ProjectEmployees.EmployeeID
inner join Project
on ProjectEmployees.ProjectID= Project.ProjectID
order by EmpLastName, EmpFirstName

--with number of porjects

--max, min will always need subqueries
--you can name 'tables' that you create and then use those tables for inner joins

-- left join is used when you want that in a certain table to include all values, even ones 
--that don't have a value in the next table. but you must do a left join and will display all 
--values from the table on the left only. but then if you want to continue with another inner join, you
--must make then next one a left join as well
--now it prints out 0 for some qty's


--all employees who haven't worked on any project calculate the difference

--much better than subqueries!!!


--Corrolated Query, has an inner and an outer loop
--gets a record from outer loop and checks if it's in the inner loop and then keeps
--going back and forth. this is the most inefficient way to write queries.
--INEFFICIENT


--which project was assained the most employees?
--include projects that were not assaigned any employees 


--include projects that were assaigned any employees and how many hours were billed for



--list all projects that inclued all the same people as the rolling Tide project


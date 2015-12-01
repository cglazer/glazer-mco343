use TouroRentalAgency
go

select*
from staff
--what is the average salary that is paid by this company?



select staffno, salary 
from staff 
where salary <
--subquerie--executes before the outer querie.
(select avg(salary)
from staff)

--who is the oldest employee working for the company
select staffno, dob
from staff
where dob =
(select min(dob)
from staff)

--which employee is working for the company the longest
select staffNo, hireDate
from staff
where hireDate=
(select min(hireDate)
from staff)

--which property is the smallest
select propertyNo, rooms
from property
where rooms =
(select min(rooms)
from property)

--list the branch with the most staff members
select branchNo, count(staffNo) AS NUmEmployees
from staff
group by branchNo
having count(staffNo) =
(select max(QtyEmps)
from 
(select count(BranchNo) AS QtyEmps
from staff
group by BranchNo) AS BranchCounts)--row querie
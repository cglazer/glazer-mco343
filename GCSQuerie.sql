use gcs
go

--i. list the names of each of our employees
select FirstName + ' ' + LastName AS [Employees]
from employee
order by LastName, FirstName

--ii. list the description and pay rate of each of the skills our company offers
select Description AS [Skill Description], payRate
from skill

--iii. list the names of each employee who works for the SW region
select FirstName + ' ' + LastName AS [Employees working for the SW region]
from Employee
where RegionID = 'SW'
order by LastName, FirstName

--iv. list the names of each employee that was hired in 2006
select LastName, FirstName, HireDate
from employee
where Year(HireDate) = 2006
order by LastName, FirstName, HireDate

--v. list the regions in which employees are working (list each region id once)
select distinct regionID =
case regionID
when 'MN' then 'Middle North'
when 'MS' then 'Middle South'
when 'NE' then 'North East'
when 'NW' then 'North West'
when 'SE' then 'South East'
when 'SW' then 'South West'
end   
from employee

--vi. how many employees have programming skills in VB--we did not yet learn how to 
--retrieve informatio from 2 tables so I hardcoded the ID's
select count(empID) AS [Employers with VB Skills]
from EmployeeSkills
where skillID= 11 or skillID= 12

--the next few lines returns the skillID's that are VB to help the question above
select SkillID
from Skill
where description like 'VB%'

--vii. which skills have a pay scale of $100 or more
select description, payRate
from skill
where payRate >= 100

--viii. which employees are working for the company more than 4 years?
select firstName, lastname, hiredate
from employee
where (DateDiff(Year,hiredate,GetDate())) >= 4
order by hireDate, LastName, FirstName

--ix. list employee lastname, firstname sorted by lastname in ascending order
select LastName, FirstName
from employee
order by LastName


--x. how many employees are working in each of the regions 
select REGIONID=
case regionID
when 'MN' then 'Middle North'
when 'MS' then 'Middle South'
when 'NE' then 'North East'
when 'NW' then 'North West'
when 'SE' then 'South East'
when 'SW' then 'South West'
end   
, count(firstname) AS [Num Employees]
from employee
group by RegionID
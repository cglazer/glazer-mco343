--Advanced GCS Queries

use GCS
go

--I.	For each employee, list the full name and the name of each skill that he currently has
select FirstName, LastName, Description AS Skills
from Employee
inner join EmployeeSkills 
on Employee.EmpID = EmployeeSkills.EmpID
inner join Skill
on EmployeeSkills.SkillID= Skill.SkillID

--II.	List the name of each employee for which we have no skills currently listed

--using left join-much more efficient!
select FirstName, lastname
from employee 
left join EmployeeSkills
on Employee.EmpID= EmployeeSkills.empID
where EmployeeSkills.SkillID is null

--using subquery-less efficient
select FirstName, LastName
from Employee
where empID not in
(select distinct EmpID
from EmployeeSkills)

--III.	List the name of each employee, number of skills he has if he has at least 3 different skills
select firstname, lastName , count(skillID) AS NumSkills
from Employee 
inner join EmployeeSkills
on Employee.empID= EmployeeSkills.EmpID
group by firstName, LASTName
having count(*) >=3

--IV.	For each skill: list the name of the skill, and the number of employees that currently have that skill.
select Skill.Description, count(empID) AS NumEmployees
from EmployeeSkills inner join Skill
on EmployeeSkills.SkillID= Skill.SkillID
group by Skill.description

--V.List the name of each employee that has both skills Data Entry 1 and Data Entry 2
--best!
select firstname , lastName 
from Employee inner join EmployeeSkills
on Employee.EmpID= EmployeeSkills.EmpID
inner join Skill
on EmployeeSkills.SkillID= Skill.SkillID
where Description= 'Data Entry I' 
intersect
select firstname, lastName
from Employee inner join EmployeeSkills
on Employee.EmpID= EmployeeSkills.EmpID
inner join Skill
on EmployeeSkills.SkillID= Skill.SkillID
where Description= 'Data Entry II'

--innefficient-subqueries!

select firstName, lastName
from Employee
where EmpID in
(select EmpID 
from EmployeeSkills
where SkillID = 
(select skillid
from skill
where Description= 'Data Entry I'))
 and EmpID in
 (select empID
 from EmployeeSkills
 where SkillID=
 (select skillid
from skill
where Description= 'Data Entry II'))

--VI.	List the name of the skill that most employees have.
--using inner join
select description 
from skill
inner join employeeSkills
on Skill.SkillID= EmployeeSkills.skillID
group by skill.Description
having count(EmployeeSkills.SkillID)=
(select max(countEmp)
from
(select skillID, count(empID) AS countEmp
from EmployeeSkills
group by SkillID) AS MaxSkill)

--inneficien- subquery
select description
from skill
where skillID=
(select skillID
from EmployeeSkills
group by SkillID
having count(empID)=
(select max(countEmp)
from
(select skillID, count(empID) AS countEmp
from EmployeeSkills
group by SkillID) AS MaxSkill))

--VII.	List the region name in which most employees live.
--inner join
select description
from region
inner join Employee
on REGION.regionID= Employee.RegionID
group by REGION.Description
having count(Employee.regionID)=
(select max(NumEmps)
from
(select regionID, count(empID) AS NumEmps
from employee
group by RegionID) AS MaxEmps)



--inneficient-subquery!
select Description
from REGION
where REGIONID=
(select regionID
from Employee
group by RegionID
having count(empID)=(
select max(NumEmps)
from
(select regionID, count(empID) AS NumEmps
from employee
group by RegionID) AS MaxEmps))

--VIII.	List the region name that has no employees living in that region
--left join
select description
from region
left join Employee
on REGION.REGIONID = Employee.RegionID
where Employee.RegionID is null

--inneficient
select description
from REGION
where REGIONID not in
(select distinct regionID
from Employee)

--IX.	List the name of the skills if at least two employees have that skill

--inner join
select description
from skill
inner join EmployeeSkills
on Skill.SkillID= EmployeeSkills.SkillID
group by Skill.Description
having count(EmployeeSkills.skillID) >=2

--inneficient-subquery
select description
from skill
where SkillID in
(select skillID
from EmployeeSkills
group by SkillID
having count(empID) >=2)

--X.	List employees who have the same skills as Amy Seaton

select firstname, lastname
from Employee E1
where not exists
(select ES1.SkillID
from EmployeeSkills ES1
inner join Employee E2
on ES1.EmpID=E2.EmpID
where firstName= 'Amy' and lastname='Seaton' 
	and not exists
		(select ES2.SkillID
		from EmployeeSkills ES2
		where ES1.SkillID= ES2.SkillID
	and ES2.EmpID= E1.EmpID))

--the following does not include Amy Seaton's name in the results

select firstname, lastname
from Employee E1
where not exists
(select ES1.SkillID
from EmployeeSkills ES1
inner join Employee E2
on ES1.EmpID=E2.EmpID
where firstName= 'Amy' and lastname='Seaton' 
	and not exists
		(select ES2.SkillID
		from EmployeeSkills ES2
		where ES1.SkillID= ES2.SkillID
	and ES2.EmpID= E1.EmpID))
and E1.FirstName + ' ' + E1.lastname != 'Amy Seaton'





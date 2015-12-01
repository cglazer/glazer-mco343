--to creat a new database
create database STUDENTADVISORS
go

--to activate the database
use STUDENTADVISORS
go

--activate the database so the tables are created in the correct place so i either must 
--execute the above statement or i need to change the database to the correct one

--create building table
create table BUILDING
(BuildingID int not null,
BuildingName varchar(45) not null,
--we name the constraints
constraint[PK_Building]  primary key (BuildingID),
--we write unique to represent the word 'unique index'
constraint [UIX_Building] unique (BuildingName)
);
--(the semi colon above is not necessary)
create table OFFICE(
OfficeID char(4) not null,
BuildingID int not null,
constraint [PK_Office] primary key (OfficeID),
constraint [FK_Office_Building] foreign key (BuildingID) references Building(BuildingID)

);

create table PROFESSOR(
ProfessorID int not null,
ProfFirstName varchar(30) not null,
ProfLastName varchar(30) not null,
ProfOffice char(4) not null,
ProfPhoneExt char(4) not null,
DeptID int not null,
constraint[PK_Professor]  primary key (ProfessorID),
constraint [FK_Professor_Office] foreign key (ProfOffice) references OFFICE(OfficeID),
constraint [FK_Professor_Department] foreign key (DeptID) references DEPARTMENT(DepartmentID)
);
create table MAJOR(
MajorID int not null,
MajorDescription varchar(45) not null,
DeptID int not null,
constraint[PK_Major]  primary key (MajorID),
constraint [FK_Major_Dept_id] foreign key (DeptID) references DEPARTMENT(DepartmentID)
);
create table DEPARTMENT(
DepartmentID int not null,
DeptName varchar(45) not null,
DeptPhone char(10) not null,
DeptChair int not null,
constraint[PK_Department]  primary key (DepartmentID),
constraint [FK_Department_Professor1] foreign key (DeptChair) references PROFESSOR(ProfessorID)
);
create table STUDENT(
StudentID int not null,
StuFirstName varchar(20) not null,
StuLastName varchar(30) not null,
Stud_Major int not null,
Stud_GPA decimal(3,2) not null,
Stud_Hours int not null,
StuClass int not null,
AdvisorID int not null,
constraint[PK_Student]  primary key (StudentID),
constraint [FK_Student_Major] foreign key (Stud_Major) references MAJOR(MajorID),
constraint [FK_Student_Professor] foreign key (AdvisorID) references PROFESSOR(ProfessorID),
constraint [FK_Student_StudentRanks1] foreign key (Stud_Hours) references STUDENTRANKS(StudentRankID)
);

create table STUDENTRANKS(
StudentRankID int not null,
StudnetRankDesc varchar(45) not null,
constraint[PK_StudentRanks]  primary key (StudentRankID)
);

insert into DEPARTMENT 
(DepartmentName, DepartmentID, DeptPhone, DeptChair)
values('Computers', 5, '2143456790', 5)

alter table department
add constraint [FK_Dept_Prof] foreign key
(DeptChair) references Professor(ProfessorID)

alter table proffessor
add ProfLastName varchar(30) not null

insert into PROFFESSOR
values (1, 'Jim', '0103', '3456', 1, 'Hanks'),
(2, 'Sue', '0105', '3457', 1, 'Young'),
(3, 'Tom', '0101', '3400', 2, 'Walker'),
(5, 'John', '0102', '3501', 5, 'Doe')

insert into BUILDING values(2, 'TouroAveJ')

insert into office values('0100', 2),
('0102', 2),
('0103',2),
('0105', 2),
('0104', 2) 

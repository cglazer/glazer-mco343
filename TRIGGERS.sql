use master 
go

create database testingTriggers
go

use testingtriggers
go

create table Account(
AccountID int not null primary key,
initialBalance int not null
)
drop table transactions


create table Transactions(
TransactionsID int not null primary key,
amount int not null,
transactionTypeID int not null foreign key references TransactionType(TransactionTypeID),
AccountID int not null foreign key references Account(AccountID)
)
go

create trigger insert_Trigger
on ACCOUNT for INSERT
as 
insert into Transactions select 1, i.initialBalance, i.AccountID
from inserted i
go

insert into Account values (1, 50)

select *
from Transactions


alter table Account
add currentBalance int

update Account
set currentBalance=50
where AccountID=1

go
create trigger updateBalance
on Transactions
for Insert
as
update Account
set currentBalance= Account.currentBalance+ i.amount
from inserted i
where Account.AccountID= i.accountID
go

insert into transactions values (2, 25, 1)

select *
from Account

alter table Transactions
add transactionType int

go


go
create trigger updateBalanceType
on Transactions 
for Insert
as
declare @Type int;
select @type=transactionType from inserted;
begin
if (@Type=1) 
update Account
set currentBalance= Account.currentBalance+ i.amount
from inserted i
where Account.AccountID= i.accountID
 else if(@Type=2) 
update Account
set currentBalance = Account.currentBalance- i.amount
from inserted i
where Account.AccountID= i.accountID
end;



drop trigger updateBalanceType

insert into Account values(2, 30, 30)

insert into transactions values(6, 100, 1,2)
insert into transactions values(7, 40, 2, 1)
insert into transactions values (8, 50, 2, 2)

select *
from Account


select *
from Transactions

drop trigger updateBalance
drop trigger updateBalanceType
drop trigger insert_Trigger

create table transactionType(
transactionTypeID int not null primary key,
math char(1) not null check (math in ('w','d'))
)

insert into transactiontype values(1, 'w'), (2, 'd')

drop trigger updateBalanceType

create trigger updateBalanceType
on Transactions 
for Insert
as
declare @Type char(1);
select @type=math from
transactionType inner join inserted
on transactionType.transactionTypeID= inserted.transactionTypeID
begin
if (@Type='d') 
update Account
set currentBalance= Account.currentBalance+ i.amount
from inserted i
where Account.AccountID= i.accountID
 else if(@Type='w') 
update Account
set currentBalance = Account.currentBalance- i.amount
from inserted i
where Account.AccountID= i.accountID
end;

select *
from transactions

insert into Transactions values(15, 30, 2, 2)

select *
from Account

select *
from Transactions

create table history(
transactionID int not null primary key foreign key references Transactions(TransactionsID),
UpdatedBalance int not null
)

go



create trigger updateHistory
on Transactions for INSERT
as 
insert into History select i.TransactionsID, (select currentBalance from 
account inner join inserted on Account.AccountID= i.AccountID)
from inserted i
go


insert into Transactions values(20, 50, 1, 2)

select * from history

select *
from account

select *
from Transactions

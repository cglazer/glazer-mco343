use master
go

create database BANK
go

use BANK
go

create table TRANSACTION_TYPE(
TransactionTypeID int not null,
TransactionTypeDescription varchar(45) not null,
constraint[PK_TransactionType] primary key (TransactionTypeID)
)

alter table  TRANSACTION_TYPE add Withdrawal_Deposit char(1) 
alter table Transaction_Type add constraint[Check_w_d] check (Withdrawal_Deposit in ('w', 'd'))

create table CHECK_STATUS(
CheckStatusID int not null,
StatusDescription varchar(45),
constraint[PK_CheckStatus] primary key (CheckStatusID)
)

alter table check_status add statusDescriptionID char(1)

create table ACCOUNT_TYPES(
AccountTypeID int not null,
AccountTypeDescription varchar(45),
constraint[PK_AccountType] primary key (AccountTypeID)
)

create table ADDRESS(
AddressID int not null,
Street_POBox varchar(45) not null,
City varchar(45) not null,
StateSymbol char(2) not null,
ZipCode varchar(9) null,
constraint[PK_Address] primary key (AddressID)
)

create table BANK(
BankID int not null,
BankName varchar(45) not null,
PhoneNumbe char(10) not null,
AddressID int not null,
constraint[PK_Bank] primary key (BankID),
constraint[FK_Address] foreign key (AddressID) references Address(AddressID)
)

create table CUSTOMER(
CustomerID int not null,
CustomerFirstName varchar(25) not null,
CustomerLastName varchar(25) not null,
MailingAddressID int not null,
SocialSecurityNumber char(9),
BirthDate date not null,
DriversLicenseNumber varchar(12) null,
PhoneNumber char(10) not null,
CellNumber char(10) null,
CustomerSpouseName varchar(45) not null,
BankID int not null
constraint[PK_Customer] primary key (CustomerID),
constraint[FK_MailingAddress] foreign key (MailingAddressID) references Address(AddressID),
constraint[FK_BankId] foreign key (BankID) references Bank(BankID)
)

create table ACCOUNT(
AccountID int not null,
AccountNumber char(9) not null,
CustomerID int not null,
AccountTypeID int not null,
DateOpened date not null,
InitialBalance decimal not null,
CurrentBalance decimal not null
constraint[PK_AccountID] primary key (AccountID),
constraint[FK_CustomerID] foreign key (CustomerID) references Customer(customerID),
constraint[FK_AccountType] foreign key (AccountTypeID) references Account_Types(AccountTypeID)
)

create table TRANSACTIONS (
TransactionID int not null,
TransactionDate date not null,
Amount decimal not null,
TransactionTypeID int not null,
AccountID int not null,
Description_Comments varchar(45),
constraint[PK_Transaction] primary key(TransactionID),
constraint[FK_TransactionType] foreign key (TransactionTypeID) references Transaction_Type(TransactionTypeID),
constraint[FK_Account] foreign key (AccountID) references Account(AccountID)
)

create table CheckNum(
CheckNum int not null, 
constraint [PK_checkNum] primary key (CheckNum)
)


create table History(
TransactionID int not null primary key,
CurrentBalance decimal not null
)

alter table History add  foreign key (TransactionID) references Transactions(TransactionID)


create table CHECKS(
CheckID int not null,
AccountID int not null,
CheckNum int not null,
CheckDate date not null,
CheckStatusID int not null,
TransactionID int not null,
constraint[PK_CheckID] primary key(CheckID),
constraint[UIX_Account_CheckNum] unique (AccountID, CheckNum) ,
constraint[FK_AccountIDS] foreign key (AccountID)references Account(AccountID),
constraint[FK_CheckNum] foreign key(CheckNum) references CheckNum(CheckNum),
constraint[FK_Transaction] foreign key (TransactionID) references Transactions(TransactionID)
)

go
create trigger updateBalanceType
on Transactions 
for Insert
as
declare @Type char(1);
select @type= withdrawal_deposit from
transaction_Type inner join inserted
on transaction_Type.transactionTypeID= inserted.transactionTypeID
declare @Check varchar(45);
select @Check= TransactionTypeDescription 
from TRANSACTION_TYPE
inner join inserted
on Transaction_Type.transactionTypeID = inserted.transactionTypeID
begin
if(@Check= 'Check')
return
else if (@Type='d') 
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


--
go
create trigger updateHistory
on Transactions for INSERT
as 
insert into History select i.TransactionID, (select currentBalance from 
account inner join inserted on Account.AccountID= i.AccountID)
from inserted i
go



--when a check is cashed, update history and current balance

go 
create trigger CashCheck on Checks 
for update 
as
declare @status char(1);
select @status=statusDescriptionID from CHECK_STATUS
inner join checks
on CHECK_STATUS.CheckStatusID= CHECKS.checkStatusID
IF ( UPDATE(checkStatusID)) 
BEGIN
if(@Status= 'C')
		update Account
		set currentBalance= Account.currentBalance - (select amount from inserted inner join TRANSACTIONS on inserted.TransactionID= TRANSACTIONS.TransactionID)
		from inserted i
		where Account.AccountID= i.accountID
		UPDATE History
		set currentBalance = (select currentBalance from Account where Account.AccountID = i.AccountID)
		from inserted i
		where History.TransactionID= i.transactionID
end;

go 
create trigger CashCheck2 on Checks 
for update 
as
declare @status char(1);
select @status=statusDescriptionID from CHECK_STATUS
inner join checks
on CHECK_STATUS.CheckStatusID= CHECKS.checkStatusID
IF ( UPDATE(checkStatusID)) 
BEGIN
if (@Status='B')
		insert into TRANSACTIONS values((select 1 +(select max(transactionID) from TRANSACTIONS)), getDate(), 30, (select transactionTypeID from TRANSACTION_TYPE where TransactionTypeDescription= 'Bank Fee'), (select AccountID from inserted), 'Check Bounce Fee')
end





insert into TRANSACTION_TYPE 
values
(1, 'deposit', 'd'),
(2, 'Interest', 'd'),
(3, 'Check', 'w'),
(4, 'Bank Fee', 'w'),
(5, 'transferedFrom', 'd'),
(6, 'transferTo', 'w'),
(7, 'onlinePayment', 'w'),
(8, 'Interest', 'd'),
(9, 'withdrawal', 'w')


insert into ACCOUNT_TYPES
values
(1, 'Savings'),
(2, 'Certificate of Depoist'),
(3, 'Checking'),
(4, 'CheckingPlus'),
(5, 'MoneyMarket')

insert into ADDRESS (AddressID, Street_POBox, City, StateSymbol)
values
(1, 'PO Box 25', 'Buffalo', 'NY'),
(5, 'PO Box 1587', 'New York', 'NY')

insert into Address 
values
(2, '147-25 78 Ave', 'Flushing', 'NY', '11367'),
(3, '123rd Street', 'San Antonio', 'TX', '78217'),
(4, '3484 Lupline Lane', 'Calabasas', 'CA', '91302'),
(6, '4534 Eagle Street', 'Phoenix', 'AZ', '34543'),
(7, '194 E. Flagler Street', 'Miami', 'FL', '33131'),
(8, '1 Court Street', 'Morristown', 'NJ', '07960'),
(9, '104 West 113st', 'New York', 'NY', '10026')


--for this database, we will only be using bank 1

insert into BANK
values
(1, 'Big Bank', '8005562233', 1),
(2, 'New Bank', '8004568732', 3),
(3, 'Small Bank', '8003434343', 3),
(4, 'Old Bank', '3334443333', 5),
(5, 'Brick Bank', '8889992222', 4)

insert into CUSTOMER
values
(1, 'John', 'Marks', 2, '345678987', '11/16/1995', '333333333333', '4444444444', '5456578790', 'Donna', 1),
(2, 'Billy', 'Grun' , 6, '123232345', '2/13/1980', '444444444', '4997865432', '1232343213', 'Hailey', 1),
(3, 'Howard', 'Black', 8, '555444888', '5/28/1969', '777777777777', '9876789876', '9878765647', 'Cheryl', 1),
(5, 'Julia', 'Noland', 7, '111298778', '9/04/ 1992', '888888888888', '2234546765', '9087658796', 'Mathew', 1)

insert into customer
 (customerID, customerFIrstName, CustomerLastName, MailingAddressID, SocialSecurityNumber, BirthDate, phoneNumber, CustomerSpouseName, BankID)
 values
(4,'Evolyn', 'Farry', 9, '334887965', '12/12/2000', '8765443245', 'Ryan', 1)

select * from account

insert into ACCOUNT
values
(1, '555555555', 1, 4, '11/12/2010', 1200, 1200),
(2, '777777777', 2, 3, '12/05/1996', 34000, 34000),
(3, '333333333', 4, 3, '2/23/1985', 7645.20, 7645.20),
(4, '222222222', 2, 1, '1/18/2007', 2389.87, 2389.87),
(5, '222666777', 4, 5, '3/05/2000', 2345679.67, 2345679.67)

select * from transaction_Type

insert into TRANSACTIONS
values
(1, '1/01/2016', 25, 3,  1, 'Check # 1')
insert into TRANSACTIONS
values
(2, '2/25/2015', 300, 3,  1,'Co YYY Payroll deposit')
insert into TRANSACTIONS
values
(3,'9/23/2015', 400, 5,  1, 'from savings')
insert into TRANSACTIONS
values
(4, '1/03/2016', 347.24,6,1,  'to account # ...6543')
insert into TRANSACTIONS
values
(5, '2/25/2025', 23, 1,  1, ' ATM Deposit')
insert into TRANSACTIONS
values
(6, '2/05/1990', 600, 3,  1,  'Check # 2')
insert into TRANSACTIONS
values
(7, '4/05/2016', 43, 3, 1, 'Check # 3')
insert into TRANSACTIONS
values
(8,'11/15/2011', 403, 3, 1, 'Check # 4')
insert into TRANSACTIONS
values
(9,'1/01/2001', 330, 3,  1, 'Check # 5')

insert into TRANSACTIONS
values(20, '11/16/1995', 450,1, 2, 'Teller Deposit')

select * from TRANSACTIONS

insert into CHECKS
values
(1, 1, 1, '1/01/2016', 1,  1),
(2, 1, 2, '2/03/ 1990', 1 , 6),
(3, 1, 3, '4/05/2016', 1, 7 ),
(4, 1, 4, '11/11/2011', 1, 8),
(5, 1, 5, '12/ 12/2000', 1, 9)

select * from checks

insert into CHECK_STATUS
values
(1, 'Pending', 'p'),
(2, 'Cashed', 'c'),
(3, 'Bounced', 'b')


insert into CheckNum
values
(1),(2),(3),(4),(5)



select checkID, Checks.accountID, Checks.TransactionID, statusDescription, amount
from Checks inner join CHECK_STATUS
on checks.CheckStatusID= CHECK_STATUS.CheckStatusID
inner join transactions
on Checks.TransactionID= TRANSACTIONS.TransactionID

select transactionID, amount, accountID
from TRANSACTIONS



select *
from account

insert into transactions values(11, '11/16/1995', 25, 9, 1, 'Deposit' )


update CHECKS set checkStatusID=2
where transactionID=25


select *from TRANSACTIONS

select * from CHECK_STATUS
select * from CHECKS

select * from TRANSACTION_TYPE

select * from History

select * from ACCOUNT

select * from TRANSACTION_TYPE

insert into TRANSACTIONS values (25, '10/20/2015', 367, 3, 1, 'Check # 14')


insert into checks values
(25, 1, 16, '10/20/2015', 1,  25)



insert into CheckNum values(16)

update CHECKS set checkStatusID=3
where transactionID=15


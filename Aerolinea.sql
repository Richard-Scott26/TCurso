create database Aerolinea
go
use Aerolinea
go
create table Person(
	id int primary key identity (1,1) not null,
	[name] varchar(50) not null,
	lastname varchar(50) not null,
	age int not null,
	civilState varchar(20) not null,
	gener varchar(20) not null,
	telephone varchar(20) not null,
	email varchar (50) not null,
	cardId varchar (20) not null,
	[datetime] date not null
)
go
create table Passenger(
	id int primary key identity (1,1) not null,
	idPerson int not null,
	isActive bit not null,
	weigthOfSuitcase float not null
)

alter table Passenger add constraint fk_person foreign key (idPerson) references Person(id)

go
create table Fligth(
	id int primary key identity (1,1) not null,
	aerolineaName varchar(50) not null,
	destination varchar(30) not null,
	countryOfOrigin varchar(30) not null,
	trayectory varchar(20) not null,
	fligthClass varchar (20) not null,
	typeOfFligth varchar (20) not null,
	priceFligth float not null
)
go
create table Ticket(
	id int primary key identity(1,1) not null,
	idPassenger int not null,
	idEmployee int not null,
	idFligth int not null,
	ticketCode varchar(15) not null,
	extraExpenses float not null,
	netPrice float not null,
	[date] datetime not null
)

alter table Ticket add constraint fk_Passenger foreign key (idPassenger) references Passenger(id)
alter table Ticket add constraint fk_Employees foreign key (idEmployee) references Employee(id)
alter table Ticket add constraint fk_Fligths foreign key (idFligth) references Fligth(id)

go
create table Employee(
	id int primary key identity(1,1) not null,
	idPerson int not null,
	workedCard varchar(15) not null,
)

alter table Employee add constraint fk_Person1 foreign key (idPerson) references Person(id)

go
create table PassengerEmployee(
	id int primary key identity(1,1) not null,
	idPassenger int not null,
	idEmployee int not null,
	isActive bit not null,
	idPassengerkey int not null,
	idEmployeekey int not null
)

alter table PassengerEmployee add constraint fk_Passenger1 foreign key (idPassengerkey) references Passenger(id)
alter table PassengerEmployee add constraint fk_Employee1 foreign key (idEmployeekey) references Employee(id)
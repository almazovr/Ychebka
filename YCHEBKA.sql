

create table Positions(
	ID_Positions int primary key identity (1,1),
	NamePosit varchar (30) not null
);
go	

insert into Positions (NamePosit)
values
('Администратор'),
('Лаборант'),
('Руководитель');
go


create table  Employees(
	ID_Employee int primary key identity (1,1),
	Logins nvarchar (15) not null unique,
	Passwords nvarchar (15) not null unique,
	FullNames varchar (50) not null,
	Email varchar (30) not null unique,
	Positions_ID int not null foreign key references Positions (ID_Positions)
);
go

insert into Employees(Logins,Passwords,FullNames,Email,Positions_ID)
values
('rarara123','12345','Морарь Роман Олегович','almazovr206@gmail.com','1'),
('yesyesyes321','54321','Святов Глеб Андреевич','megaChel228@gmail.com','2'),
('nnnnoooooo6583','15243','Проварёнов Алексей Андреевич','nepovar228@gmail.com','3');
go

select * from Employees
select * from Positions



create table Analuzes_samples(
	ID_samples int primary key identity (1,1),
	NameAnalizes varchar (20) not null,
);
go

insert into Analuzes_samples (NameAnalizes)
values
('Кровь'),
('Моча'),
('Кал'),
('Мазок');
go

create table Analyse_type(
	ID_Type int primary key identity (1,1),
	NameType varchar (40) not null,
);
go

insert into Analyse_type (NameType)
values
('Общий анализ крови'),
('Анализ мочи'),
('Анализ кала'),
('Гормональные исследования');
go

 TRUNCATE TABLE Analuzes_samples

select * from Analyse_type
select * from Analuzes_samples



create table Analysis(
	ID_Analyses int primary key identity (1,1),
	due_data date not null,
	samples_ID int not null foreign key references Analuzes_samples (ID_samples),
	Type_ID int not null foreign key references Analyse_type(ID_Type)
);
go

insert into Analysis (due_data,samples_ID,Type_ID)
values
('30.05.2025'),('1'),('1'),
('10.06.2025'),('2'),('2'),
('13.06.2025'),('3'),('3'),
('20.07.2025'),('4'),('4');
go



 
 create table Payment_method(
	ID_Payment int primary key identity (1,1),
	Name_Payment varchar (30) not null,
);
go

create table Patients(
	ID_Patient int primary key identity (1,1),
	Full_Name varchar (50) not null,
	Date_Of_Birth date not null,
	Phone varchar (20) not null unique
);
go

create table Orders(
	ID_Orders int primary key identity (1,1),
	Status nvarchar (30) not null,
	Price decimal (10,2) not null,
	Analyses_id int not null foreign key references Analysis (ID_Analyses),
	Payment_ID int not null foreign key references Payment_method (ID_Patient),
	ID_Patient int not null foreign key references Patients (ID_Patient)
);
go



create table Services(
	ID_Services int primary key identity (1,1),
	Payment_ID int not null foreign key references Payment_method (ID_Payment),
	Patient_ID int not null foreign key references Patients (ID_Patient),
	Orders_ID int not null foreign key references Orders (ID_Orders)
);
go
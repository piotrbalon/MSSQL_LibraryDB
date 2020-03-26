/*
Project: LibraryDB
Database: MS SQL Server 2016
ver: 1.0
*/


USE master;

-- Drop database
IF DB_ID('LibraryDB') IS NOT NULL DROP DATABASE LibraryDB;

-- Create database
CREATE DATABASE LibraryDB
GO
USE LibraryDB
GO

-- Create tables
CREATE TABLE Categories
	(
		 id_category INT PRIMARY KEY NOT NULL
		,name NVARCHAR(25) NOT NULL
	);
	
CREATE TABLE Authors
	(
		 id_author INT  PRIMARY KEY NOT NULL
		,name NVARCHAR(15) NOT NULL
		,surname NVARCHAR(30) NOT NULL
	);	
	
CREATE TABLE Publishers
	(
		 id_publisher INT  PRIMARY KEY NOT NULL
		,publisher_name NVARCHAR(30) NOT NULL
	);		

CREATE TABLE Books
	(
		 id_book INT PRIMARY KEY NOT NULL
		,id_category INT CONSTRAINT FK_category REFERENCES Categories(id_category)
		,title NVARCHAR(40) NOT NULL
		,id_author INT CONSTRAINT FK_author REFERENCES Authors(id_author) NOT NULL
		,id_publisher INT CONSTRAINT FK_publisher REFERENCES Publishers(id_publisher) NOT NULL
		,release_date INT NOT NULL
	);	
CREATE TABLE Readers
	(
		 id_reader INT PRIMARY KEY NOT NULL
		,login NVARCHAR(15) NOT NULL
		,password NVARCHAR(20) NOT NULL
		,email NVARCHAR(30)
		,phone_number NVARCHAR(20)
		,birth_date DATETIME NOT NULL
	);
	
CREATE TABLE Role
    (
		 id_role INT PRIMARY KEY NOT NULL
		,nazwa NVARCHAR(25) NOT NULL
	);
	
CREATE TABLE Employees
    (
		 id_employee INT PRIMARY KEY NOT NULL
		,login NVARCHAR(15) NOT NULL
		,password NVARCHAR(20) NOT NULL
		,id_role INT CONSTRAINT FK_role REFERENCES Role(id_role) NOT NULL
	);	
	
CREATE TABLE Borrows
	(
		 id_borrow BIGINT PRIMARY KEY NOT NULL
		,id_reader INT CONSTRAINT FK_reader REFERENCES Readers(id_reader)
		,id_book INT CONSTRAINT FK_book REFERENCES Books(id_book)
		,borrow_date DATE NOT NULL
		,id_employee_borrow INT CONSTRAINT FK_employee_borrow REFERENCES Employees(id_employee)
		,return_date DATE NOT NULL
		,id_employee_return INT CONSTRAINT FK_employee_return REFERENCES Employees(id_employee)
	);



-- Inserting values into tables
-- Categories (13 records)
INSERT INTO Categories VALUES(1,'Science-fiction');
INSERT INTO Categories VALUES(2,'Horror');
INSERT INTO Categories VALUES(3,'Biograficzne');
INSERT INTO Categories VALUES(4,'Dla dzieci');
INSERT INTO Categories VALUES(5,'Fantastyka');
INSERT INTO Categories VALUES(6,'Romans');
INSERT INTO Categories VALUES(7,'Komiks');
INSERT INTO Categories VALUES(8,'Horror');
INSERT INTO Categories VALUES(9,'Jêzyki obce');
INSERT INTO Categories VALUES(10,'Opowiadania');
INSERT INTO Categories VALUES(11,'Klasyka');
INSERT INTO Categories VALUES(12,'Komiks');
INSERT INTO Categories VALUES(13,'Krymina³');



-- Authors (15 records)
INSERT INTO Authors VALUES(1,'Tomasz','Pajek');
INSERT INTO Authors VALUES(2,'Krystian','Kocur');
INSERT INTO Authors VALUES(3,'Antoni','Haber');
INSERT INTO Authors VALUES(4,'Robert','Cebula');
INSERT INTO Authors VALUES(5,'Michal','Wisniewski');
INSERT INTO Authors VALUES(6,'Ryszard','Czaber');
INSERT INTO Authors VALUES(7,'Jan','Gulczynski');
INSERT INTO Authors VALUES(8,'Dominika','Ciamajda');
INSERT INTO Authors VALUES(9,'Iga','Papiez');
INSERT INTO Authors VALUES(10,'Adam','Matyasik');
INSERT INTO Authors VALUES(11,'Tomasz','Czarnik');
INSERT INTO Authors VALUES(12,'Krzysztof','Krawczyk');
INSERT INTO Authors VALUES(13,'Albert','Cramer');
INSERT INTO Authors VALUES(14,'Dorota','Tinderowa');
INSERT INTO Authors VALUES(15,'Melania','Purchawka');



-- Publishers (10 records)
INSERT INTO Publishers VALUES(1,'Wydawnictwo Kolos');
INSERT INTO Publishers VALUES(2,'Swiat Literatów');
INSERT INTO Publishers VALUES(3,'PWNK');
INSERT INTO Publishers VALUES(4,'Paprykowe ksiazki');
INSERT INTO Publishers VALUES(5,'Szok press');
INSERT INTO Publishers VALUES(6,'Styl Nowy Wydawniczy');
INSERT INTO Publishers VALUES(7,'ExCzytanka');
INSERT INTO Publishers VALUES(8,'Kipme');
INSERT INTO Publishers VALUES(9,'Nilrem');
INSERT INTO Publishers VALUES(10,'Adnelom');



-- Books (15 records)
INSERT INTO Books VALUES(1,6,'Otworze ci serce',9,6,1998);
INSERT INTO Books VALUES(2,7,'Za kazdym razem',2,4,1994);
INSERT INTO Books VALUES(3,1,'Rzym za Nerona',2,1,2016);
INSERT INTO Books VALUES(4,3,'Statek widmo',3,3,2005);
INSERT INTO Books VALUES(5,2,'Kostka Rubika',5,5,2012);
INSERT INTO Books VALUES(6,4,'Half Dead',6,2,1983);
INSERT INTO Books VALUES(7,13,'Chcialem byc marynarzem',7,10,1918);
INSERT INTO Books VALUES(8,10,'Teoria wielkiego brzucha',8,8,2018);
INSERT INTO Books VALUES(9,8,'Nie jestem raperem',1,9,2001);
INSERT INTO Books VALUES(10,9,'English with us',9,5,2003);
INSERT INTO Books VALUES(11,2,'Bylem z Wami',11,3,2000);
INSERT INTO Books VALUES(12,5,'Nie znamy sie',10,2,2005);
INSERT INTO Books VALUES(13,11,'Flying like Kocurek',14,8,1999);
INSERT INTO Books VALUES(14,12,'Azbest 3',15,7,2013);
INSERT INTO Books VALUES(15,9,'Tango Latina',2,1,1976);



-- Readers (15 records)
INSERT INTO Readers VALUES(1,'MirekG','KAKU535TWISII','jan@wp.pl','','1982-12-12');
INSERT INTO Readers VALUES(2,'JanekW','3K15VI4PJGCB9','dsdsfdfsds','','1980-09-23');
INSERT INTO Readers VALUES(3,'JulianC','GE37D7U9GUVI5','hej@gmail.com','','2003-02-10');
INSERT INTO Readers VALUES(4,'DanielW','HVBC1XBBKH32M','rozmaryn@xoxo.com','','1976-05-24');
INSERT INTO Readers VALUES(5,'AlbertO','GRLDBCEWZE4FI','zzzzzzzzz@pl','','2006-09-16');
INSERT INTO Readers VALUES(6,'KamilK','OJFH4282ED23H','maniek@turu.pl','','1963-06-19');
INSERT INTO Readers VALUES(7,'IrekM','2DPM317HD41JU','454545','b.d.','1965-12-20');
INSERT INTO Readers VALUES(8,'JerzyC','86WGDE0WHQFRI','x','','2000-02-12');
INSERT INTO Readers VALUES(9,'KrzysS','1II44MVGF73UN','ehhheheg','','1984-07-02');
INSERT INTO Readers VALUES(10,'LucekK','12UEFHD6LNAG','gfdhdgf@gmail','','1978-02-21');
INSERT INTO Readers VALUES(11,'KasiaP','PQKY8U5B2515','fdsdfdfs','','2001-09-13');
INSERT INTO Readers VALUES(12,'JozekX','V6B8LKJQECDB','angela@gmail.com','','1972-11-09');
INSERT INTO Readers VALUES(13,'OlafKrk','AXC8CEKWJXKDQ','x','','1996-02-15');
INSERT INTO Readers VALUES(14,'RobcikK','HPWGP4G3J531M','brere@wp.pl','','1979-05-02');
INSERT INTO Readers VALUES(15,'Jasiekw','JP2CMAZ691213','xxxxx','','1983-02-01');



-- Employees role (2 records)
INSERT INTO Role VALUES(1,'Kierownik');
INSERT INTO Role VALUES(2,'Dzial Obslugi klienta');



-- Employees (7 records)
INSERT INTO Employees VALUES(1,'Manager1','98D2JXCZ00ABC',1);
INSERT INTO Employees VALUES(2,'Manager2','AW38FBVRTG14',1);
INSERT INTO Employees VALUES(3,'Coworker1','XYZ3PEUAB32DA',2);
INSERT INTO Employees VALUES(4,'Coworker2','92S431HWXDEK9',2);
INSERT INTO Employees VALUES(5,'Coworker3','9231BS53CXBGI',2);
INSERT INTO Employees VALUES(6,'Coworker4','4UIPCLHS19B22',2);
INSERT INTO Employees VALUES(7,'Coworker5','B0BDZXYZWK2G3',2);



-- Borrows (30 records)
INSERT INTO Borrows VALUES(1,15,1,'1990-05-16',1,'1990-06-29',1);
INSERT INTO Borrows VALUES(2,1,3,'1995-10-13',1,'1995-11-03',1);
INSERT INTO Borrows VALUES(3,3,2,'1998-12-08',2,'1999-01-16',2);
INSERT INTO Borrows VALUES(4,4,4,'1994-03-20',3,'1994-04-07',2);
INSERT INTO Borrows VALUES(5,12,5,'1998-12-04',3,'1998-12-06',3);
INSERT INTO Borrows VALUES(6,7,6,'2008-06-19',3,'2008-07-09',3);
INSERT INTO Borrows VALUES(7,8,7,'1992-01-22',3,'1992-03-11',3);
INSERT INTO Borrows VALUES(8,10,1,'1999-04-15',3,'1999-04-13',4);
INSERT INTO Borrows VALUES(9,9,9,'2002-05-23',3,'2002-06-26',4);
INSERT INTO Borrows VALUES(10,6,12,'1997-05-28',2,'1997-06-05',2);
INSERT INTO Borrows VALUES(11,4,15,'2001-08-11',1,'2001-08-26',1);
INSERT INTO Borrows VALUES(12,2,11,'1991-09-25',2,'1991-10-11',2);
INSERT INTO Borrows VALUES(13,3,12,'1990-03-12',3,'1990-04-06',2);
INSERT INTO Borrows VALUES(14,1,10,'1996-07-25',4,'1996-07-31',3);
INSERT INTO Borrows VALUES(15,7,2,'1999-06-20',6,'1999-07-10',4);
INSERT INTO Borrows VALUES(16,6,1,'1999-06-19',5,'1999-07-24',6);
INSERT INTO Borrows VALUES(17,4,14,'1998-08-18',1,'1998-08-27',1);
INSERT INTO Borrows VALUES(18,2,12,'1999-04-11',3,'1999-04-13',1);
INSERT INTO Borrows VALUES(19,13,6,'1998-06-28',7,'1998-06-18',2);
INSERT INTO Borrows VALUES(20,15,9,'1996-07-11',1,'1996-07-16',1);
INSERT INTO Borrows VALUES(21,11,8,'1997-01-02',5,'1997-01-13',2);
INSERT INTO Borrows VALUES(22,3,7,'1997-07-20',2,'1997-07-31',2);
INSERT INTO Borrows VALUES(23,8,1,'1998-07-04',3,'1998-08-14',3);
INSERT INTO Borrows VALUES(24,9,4,'1992-11-22',2,'1992-12-18',6);
INSERT INTO Borrows VALUES(25,2,5,'1994-07-26',4,'1994-08-19',6);
INSERT INTO Borrows VALUES(26,1,1,'1997-09-22',5,'1997-09-26',2);
INSERT INTO Borrows VALUES(27,3,13,'1994-08-09',6,'1994-09-13',7);
INSERT INTO Borrows VALUES(28,4,9,'1997-01-09',2,'1997-01-18',2);
INSERT INTO Borrows VALUES(29,5,14,'1999-04-17',2,'1999-05-12',1);
INSERT INTO Borrows VALUES(30,7,2,'1991-11-29',7,'1991-12-28',2);



-- Updating table 'Readers' with missing phone numbers
UPDATE Readers SET id_reader = 1, phone_number = '+48-225-787-991' WHERE id_reader = 1;
UPDATE Readers SET id_reader = 2, phone_number = '+48-454-518-019' WHERE id_reader = 2;
UPDATE Readers SET id_reader = 3, phone_number = '+48-723-303-525' WHERE id_reader = 3;
UPDATE Readers SET id_reader = 4, phone_number = '+48-653-731-383' WHERE id_reader = 4;
UPDATE Readers SET id_reader = 5, phone_number = '+48-887-410-608' WHERE id_reader = 5;
UPDATE Readers SET id_reader = 6, phone_number = '+48-274-964-641' WHERE id_reader = 6;
UPDATE Readers SET id_reader = 7, phone_number = '+48-661-057-306' WHERE id_reader = 7;
UPDATE Readers SET id_reader = 8, phone_number = '+48-573-592-499' WHERE id_reader = 8;
UPDATE Readers SET id_reader = 9, phone_number = '+48-980-719-933' WHERE id_reader = 9;
UPDATE Readers SET id_reader = 10, phone_number = '+48-842-811-921' WHERE id_reader = 10;
UPDATE Readers SET id_reader = 11, phone_number = '+48-761-361-866' WHERE id_reader = 11;
UPDATE Readers SET id_reader = 12, phone_number = '+48-739-417-489' WHERE id_reader = 12;
UPDATE Readers SET id_reader = 13, phone_number = '+48-488-906-783' WHERE id_reader = 13;
UPDATE Readers SET id_reader = 14, phone_number = '+48-897-762-526' WHERE id_reader = 14;
UPDATE Readers SET id_reader = 15, phone_number = '+48-689-888-383' WHERE id_reader = 15;
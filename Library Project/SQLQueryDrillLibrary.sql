CREATE DATABASE db_Library;
 
USE db_Library;

CREATE TABLE Library_Branch (
		lib_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		lib_BranchName VARCHAR(30) NOT NULL,
		lib_BranchAddress VARCHAR(50) NOT NULL,
);


CREATE TABLE Publisher (
		pub_PublisherName VARCHAR(60) PRIMARY KEY NOT NULL,
		pub_Address VARCHAR(60) NOT NULL,
		pub_Phone VARCHAR(30) NOT NULL
);


CREATE TABLE Books (
		bk_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		bk_Title VARCHAR(60) NOT NULL,
		bk_PublisherName VARCHAR(60) NOT NULL CONSTRAINT fk_pub_PublisherName FOREIGN KEY REFERENCES Publisher(pub_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Borrower (
		bwr_CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		bwr_Name VARCHAR(60),
		bwr_Address VARCHAR(60) NOT NULL,
		bwr_Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Book_Authors (
		bka_BookID INT NOT NULL CONSTRAINT fk_bk_BookID_bka FOREIGN KEY REFERENCES Books(bk_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		bka_AuthorName VARCHAR(40) NOT NULL
);

CREATE TABLE Book_Loans (
		bkl_BookID INT NOT NULL CONSTRAINT fk_bk_BookID_bkl FOREIGN KEY REFERENCES Books(bk_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		bkl_BranchID INT NOT NULL CONSTRAINT fk_lib_BranchID_bkl FOREIGN KEY REFERENCES Library_Branch(lib_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		bkl_CardNo INT NOT NULL CONSTRAINT fk_bwr_CardNo FOREIGN KEY REFERENCES Borrower(bwr_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		bkl_DateOut DATE NOT NULL,
		bkl_DateDue DATE NOT NULL
);

CREATE TABLE Book_Copies (
		bkc_BookID INT NOT NULL CONSTRAINT fk_bk_BookID_bkc FOREIGN KEY REFERENCES Books(bk_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		bkc_BranchID INT NOT NULL CONSTRAINT fk_lib_BranchID_bkc FOREIGN KEY REFERENCES Library_Branch(lib_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		bkc_Number_of_Copies INT NOT NULL
);

INSERT INTO Library_Branch
		(lib_BranchName, lib_BranchAddress)
		VALUES 
		('Sharpstown', '3483 Academy Blvd'),
		('Central', '5820 Union Blvd'),
		('Monument', '1706 Lake Woodmoor Drive'),
		('Palmer Lake', '66 Lower Glenway')
;

INSERT INTO Publisher
	(pub_PublisherName, pub_Address, pub_Phone)
	VALUES
	('Simon & Schuster', '85th Avenue, New York, NY', '212-837-9372'),
	('Bloomsbury', 'Bedford Avenue, London, England', '44-20-84372838'),
	('Penguin Books', 'Abbott Street, London, England', '44-20-5948372'),
	('Dell Publishing', 'Broadway, New York, NY', '212-5630-3857'),
	('Gardner Books', 'Whittle Drive, East Sussex, England', '44-13-1358373'),
	('Harper Collins', 'Broadway, New York, NY', '212-459-3948'),
	('Little Brown Books for Young Readers', 'Peachtree Avenue, Columbus, Georgia', '762-546-5847'),
	('Little Brown and Company', 'Pittman Street, Columbus, Georgia', '762-593-4395'),
	('Doubleday', '5th Avenue, New York, NY', '212-438-2837')
;

INSERT INTO Books
	(bk_Title, bk_PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Books'),
	('The Shining', 'Simon & Schuster'),
	('The Stand', 'Simon & Schuster'),
	('It', 'Simon & Schuster'),
	('Pet Semetary', 'Simon & Schuster'),
	('Carry', 'Simon & Schuster'),
	('Harry Potter And the Sorcerers Stone', 'Bloomsbury'),
	('Harry Potter And the Chamber of Secrets', 'Bloomsbury'),
	('Harry Potter And the Prisoner of Azkaban', 'Bloomsbury'),
	('Harry Potter And the Goblet of Fire', 'Bloomsbury'),
	('Harry Potter And the Order of the Phoenix', 'Bloomsbury'),
	('Harry Potter And the Half-Blood Prince', 'Bloomsbury'),	
	('Harry Potter And the Deathly Hollows', 'Bloomsbury'),
	('The Lightening Thief', 'Penguin Books'),
	('The Sea of Monsters', 'Penguin Books'),
	('The Titans Curse', 'Penguin Books'),
	('The Lost Hero', 'Penguin Books'),
	('The Sword of Summer', 'Penguin Books'),
	('The Hammer of Thor', 'Penguin Books'),
	('Tales of a Fourth Grade Nothing', 'Dell Publishing'),
	('Otherwise Known As Sheila the Great', 'Dell Publishing'),
	('Super Fudge', 'Dell Publishing'),
	('Blubber', 'Dell Publishing'),
	('One For The Money', 'Gardner Books'),
	('Two for The Dough', 'Gardner Books'),
	('Three to Get Deadly', 'Gardner Books'),
	('Beezus and Ramona', 'Harper Collins'),
	('The Mouse and the Motorcycle', 'Harper Collins'),
	('The Wishing Spell', 'Little Brown Books for Young Readers'),
	('The Enchantress Returns', 'Little Brown Books for Young Readers'),
	('The President is Missing', 'Little Brown and Company'),
	('Target: Alex Cross', 'Little Brown and Company'),
	('Ambush', 'Little Brown and Company'),
	('The First Lady', 'Little Brown and Company'),
	('The Reckoning', 'Little Brown and Company'),
	('The Cornwalls Are Gone', 'Little Brown and Company'),
	('The Davinci Code', 'Doubleday'),
	('Angels and Demons', 'Doubleday'),
	('Inferno', 'Doubleday'),
	('The Lost Symbol', 'Doubleday'),
	('Murder on the Orient Express', 'Harper Collins'),
	('And Then There Were None', 'Harper Collins'),
	('Death on the Nile', 'Harper Collins'),
	('Crooked House', 'Harper Collins'),
	('Peril At End House', 'Harper Collins'),
	('Appointment With Death', 'Harper Collins')
;

INSERT INTO Borrower
	(bwr_Name, bwr_Address, bwr_Phone)
	VALUES
	('Tom Jones', '5496 Allegheny Dr', '719-348-2348'),
	('Nicole Winfrey', '3493 Bison Ridge', '719-342-4594'),
	('Liam Hanks', '4938 Julynn Dr', '719-348-3483'),
	('Emma Roberts', '2395 Allegheny Dr', '719-348-8349'),
	('Brittany Aguillera', '3428 Winding Oaks Dr', '719-452-5839'),
	('Kelly Seacrest', '3423 Curled Oak Dr', '719-342-5235'),
	('Katie Swift', '5938 Post Ave', '719-349-3829'),
	('Ed Groban', '3489 Grey Eagle', '719-349-3473'),
	('Selena Richie', '8372 Dublin', '719-483-0353')
;

INSERT INTO Book_Authors
	(bka_BookID, bka_AuthorName)
	VALUES
	(1, 'Beverly Cleary'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Stephen King'),
	(5, 'Stephen King'),
	(6, 'Stephen King'),
	(7, 'J.K.Rowling'),
	(8, 'J.K.Rowling'),
	(9, 'J.K.Rowling'),
	(10, 'J.K.Rowling'),
	(11, 'J.K.Rowling'),
	(12, 'J.K.Rowling'),
	(13, 'J.K.Rowling'),
	(14, 'Rick Riordan'),
	(15, 'Rick Riordan'),
	(16, 'Rick Riordan'),
	(17, 'Rick Riordan'),
	(18, 'Rick Riordan'),
	(19, 'Rick Riordan'),
	(20, 'Judy Blume'),
	(21, 'Judy Blume'),
	(22, 'Judy Blume'),
	(23, 'Judy Blume'),
	(24, 'Janet Evanovich'),
	(25, 'Janet Evanovich'),
	(26, 'Janet Evanovich'),
	(27, 'Beverly Cleary'),
	(28, 'Beverly Cleary'),
	(29, 'Chris Colfer'),
	(30, 'Chris Colfer'),
	(31, 'James Patterson'),
	(32, 'James Patterson'),
	(33, 'James Patterson'),
	(34, 'James Patterson'),
	(35, 'James Patterson'),
	(36, 'James Patterson'),
	(37, 'Dan Brown'),
	(38, 'Dan Brown'),
	(39, 'Dan Brown'),
	(40, 'Dan Brown'),
	(41, 'Agatha Christie'),
	(42, 'Agatha Christie'),
	(43, 'Agatha Christie'),
	(44, 'Agatha Christie'),
	(45, 'Agatha Christie'),
	(46, 'Agatha Christie')
;

INSERT INTO Book_Loans
	(bkl_BookID, bkl_BranchID, bkl_CardNo, bkl_DateOut, bkl_DateDue)
	VALUES
	(1,1,3, '2018-10-13', '2018-11-04'),
	(1,3,4, '2018-10-17', '2018-11-08'),
	(1,4,7, '2018-10-17', '2018-11-08'),
	(2,2,2, '2018-10-19', '2018-11-09'),
	(2,4,5, '2018-10-19', '2018-11-09'),
	(4,1,2, '2018-10-16', '2018-11-07'),
	(4,4,3, '2018-10-13', '2018-11-04'),
	(4,4,5, '2018-10-19', '2018-11-10'),
	(5,4,3, '2018-10-13', '2018-11-04'),
	(10,1,5, '2018-10-19', '2018-11-10'),
	(11,1,1, '2018-10-14', '2018-11-05'),
	(11,4,3, '2018-10-13', '2018-11-04'),
	(11,4,5, '2018-10-19', '2018-11-10'),
	(12,2,6, '2018-10-16', '2018-11-07'),
	(14,4,3, '2018-10-13', '2018-11-04'),
	(14,4,5, '2018-10-19', '2018-11-08'),
	(18,2,1, '2018-10-17', '2018-11-08'),
	(18,2,5, '2018-10-19', '2018-11-10'),
	(20,1,3, '2018-10-13', '2018-11-04'),
	(23,3,3, '2018-10-13', '2018-11-04'),
	(24,2,3, '2018-10-13', '2018-11-04'),
	(27,3,2, '2018-10-15', '2018-11-06'),
	(30,1,4, '2018-10-16', '2018-11-01'),
	(32,1,4, '2018-10-16', '2018-11-06'),
	(33,1,1, '2018-10-17', '2018-11-08'),
	(34,1,1, '2018-10-17', '2018-11-08'),
	(37,3,4, '2018-10-16', '2018-10-07'),
	(39,3,6, '2018-10-14', '2018-11-05'),
	(44,1,6, '2018-10-14', '2018-11-05'),
	(44,1,9, '2018-10-15', '2018-11-06'),
	(46,2,9, '2018-10-15', '2018-11-06')
;

INSERT INTO Book_Copies
	(bkc_BookID, bkc_BranchID, bkc_Number_of_Copies)
	VALUES
	(1,1,3),
	(1,2,2),
	(1,4,4),
	(2,2,3),
	(2,4,1),
	(3,2,3),
	(3,3,5),
	(4,1,3),
	(4,4,4),
	(5,4,8),
	(6,2,4),
	(6,4,3),
	(7,2,6),
	(7,3,2),
	(8,1,4),
	(8,2,5),
	(8,3,2),
	(9,4,2),
	(10,1,3),
	(10,4,1),
	(11,1,2),
	(11,4,3),
	(12,2,6),
	(13,1,2),
	(13,3,2),
	(13,4,3),
	(14,2,2),
	(14,3,3),
	(14,4,2),	
	(15,2,2),
	(15,4,1),
	(16,1,2),
	(16,2,3),
	(16,4,2),
	(17,2,2),
	(18,2,8),
	(19,1,6),
	(19,3,2),
	(20,1,2),
	(20,4,3),
	(21,1,1),
	(21,2,1),
	(22,2,2),
	(23,3,3),
	(24,2,2),
	(24,4,1),
	(25,2,8),
	(26,2,10),
	(27,2,3),
	(27,3,4),
	(28,3,6),
	(29,4,2),
	(30,1,4),
	(30,2,2),
	(31,1,7),
	(32,1,7),
	(33,3,2),
	(34,2,2),
	(34,3,2),
	(34,4,2),
	(35,2,7),
	(36,1,4),
	(36,3,3),
	(37,3,3),
	(38,3,1),
	(39,2,2),
	(39,3,2),
	(40,2,4),
	(40,4,3),
	(41,4,4),
	(42,1,1),
	(42,3,5),
	(43,3,8),
	(44,1,2),
	(44,4,4),
	(45,4,4),
	(46,2,8)
;


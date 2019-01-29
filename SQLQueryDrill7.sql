CREATE DATABASE db_connections;

USE db_connections;

CREATE TABLE tbl_name (
		name_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		name_fname VARCHAR(50) NOT NULL,
		name_lname VARCHAR(50) NOT NULL,
);

SELECT * FROM tbl_name;

CREATE TABLE tbl_contact (
	contact_address VARCHAR(50) NOT NULL,
	contact_phone VARCHAR(50) NOT NULL,
	contact_id INT NOT NULL CONSTRAINT fk_name_id FOREIGN KEY REFERENCES tbl_name(name_id) ON UPDATE CASCADE ON DELETE CASCADE,
);

Select * FROM tbl_contact;

INSERT INTO tbl_name
		(name_fname, name_lname)
		VALUES 
		('jennifer', 'garner'),
		('tom', 'cruise'),
		('bill', 'gates'),
		('steve', 'jobs'),
		('kate', 'hudson')
;

INSERT INTO tbl_contact
		(contact_address, contact_phone, contact_id)
		VALUES 
		('3453 Main Street', '353-489-2938', 1),
		('9432 First Street', '353-483-2343', 2),
		('9037 Second Street', '498-348-2342', 3),
		('2398 Main Street', '498-234-8923', 4),
		('9433 First Street', '353-324-2383', 5)
;

SELECT name_lname AS 'Last Name:', contact_phone AS 'Phone Number:' FROM tbl_name
	INNER JOIN tbl_contact ON name_id = contact_id
	WHERE contact_address LIKE '%Main%'
;
USE db_zoo;

CREATE TABLE tbl_animalia (
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);


INSERT INTO tbl_animalia
	(animalia_type)
	VALUES
	('vertebrate'),
	('invertebrate')
;

SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	class_type VARCHAR(50) NOT NULL
);

SELECT * FROM tbl_class;

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;


UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

SELECT * FROM tbl_class;

SELECT REPLACE(class_type, 'birds', 'bird') FROM tbl_class;

SELECT  UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL

);

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '232-233-3433'),
	('mary', 'jones', '232-543-3495'),
	('tex', 'burns', '234-594-4543'),
	('gerry', 'reynolds', '232-433-2393'),
	('sally', 'lane', '232-429-9342')
;

SELECT * FROM tbl_persons;

UPDATE tbl_persons SET persons_fname = 'mars' where persons_fname = 'bob';


SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_u%s';


SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname DESC;


SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_fname LIKE 'm%' ORDER BY persons_lname DESC;

DELETE FROM tbl_persons WHERE persons_lname = 'smith';

SELECT * from tbl_persons;

DROP TABLE tbl_persons;

SELECT * from tbl_persons;


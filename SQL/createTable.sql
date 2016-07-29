CREATE TABLE Students (
StudentNumber INT,
Phone INT,
Name VARCHAR(20),
Major VARCHAR(20),
DegreeCredits INT,

PRIMARY KEY (StudentNumber, Phone)
);

CREATE TABLE InternationalStudent (

Nationality VARCHAR(20),
StudentNumber INT,

Phone INT,

Name VARCHAR(20),

PRIMARY KEY (StudentNumber, Phone)

);






CREATE TABLE LocalStudent (

Homestate VARCHAR(20),

StudentNumber INT,

Phone INT,

Name VARCHAR(20),

PRIMARY KEY (StudentNumber, Phone)

);





CREATE TABLE Take (

StudentNumber INT,

Phone INT,

Number INT,

Location VARCHAR(20),

Semester INT,

PRIMARY KEY (StudentNumber, Phone, Number, Location)

);





CREATE TABLE Supervise (

StaffID INT,

Email VARCHAR(20),

StudentNumber INT,

Phone INT,

PRIMARY KEY (StaffID, Email, StudentNumber, Phone)

);





CREATE TABLE Participate (

Name VARCHAR(20),

Date DATE,

StudentNumber INT,

Phone INT,

PRIMARY KEY (Name, Date, StudentNumber, Phone)

);



CREATE TABLE University
(
	Name varchar(20) PRIMARY KEY,
	Address varchar(20),
	Type Char(10),
	Website varchar(20),
	Rank INT
);

CREATE TABLE Department
(
	Name varchar(20),
	Main_Building varchar(20),
	Head varchar(20),
	PRIMARY KEY(Main_Building,Head)
);

CREATE TABLE Administrate
(
	Head varchar(20),
	Main_Building varchar(20),
	UniversityName varchar(20),
        PRIMARY KEY(Head, Main_Building, UniversityName)
);

CREATE TABLE Cooperation
(
	UniversityName varchar(20),
	CompanyName varchar(20),
        PRIMARY KEY(UniversityName, CompanyName)
);


CREATE TABLE Organize
(
	UniversityName varchar(20),
	ActivitiesName varchar(20),
	ActivitiesDate DATE,
        PRIMARY KEY(UniversityName, ActivitiesName, ActivitiesDate)
);

CREATE TABLE Admit
(
	Head varchar(20),
	Main_Building varchar(20),
	Student_Number INT, 
	Phone INT,
        PRIMARY KEY(Head, Main_Building, Student_Number, Phone)
);

CREATE TABLE Offer
(
	Head varchar(20),
	Main_Building varchar(20),
	CoursesNumber integer,
	CoursesLocation varchar(20),
        PRIMARY KEY(Head, Main_Building, CoursesNumber, CoursesLocation)
);

CREATE TABLE Courses
(
	Name 		VARCHAR(20),
	Number 		INT,
	Location 	VARCHAR(20),
	Credits		INT,
	Hours		INT,
	PRIMARY KEY (Number, Location)
);

CREATE TABLE Faculty
(
	StaffID		INT,
	Name		VARCHAR(20),
	Title		VARCHAR(20),
	Office		VARCHAR(20),
	Email		VARCHAR(20),
	PRIMARY KEY (StaffID, Email)
);

CREATE TABLE Hire
(
	Head			VARCHAR(20),
	MainBuilding 	VARCHAR(20),
	StaffID			INT,
	Email			VARCHAR(20),
	Salary			INT,
	PRIMARY KEY(Head, MainBuilding, StaffID, Email)
);

CREATE TABLE Teach
(
	StaffID		INT,
	Email		VARCHAR(20),
	Number		INT,
	Location 	VARCHAR(20),
	PRIMARY KEY(StaffID, Email, Number, Location)
);

CREATE TABLE Prerequisite
(
	PreNumber 		INT,
	PreLocation		VARCHAR(20),
	AdvNumber		INT,
	AdvLocation		VARCHAR(20),
	PRIMARY KEY(PreNumber, PreLocation, AdvNumber, AdvLocation)
);


CREATE TABLE Work(
StudentNumber	INT,
Phone	INT,
CompanyName	VARCHAR(20),
Minsalary	INT,
Position	VARCHAR(20),
PRIMARY KEY (StudentNumber, Phone, CompanyName, Minsalary, Position)
);

CREATE TABLE Internship(
Number INT,
CompanyName VARCHAR(20),
Position	VARCHAR(20),
Area	VARCHAR(20),
PRIMARY KEY (Number, CompanyName, Position, Area)
);

CREATE TABLE Company(
CompanyName	VARCHAR(20) PRIMARY KEY,
Address	VARCHAR(20),
Area	VARCHAR(20)
);

CREATE TABLE Activities(
Name VARCHAR(20),
Date DATE,
Location VARCHAR(20),
Organiser	VARCHAR(20),
PRIMARY KEY(Name,Date)
);



LOAD DATA LOCAL INFILE'~/AdministrateData.txt'INTO TABLE Administrate LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/CooperationData.txt'INTO TABLE Cooperation LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/AdmitData.txt'INTO TABLE Admit LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/DepartmentData.txt'INTO TABLE Department LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/OfferData.txt'INTO TABLE Offer LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/OrganizeData.txt'INTO TABLE Organize LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/UniversityData.txt'INTO TABLE University LINES TERMINATED BY '\r\n';


LOAD DATA LOCAL INFILE '~/ActivitiesData.txt' INTO TABLE Activities LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/CompanyData.txt' INTO TABLE Company LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/WorkData.txt' INTO TABLE Work LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/InternshipData.txt' INTO TABLE Internship LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE '~/CourseData.txt' INTO TABLE Courses LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/FacultyData.txt' INTO TABLE Faculty LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/HireData.txt' INTO TABLE Hire LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/TeachData.txt' INTO TABLE Teach LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE '~/PrerequisiteData.txt' INTO TABLE Prerequisite LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE'~/StudentData.txt'INTO TABLE Students LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/NationalityData.txt'INTO TABLE InternationalStudent LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/HomestateData.txt'INTO TABLE LocalStudent LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/TakeData.txt'INTO TABLE Take LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/SuperviseData.txt'INTO TABLE Supervise LINES TERMINATED BY '\r\n';
LOAD DATA LOCAL INFILE'~/ParticipateData.txt'INTO TABLE Participate LINES TERMINATED BY '\r\n';





SELECT * FROM Students;
SELECT * FROM InternationalStudent;
SELECT * FROM LocalStudent;
SELECT * FROM Take;
SELECT * FROM Supervise;
SELECT * FROM Participate;


select * from Company;
select * from Work;
select * from Internship;
select * from Activities;


SELECT * FROM Courses;
SELECT * FROM Faculty;
SELECT * FROM Hire;
SELECT * FROM Teach;
SELECT * FROM Prerequisite;



SELECT * FROM University;
SELECT * FROM Admit;
SELECT * FROM Administrate;
SELECT * FROM Cooperation;
SELECT * FROM Department;
SELECT * FROM Organize;
SELECT * FROM Offer;

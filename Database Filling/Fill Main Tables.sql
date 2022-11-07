INSERT INTO Instructors (InsID, Email, Password, FullName, DOB, Salary, City, PhoneNumber, Gender)
VALUES
(1, 'Ahmedzaki@iti.com','1234', 'Ahmed Zaki', '01-30-1975', 9000,'Cairo', '01012314754', 'Male'),
(2, 'Mohamedali@iti.com', '5713', 'Mohamed Ali', '11-22-1982', 8000, 'Alex', '01012264754', 'Male'),
(3, 'Osamafekry@iti.com','N@76', 'Osama Fekry', '03-05-1990', 7000, 'Cairo', '01079314755', 'Male'),
(4, 'Salmafarouk@iti.com', '1xy4' , 'Salma Farouk', '02-03-1979', 8500, 'Port Said', '01152314123', 'Female'),
(5, 'Mohamedayman@iti.com', '12@h', 'Mohamed Ayman', '06-15-1984',7700, 'Mansoura',  '01112314000', 'Male'),
(6, 'Ramymahmoud@iti.com','8u8h' ,  'Ramy Mahmoud ', '11-24-1992', 6500, 'Cairo', '01212314745',  'Male'),
(7, 'NourYahia@iti.com','8%fs', 'Nour yahia', '12-17-1996',7000,'Cairo','01112314712', 'Female'),
(8, 'NadiaHussien@iti.com','D$Mn', 'Nadia Hussien', '01-26-1992', 7000, 'Alex', '01013314624', 'Female'),
(9, 'LailaMohamed@iti.com','L@12', 'Laila Mohamed', '05-05-1987', 7400, 'Port Said', '01013614014', 'Female'),
(10, 'Heshammamdouh@iti.com','a#fm', 'Hesham Mamdouh', '08-29-1995',8500, 'Mansoura', '01012544799',  'Male')


INSERT INTO Departments (DeptID, DeptName, MangID)
VALUES
(100,'BI',1),
(200,'Data Visualization',4),
(300,'.Net',9),
(400,'DevOps',5)


INSERT INTO Students (SSN ,  Email , Password , FullName  , DOB , Faculty, GYear, City, PhoneNumber, StartDate, GradDate, Status, Gender, DeptID)
VALUES
(14741, 'NadaNagi@iti.com', '43rf', 'Nada Nagi', '07-05-1995','Engineering', 2017,'Cairo', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Female', 100),
(18512, 'MohandAli@iti.com', '40gf', 'Mohand Ali', '09-15-1997','Commerce', 2019,'Mansoura' ,'0174251474', '07-30-2022', '10-31-2022', 'Single', 'Male', 100),
(41254, 'OmarAbdelrahman@iti.com', 'iy*g', 'Omar Abdelrahman', '01-11-1999' ,'Engineering',  2021,'Port Said', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Male', 100),
(35217, 'AbanobFarag@iti.com', 'zaw*h', 'Abanob Farag', '04-24-1995','Computer Science' , 2017,'Port Said', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Male', 100),
(35218, 'AlaaAhmed@iti.com', 'tb*t', 'Alaa Ahmed', '08-25-1996','Computer Science', 2018,'Cairo', '0174251474','07-30-2022', '10-31-2022', 'Single', 'Female', 100),
(14241, 'NourNagi@iti.com', '43rf', 'Nour Nagi', '07-15-1995','Engineering', 2017,'Cairo', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Female', 300),
(18712, 'Assermohamed@iti.com', '40gf', 'Asser Mohamed', '09-15-1999','Computer Science', 2021,'Mansoura' ,'0174251474', '07-30-2022', '10-31-2022', 'Single', 'Male', 300),
(41434, 'Faressaeed@iti.com', 'iy*g', 'Fares Saeed', '01-11-1999' ,'Engineering',  2021,'Port Said', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Male', 300),
(35227, 'Mennaahmed@iti.com', 'zaw*h', 'Menna Ahmed', '04-24-1995','Computer Science' , 2017,'Port Said', '0174251474', '07-30-2022', '10-31-2022', 'Single', 'Female', 300),
(35718, 'MaryamAhmed@iti.com', 'tb*t', 'Maryam Ahmed', '08-25-1996','Computer Science', 2018,'Cairo', '0174251474','07-30-2022', '10-31-2022', 'Single', 'Female', 300),
(10041, 'AbrarAhmed@iti.com', '43rf', 'Abrar Ahmed', '07-15-1998','Engineering', 2020,'Cairo', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Female', 200),
(18002, 'Mostafamohamed@iti.com', '40gf', 'Mostafa Mohamed', '09-15-1999','Computer Science', 2021,'Mansoura' ,'0174251474',  '03-30-2022', '06-30-2022', 'Single', 'Male', 200),
(40034, 'Noursaeed@iti.com', 'iy*g', 'Nour Saeed', '01-11-1999' ,'Commerce',  2021,'Mansoura', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Female', 200),
(35200, 'Amiraahmed@iti.com', 'zaw*h', 'Amira Ahmed', '04-24-1995','Computer Science' , 2017,'Port Said', '0174251474',  '03-30-2022', '06-30-2022', 'Married', 'Female', 200),
(30018, 'Seraj Ahmed@iti.com', 'tb*t', 'Seraj Ahmed', '08-25-1996','Commerce', 2018,'Cairo', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Male', 200),
(10000, 'MohamedAhmed@iti.com', '43rf', 'Mohamed Ahmed', '07-15-1998','Engineering', 2020,'Cairo', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Male', 400),
(18000, 'Alimohamed@iti.com', '40gf', 'Ali Mohamed', '09-15-1999','Computer Science', 2021,'Mansoura' ,'0174251474',  '03-30-2022', '06-30-2022', 'Single', 'Male', 400),
(40000, 'Nadersaeed@iti.com', 'iy*g', 'Nader Saeed', '01-11-1999' ,'Engineering',  2021,'Mansoura', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Male', 400),
(35000, 'Amirali@iti.com', 'zaw*h', 'Amir Ali', '04-24-1995','Computer Science' , 2017,'Port Said', '0174251474',  '03-30-2022', '06-30-2022', 'Married', 'Male', 400),
(30010, 'DiaayAhmed@iti.com', 'tb*t', 'Diaa Ahmed', '08-25-1996','Computer Science', 2018,'Cairo', '0174251474', '03-30-2022', '06-30-2022', 'Single', 'Male', 400)

INSERT INTO Courses (CrsID, CrsName, Hours)
VALUES
(101,'Excel', 18),
(102,'C#', 60),
(103,'SQL',60),
(104,'Power BI',40),
(105,'Cloud',24),
(106,'Data Structure',30)


INSERT INTO StCourse (SSN, CrsID)
VALUES
(14741,101),
(14741,102),
(14741,103),
(14741,104),
(14741,106),
(18512,101),
(18512,102),
(18512,103),
(18512,104),
(18512,106),
(41254,101),
(41254,102),
(41254,104),
(41254,103),
(41254,106),
(35217,101),
(35217,102),
(35217,103),
(35217,104),
(35217,106),
(35218,101),
(35218,102),
(35218,103),
(35218,104),
(35218,106),
(14241,102),
(14241,103),
(14241,104),
(14241,106),
(18712,102),
(18712,103),
(18712,104),
(18712,106),
(41434,102),
(41434,103),
(41434,104),
(41434,106),
(35227,102),
(35227,103),
(35227,104),
(35227,106),
(35718,102),
(35718,103),
(35718,104),
(35718,106),
(10041,102),
(10041,103),
(10041,104),
(18002,102),
(18002,103),
(18002,104),
(40034,102),
(40034,103),
(40034,104),
(35200,102),
(35200,103),
(35200,104),
(30018,102),
(30018,103),
(30018,104),
(10000,103),
(10000,105),
(18000,103),
(18000,105),
(40000,103),
(40000,105),
(35000,103),
(35000,105),
(30010,103),
(30010,105)


INSERT INTO Topics (TopName,CrsID)
VALUES
('Functions',101),
('Pivot Table',101),
('Dashboards',101),
('Variables',102),
('Loops',102),
('If Condition',102),
('OOP',102),
('Desktop App',102),
('DDL',103),
('DML',103),
('Views',103),
('Triggers',103),
('Stored Procedures',103),
('DAX',104),
('Charts',104),
('Modeling',104),
('Power Query',104),
('intro to cloud',105),
('cloud history',105),
('Saas',105),
('Paas',105),
('Iaas',105),
('Algorithms',106),
('Sorting',106),
('Searching',106),
('Graphs',106),
('Tree',106)


INSERT INTO InsDept( DeptID, InsID)
VALUES
(100,1),
(100,3),
(100,6),
(100,7),
(200,2),
(200,4),
(200,6),
(200,8),
(300,9),
(300,10),
(300,5),
(300,1),
(400,5),
(400,3),
(400,7),
(400,10)


INSERT INTO DeptCrs(DeptID, CrsID)
VALUES
(100,102),
(100,103),
(100,104),
(100,101),
(100,106),
(200,102),
(200,103),
(200,104),
(300,102),
(300,103),
(300,104),
(300,106),
(400,103),
(400,105)



INSERT INTO InsCrs (InsID, CrsID)
VALUES
(1,102),
(1,106),
(2,104) ,
(3,103) ,
(4,105),
(5,103),
(6,101) ,
(7,104) ,
(7,103) ,
(8,102) ,
(9,103),
(10,102),
(10,105) 


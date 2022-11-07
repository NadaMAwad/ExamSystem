----------------------------------------------- Instructors Table PS  (Radwa Yasser)-------------------------------------------------------------

--> Select all Instructors
	CREATE PROC [dbo].[allInsSelect]
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors)
	  SELECT *
	  FROM Instructors
	  Else 
	  Select ' doesn''t exists'
	END
	GO

--> Delete instructor
	CREATE Proc [dbo].[InsDelete] @InsID int
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
		Delete from Instructors Where InsID = @InsID
		ELSE
		PRINT ('Instructor #' + CAST(@InsID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Add instructor
	CREATE PROC [dbo].[InsInsert] @InsID int,@Email varchar(200),@Password varchar(50),
	@Fullname varchar(200), @DOB date,@City varchar(50),@PhoneNumber varchar(50),
	@Salary money,@Gender nvarchar(10)
	AS
	BEGIN
	  IF NOT EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
		INSERT INTO Instructors(InsID, Email,Password,Fullname,DOB, Salary,City,PhoneNumber,Gender)
		  VALUES (@InsID,@Email,@Password,@Fullname,@DOB,@Salary,@City,@PhoneNumber,@Gender)
	  ELSE
	   select ('Instructor already exists')
	END
	GO

--> Update instructor name
	CREATE PROC [dbo].[InsNameUpdate] @InsID int,@Fullname varchar(200)
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
	  BEGIN
		UPDATE Instructors 
		SET Fullname = @Fullname
		WHERE InsID = @InsID
	  END
	  ELSE
		PRINT ('Instructor #' + CAST(@InsID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update instructor password
	CREATE PROC [dbo].[InsPassUpdate] @InsID int, @Password varchar(50)
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
	  BEGIN
		UPDATE Instructors 
		SET  Password=@Password
		WHERE InsID = @InsID
	  END
	  ELSE
		PRINT ('Instructor #' + CAST(@InsID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update instructor phone
	CREATE PROC [dbo].[InsPhonUpdate] @InsID int,@Phonnumber Varchar(50)
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
	  BEGIN
		UPDATE Instructors 
		SET PhoneNumber = @Phonnumber
		WHERE InsID = @InsID
	  END
	  ELSE
		PRINT ('Instructor #' + CAST(@InsID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update instructor salary
	CREATE PROC [dbo].[InsSalaryUpdate] @InsID int,@Salary Varchar(50)
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
	  BEGIN
		UPDATE Instructors 
		SET Salary = @Salary
		WHERE InsID = @InsID
	  END
	  ELSE
		PRINT ('Instructor #' + CAST(@InsID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Show instructo info 
	CREATE PROC [dbo].[InsSelect] @InsID int
	AS
	BEGIN
	  IF EXISTS (SELECT InsID FROM Instructors WHERE InsID = @InsID)
	  SELECT *
	  FROM Instructors
	  where InsID =@InsID
	  Else 
	  Select ' doesn''t exists'
	END
	GO
------------------------------------------------ Departments Table PS (Osama Aahmed Badr) ---------------------------------------------------------------

--> Insert Dept:
	CREATE PROCEDURE [dbo].[AddDepartment] @DeptID as int, @DeptName as varchar(100),@ManagID as int
	AS
	BEGIN
		IF Not EXISTS (SELECT DeptID FROM Students WHERE DeptID = @DeptID)
			INSERT INTO Departments
			VALUES (@DeptID,@DeptName,@ManagID)
		ELSE
			 PRINT ('DeptID "' + CAST(@DeptID AS varchar(20))+'"  is already exists')
	END	
	GO

--> Delete Department 
	CREATE PROCEDURE [dbo].[DeleteDepartment] @DeptID as int
	AS
	BEGIN
		IF EXISTS (SELECT DeptID FROM Departments WHERE DeptID = @DeptID)
			DELETE FROM Departments
			WHERE DeptID = @DeptID
		ELSE
			 PRINT ('DeptID # "' + CAST(@DeptID AS varchar(20))+'"  doesn''t exists')
	END
	GO

--> Select Depts' managers 
	CREATE PROC [dbo].[DeptMangersSelect] 
	AS
	BEGIN
	  IF EXISTS (SELECT MangID FROM Departments,Instructors WHERE InsID = MangID)
	  SELECT DeptName,FullName
	  FROM Instructors, Departments
	  WHERE InsID = MangID
	  Else 
	  Select ' doesn''t exists'
	END
	GO

--> Select Students in department
	CREATE PROCEDURE [dbo].[GetDept_Students] @DeptID as int
		AS
		BEGIN
			IF EXISTS ( SELECT DeptID FROM Departments WHERE DeptID = @DeptID)
					SELECT d.DeptName,s.FullName,s.DOB, s.Faculty,s.GYear FROM Students s, Departments d WHERE d.DeptID =s.DeptID AND d.DeptID =@DeptID
			ELSE
				PRINT('DeptID #"' + CAST(@DeptID As varchar(30))+' " doesn''t exists')
		END
	GO

--> Select all departments
	CREATE PROCEDURE [dbo].[SelectDepartments]
	AS
	SELECT * FROM Departments
	GO

-->  Select department
	CREATE PROCEDURE [dbo].[SelectDepartments_DeptID] @DeptID int
	AS
	SELECT * FROM Departments
	WHERE DeptID = @DeptID
	GO

--> Update Departments
	CREATE PROCEDURE [dbo].[UpadateDepartments] @DeptID as int, @DeptName as varchar(100)
	AS
	BEGIN
	    IF EXISTS (SELECT DeptID FROM Departments WHERE DeptID=@DeptID)
			UPDATE Departments
			SET   DeptName = @DeptName
			WHERE DeptID = @DeptID 
	    ELSE
			PRINT ('Dept # ' + CAST(@DeptID AS varchar(20)) + ' doesn''t exists')
	END
	GO
------------------------------------------------ Student Table PS (Osama Ahmed Badr) ---------------------------------------------------------------

--> Insert Student
	CREATE PROCEDURE [dbo].[AddStudent]	 @SSN INT,@Email varchar(200), @Password varchar(50), @Fullname varchar(200),@DOB date,@Faculty varchar(50), @GYear int, @city varchar(50), @PhoneNumber varchar(50), @StartDate date, @GradDate date,@status varchar(20), @Gender nchar(10), @DeptID int
	AS
	BEGIN
		IF Not EXISTS (SELECT * FROM Students WHERE SSN = @SSN)
			INSERT INTO Students
			VALUES (@SSN, @Email, @Password,@Fullname,@DOB,@Faculty,@GYear,@city,@PhoneNumber,@StartDate,@GradDate,@status,@Gender,@DeptID)
		ELSE
			 PRINT ('SSN "' + CAST(@SSN AS varchar(20)) + @Fullname + '" is already exists')
	END
	GO

--> Delete Student 
	CREATE PROCEDURE [dbo].[DeleteStudent] @SSN INT
	AS
	BEGIN
		IF  EXISTS (SELECT * FROM Students WHERE SSN = @SSN)
			DELETE FROM Students
			WHERE ssn=@ssn
		ELSE
			 PRINT ('SSN #"' + CAST(@SSN AS varchar(20))+'" doesn''t exists')
	END
	GO

--> Select all Student
	CREATE PROCEDURE [dbo].[SelectallStudent]
	AS
	SELECT * FROM Students 
	GO

--> SELECT Student info 
	CREATE PROCEDURE [dbo].[SelectStudent_SSN] @SSN INT
	AS
	SELECT * FROM Students WHERE SSN = @SSN
	GO

--> Update GYear
	CREATE PROCEDURE [dbo].[UpdateStudentGYear] @SSN int , @GYear int
	AS
	BEGIN
	    IF EXISTS (SELECT SSN FROM Students WHERE SSN=@SSN)
			UPDATE Students
			SET  GYear = @GYear
			WHERE SSN = @SSN
	    ELSE
			PRINT ('SSN #' + CAST(@SSN AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update FullName
	CREATE PROCEDURE [dbo].[UpdateStudentName] @SSN int , @Fullname varchar(200)
	AS
	BEGIN
	    IF EXISTS (SELECT SSN FROM Students WHERE SSN=@SSN)
			UPDATE Students
			SET  FullName = @Fullname
			WHERE SSN = @SSN
	    ELSE
			PRINT ('SSN #' + CAST(@SSN AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update Password
	CREATE PROCEDURE [dbo].[UpdateStudentPassword] @SSN int , @Password varchar(50)
	AS
	BEGIN
	    IF EXISTS (SELECT SSN FROM Students WHERE SSN=@SSN)
			UPDATE Students
			SET  Password = @Password
			WHERE SSN = @SSN
	    ELSE
			PRINT ('SSN #' + CAST(@SSN AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> Update Phone number
	CREATE PROCEDURE [dbo].[UpdateStudentPhoneNum] @SSN int , @PhoneNum varchar(50)
	AS
	BEGIN
	    IF EXISTS (SELECT SSN FROM Students WHERE SSN=@SSN)
			UPDATE Students
			SET  PhoneNumber =@PhoneNum
			WHERE SSN = @SSN
	    ELSE
			PRINT ('SSN #' + CAST(@SSN AS varchar(20)) + ' doesn''t exists')
	END
	GO

------------------------------------------------ Course Table PS (Nada Mohamed Awad) ---------------------------------------------------------------

--> Insert Course:
	CREATE PROC [dbo].[AddCourse] @CrsID INT,@CrsName varchar(50), @Hours int 
	AS
	BEGIN
		IF Not EXISTS (SELECT CrsID FROM Courses WHERE CrsID = @CrsID)
			INSERT INTO Courses
			VALUES (@CrsID, @CrsName, @Hours)
		ELSE
			 PRINT ('Course "' + CAST(@CrsID AS varchar(20)) + @CrsName + '" is already exists')
	END
GO

--> Delete Course 
	CREATE PROC [dbo].[DelCourse] @CrsID int
	AS
	BEGIN TRY 
		DELETE FROM Courses WHERE CrsID = @CrsID
	END TRY
	BEGIN CATCH
		SELECT 'Cant''t Del this Course'
	END CATCH
GO

--> Select Courses based on their Hours:
	CREATE PROC [dbo].[SelectCoursebasedonHours] @Hours int
	AS
	BEGIN
	  SELECT *
	  FROM Courses
	  WHERE Hours >= @Hours;  
	END
GO

--> Update Course Name:
	CREATE PROC [dbo].[UpdateCourse] @CrsID int, @CrsName nvarchar(50)
	AS
	BEGIN
	    IF EXISTS (SELECT CrsID FROM Courses WHERE CrsID = @CrsID)
			UPDATE Courses 
			SET CrsName = @CrsName 
			WHERE CrsID = @CrsID
	    ELSE
			PRINT ('Course #' + CAST(@CrsID AS varchar(20)) + ' doesn''t exists')
	END
GO

--> Update Course Hours:
	CREATE PROC [dbo].[UpdateCourseHours] @CrsID int, @Hours int
	AS
	BEGIN
	    IF EXISTS (SELECT CrsID FROM Courses WHERE CrsID = @CrsID)
			UPDATE Courses 
			SET Hours = @Hours 
			WHERE CrsID = @CrsID
	    ELSE
			PRINT ('Course #' + CAST(@CrsID AS varchar(20)) + ' doesn''t exists')
	END
GO


----------------------------------------------- Topics Table PS (Nada Mohamed Awad) -------------------------------------------------------------

--> Insert CourseTopic
	CREATE PROC [dbo].[AddTopic]  @TopName varchar(50), @CrsID int
	AS
	BEGIN
	  IF NOT EXISTS (SELECT * FROM Topics WHERE TopName = @TopName AND CrsID = @CrsID)
	  BEGIN
		INSERT INTO Topics
		VALUES (@TopName, @CrsID)
	  END
	  ELSE
		 PRINT ('Topic "' + @TopName + '" already exists')
	END
GO

--> Delete Course Topics:
	CREATE PROC [dbo].[DeleteCourseTopics]  @CrsID int
	AS
	BEGIN
	  IF EXISTS (SELECT CrsID FROM Topics WHERE  CrsID = @CrsID)
		DELETE FROM Topics WHERE CrsID = @CrsID
	  ELSE
		PRINT ('This Course Dosn''t have Topics')
	END
GO

--> Delete Topic
	CREATE PROC [dbo].[DeleteTopic] @TopName varchar(50), @CrsID int
		AS
		BEGIN
		  IF EXISTS (SELECT TopName FROM Topics WHERE TopName = @TopName AND CrsID = @CrsID)
			DELETE FROM Topics WHERE TopName = @TopName AND CrsID = @CrsID
		  ELSE
			PRINT ('Topic ' + @TopName + ' doesn''t exists in this course')
		END
	GO

--> Select course topic
	CREATE PROC [dbo].[SelectCourseTopic] @CrsID int
		AS
		BEGIN TRY
		  SELECT   C.CrsName ,T.TopName
		  FROM Topics as T, Courses as C
		  WHERE T.CrsID = C.CrsID AND C.CrsID = @CrsID
		END TRY
		BEGIN CATCH
			PRINT ('This Course dosn''t have topics')
		END CATCH
	GO

--> Select all Topics:
	CREATE PROC [dbo].[SelectTopics] 
	AS
	BEGIN
	  SELECT *
	  FROM Topics	 
	END
	GO

--> Update Topic name
	CREATE PROC [dbo].[UpdateTopicc]  @CrsID int , @OldTopName nvarchar(50),@NewTopName nvarchar(50)
	AS
	BEGIN
	  IF EXISTS (SELECT * FROM Topics WHERE  TopName= @OldTopName AND CrsID = @CrsID)
		  UPDATE Topics 
		  SET TopName = @NewTopName 
		  WHERE  CrsID = @CrsID AND TopName = @OldTopName
	  ELSE
		PRINT ('Topic' + @OldTopName + ' doesn''t exists')
	END
GO
------------------------------------------------ StCourse Table PS  (Osama Ahmed Badr)---------------------------------------------------------------
--> Insert StCourse
	CREATE PROCEDURE [dbo].[AddStCourse] @SSN int,@CrsID int
	AS
	BEGIN
		IF Not EXISTS (SELECT * FROM StCourse WHERE SSN = @SSN AND CrsID=@CrsID)
			INSERT INTO StCourse
			VALUES (@SSN,@CrsID)
		ELSE
			 PRINT ('Both of SSN "' + CAST(@SSN AS varchar(30)) +'" And CrsID "'+CAST(@CrsID AS varchar(30))  + '"  are already existed')
	END
	GO

--> Delete StCourse 
	CREATE PROCEDURE [dbo].[DeleteStCourse] @SSN int,@CrsID int
	AS
	BEGIN
		IF EXISTS (SELECT * FROM StCourse WHERE SSN = @SSN AND CrsID=@CrsID)
			DELETE FROM StCourse
			WHERE ssn = @SSN
			AND CrsID= @CrsID
		ELSE
			 PRINT ('Both of SSN "' + CAST(@SSN AS varchar(30)) +'" And CrsID "'+CAST(@CrsID AS varchar(30))  + '"  don''t  existed')
	END
	GO

--> Select Student Courses 
	CREATE PROCEDURE SelectStCourse_SSN @SSN int
	AS
	SELECT s.FullName,c.CrsName,c.Hours FROM Students s, Courses c,StCourse sc
	WHERE s.SSN = @SSN
	AND sc.CrsID = c.CrsID
	AND sc.SSN = s.SSN
	GO

--> SELECT Course Students
	CREATE PROCEDURE SelectStCourse_CrsID @CrsID int
	AS
	SELECT s.FullName,c.CrsName,c.Hours FROM Students s, Courses c,StCourse sc
	WHERE c.CrsID=@CrsID
	AND sc.CrsID = c.CrsID
	AND sc.SSN = s.SSN

	GO
--> Update StCourse
	CREATE PROCEDURE [dbo].[UpdateStCourse] @SSN int ,@CrsIDOld int ,@CrsID int
	AS
	BEGIN
	    IF EXISTS (SELECT SSN FROM StCourse WHERE SSN=@SSN AND CrsID =@CrsIDOld)
			UPDATE StCourse
			SET  CrsID = @CrsID
			WHERE CrsID = @CrsIDOld AND SSN = @SSN
	    ELSE
			PRINT ('SSN#' + CAST(@SSN AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> SELECT All coures & enrolled students
	CREATE PROCEDURE SelectStCourse
	AS
	SELECT s.FullName,c.CrsName,c.Hours FROM Students s, Courses c,StCourse sc
	WHERE sc.CrsID = c.CrsID
	AND sc.SSN = s.SSN

------------------------------------------------ DeptCrs Table PS (Osama Ahmed Badr)---------------------------------------------------------------

--> Insert DeptCrs
	CREATE PROCEDURE [dbo].[AddDeptCrs] @DeptID int, @CrsID int
	AS
	BEGIN
		IF Not EXISTS (SELECT * FROM DeptCrs
	WHERE DeptID = @DeptID AND CrsID=@CrsID)
			INSERT INTO DeptCrs
			VALUES (@CrsID,@DeptID)
		ELSE
			 PRINT ('Both of DeptID "' + CAST(@DeptID AS varchar(30)) +'" And CrsID "'+CAST(@CrsID AS varchar(30))  + '"  are already existed')
	END
	GO

--> Delete DeptCourse
	CREATE PROCEDURE [dbo].[DeleteDeptCrs] @DeptID int, @CrsID int
	AS
	BEGIN
		IF EXISTS (SELECT * FROM DeptCrs WHERE DeptID = @DeptID AND CrsID=@CrsID)
			DELETE FROM DeptCrs
			WHERE DeptID = @DeptID AND CrsID = @CrsID
		ELSE
			PRINT ('Both of DeptID # "' + CAST(@DeptID AS varchar(30)) +'" And CrsID "'+CAST(@CrsID AS varchar(30))  + '"  don''t  existed')
	END
	GO

--> Update DeptCourse
	CREATE PROCEDURE [dbo].[UpdateDeptCourse] @DeptID int, @CrsIDOld int, @CrsID int
	AS
	BEGIN
	    IF EXISTS (SELECT DeptID  FROM Departments WHERE DeptID = @DeptID)
			UPDATE DeptCrs 
			SET  CrsID = @CrsID
			WHERE CrsID = @CrsIDOld
	    ELSE
			PRINT ('DeptID #' + CAST(@DeptID AS varchar(20)) + ' doesn''t exists')
	END
	GO

--> SELECT Departmet courses
	ALTER PROCEDURE SelectDeptCourse_DeptID @DeptID int
	AS
	SELECT d.DeptName,c.CrsName,c.Hours FROM Departments d, Courses c, DeptCrs dc
	WHERE d.DeptID = @DeptID
	AND dc.CrsID= c.CrsID
	AND dc.DeptID = d.DeptID
	GO

--> show course in which dept
	ALTER PROCEDURE SelectDeptCourse_CrsID @CrsID int
	AS
	SELECT d.DeptName,c.CrsName,c.Hours FROM Departments d, Courses c, DeptCrs dc
	WHERE c.CrsID=@CrsID
	AND dc.CrsID= c.CrsID
	AND dc.DeptID = d.DeptID
	GO

--> Select all dept and these courses
	ALTER PROCEDURE SelectDeptCourse
	AS
	SELECT d.DeptName,c.CrsName,c.Hours FROM Departments d, Courses c, DeptCrs dc
	WHERE dc.CrsID= c.CrsID
	AND dc.DeptID = d.DeptID
	GO
----------------------------------------------- InsDept Table PS (Radwa Yasser) -------------------------------------------------------------

--> Select all InsDept
	CREATE proc [dbo].[allInsDeptSelect] 
	AS
	   begin try
		select * FROM InsDept
		  end try
	   begin catch
		  select 'Empty Table'
	   end catch
	GO

--> Select Dept Instructos
	CREATE proc [dbo].[DeptInsSelect] @DeptID int
	AS
	   begin try
		select * FROM InsDept
		WHERE DeptID= @DeptID
		  end try
	   begin catch
		  select 'Department don''t have any Instructor'
	   end catch
	GO

--> Delete instructor from department 
	CREATE proc [dbo].[InsDeptDelete] @InsID int,@DeptID int
	 AS
	   begin try
		DELETE FROM InsDept
		WHERE InsID = @InsID
		and DeptID = @DeptID
		  end try
	   begin catch
		  select 'ERROR: VALUE IS NOT EXISTED'
	   end catch
	GO

--> Add instructor to department 
	CREATE PROC [dbo].[InsDeptInsert]  @DeptID int, @InsID int
	AS
	BEGIN
	  BEGIN TRY
		INSERT INTO InsDept (DeptID, InsID) 
		  VALUES (@DeptID, @InsID)
		  END TRY
		  BEGIN CATCH
		Select 'ERROR INPUT'
		END CATCH
	END
	GO

--> Update instructor department
	CREATE PROC [dbo].[InsDeptUpdate] @OldDeptID int, @OldInsID int, @DeptID int,  @InsID int 
	AS
	BEGIN
	  BEGIN TRY
		Update InsDept  
		  set DeptID=@DeptID,InsID= @InsID
		  Where @OldInsID= InsID and @OldDeptID=DeptID 
		  END TRY
		  BEGIN CATCH
		Select 'ERROR INPUT'
		END CATCH
	END
	GO
----------------------------------------------- InsCrs Table PS (Radwa Yasser) -------------------------------------------------------------

--> Select all InsCrs
	CrEate proc [dbo].[allInsCrsSelect]
	AS
	   begin try
		select * FROM InsCrs
		  end try
	   begin catch
		  select 'Empty Table'
	   end catch
	GO

--> Select all Instructors of Courses
	CrEate proc [dbo].[CourseInsSelect] @CrsID int
	AS
	   begin try
		select * FROM InsCrs
		WHERE CrsID= @CrsID
		  end try
	   begin catch
		  select 'Course dosn''t assign to any instructor'
	   end catch
	GO

--> Delete instructor Course 
	CREATE proc [dbo].[InsCrsDelete] @InsID int,@CrsID int
	 AS
	   begin try
		DELETE FROM InsCrs
		WHERE InsID = @InsID
		and CrsID = @CrsID
		  end try
	   begin catch
		  select 'Instructor IS NOT EXISTED'
	   end catch
	GO

--> Insert instructor Course 
	CREATE PROC [dbo].[InsCrsInsert] @InsID int, @CrsID int
	AS
	BEGIN
	  BEGIN TRY
		INSERT INTO InsCrs(CrsID, InsID) 
		  VALUES (@CrsID, @InsID)
		  END TRY
		  BEGIN CATCH
		Select 'This Course had assigned to this instructor before or incorrect CrsID / InsID'
		END CATCH
	END
	GO
--> Select instructor courses

	CREATE PROC [dbo].[InsCrsName2] @InsID int
	AS
		 BEGIN Try
		 SELECT Instructors.InsID ,C.CrsName FROM Instructors, Courses C, InsCrs 
		   WHERE Instructors.InsID= @InsID And Instructors.InsID= InsCrs.InsID
		   And InsCrs.CrsID =C.CrsID
		 END Try
		 Begin catch
		 SELECT 'Instructor doesn''t exists'
		 END Catch
		 go
--> Update instructor course
	CREATE PROC [dbo].[InsCrsUpdate] @OldInsID int,@OldCrsID int,@InsID int,@CrsID int 
	AS
	BEGIN
	  BEGIN TRY
		Update InsCrs  
		  set CrsID=@CrsID,InsID= @InsID
		  Where InsID= @OldInsID and CrsID=@OldCrsID 
		  END TRY
		  BEGIN CATCH
		Select 'ERROR INPUT'
		END CATCH
	END
	GO

--> Report 
	CREATE PROC [dbo].[CrsNameSelect] @InsID int
	AS
	BEGIN
	  IF EXISTS (SELECT Instructors.InsID FROM Instructors, Courses C, InsCrs 
		   WHERE Instructors.InsID= @InsID And Instructors.InsID= InsCrs.InsID
			And InsCrs.CrsID =C.CrsID)
			SELECT Instructors.InsID ,Instructors.FullName,C.CrsName, COUNT(Sc.SSN) "NoOfSt"
			FROM Instructors, Courses C, InsCrs, StCourse Sc , Students S
		   WHERE Instructors.InsID= @InsID And Instructors.InsID= InsCrs.InsID
		   And InsCrs.CrsID =C.CrsID AND Sc.SSN = S.SSN AND SC.CrsID = C.CrsID
		   GROUP BY Instructors.InsID,Instructors.FullName, C.CrsName
	  Else 
	  Select ' doesn''t exists'
	END
	GO

------------------------------------- Question Table PS (Mohamed Saeed Almeslmani) -------------------------------------------------------------

--> Delete Question
	create proc [dbo].[DeleteQues]  @id varchar (50)
	as 
	Begin try
	delete from Questions
	where QuesID = @id
	end try
	begin catch 
	select ' You can''t Delete This Question'
	end catch
	GO

--> add question
	create proc [dbo].[InsQues] @id varchar (50) , @QuesType varchar (50) ,
	@Content varchar (700) ,  @CorrectAnswer varchar (500) , @CrsId int
	as 
	begin try 
	insert into Questions
	values ( @id , @QuesType , @Content , @CorrectAnswer , @CrsId)
	end try
	begin catch
	select ' This id is already exist ' 
	end catch 
	GO

--> Select Course questions using course id 
	create proc [dbo].[SelcCourse] @Id  int 
	as 
	begin try 
	select * from Questions 
	where CrsID = @Id
	end try 
	begin catch
	select ' there is no question in this course ' 
	end catch 
	GO

--> Select Questions with it id 
	create proc [dbo].[SelcQues] @Id  varchar (50)
	as 
	begin try 
	select * from Questions 
	where QuesID = @Id
	end try 
	begin catch
	select ' this question dosn''t exist ' 
	end catch 
	GO

-->  Update Question Correct Answer
	create proc [dbo].[UpdQuesA]  @id varchar (50) , @QuesAns varchar (500)
	as 
	begin try 
	update Questions
	set Correctanswer = @QuesAns
	where QuesID = @id
	end try
	begin catch 
	select ' Please Insert Ques Id' 
	end catch
	GO

-->  Update Question Content
	create proc [dbo].[UpdQuesC]  @id varchar (50) , @QuesContent varchar (700)
	as 
	begin try 
	update Questions
	set QuesContent = @QuesContent
	where QuesID = @id
	end try
	begin catch 
	select ' Please Insert Ques Id' 
	end catch
	GO

--> Update Question Type
	create proc [dbo].[UpdQuesT]  @id varchar (50) , @QuesType varchar (50)
	as 
	begin try 
	update Questions
	set QuesType = @QuesType
	where QuesID = @id
	end try
	begin catch 
	select ' Please Insert Ques Id' 
	end catch
	GO

------------------------------------- Question Options Table PS (Mohamed Saeed Almeslmani) -------------------------------------------------------------

--> Delete Option
	create proc [dbo].[DeleteOption]  @id varchar (50) , @options varchar (500)
	as 
	Begin try
	delete from QuesOption
	where QuesID = @id
	and Options = @options
	end try
	begin catch 
	select ' You can''t Delete This Question'
	end catch
	GO

--> Add Question option
	create proc [dbo].[InsOption] @id varchar (50) ,@Options varchar (500) 
	as 
	begin try 
	insert into QuesOption
	values ( @id , @Options)
	end try
	begin catch
	select ' This id is already exist ' 
	end catch 
	GO

--> Select Options with it questionid 
	create proc [dbo].[selcOpt] @Id  varchar (50)
	as 
	begin try 
	select * from QuesOption
	where QuesID = @Id
	end try 
	begin catch
	select ' this question dosn''t exist ' 
	end catch 
	GO

--> Update Option
	create proc UpdOptions  @id varchar (50) , @OldOptions varchar (500) , @NewOptions varchar (500)
	as 
	begin try 
	update QuesOption
	set Options = @NewOptions
	where QuesID = @id
	and Options = @OldOptions
	end try
	begin catch 
	select ' This option dosn''t Exist' 
	end catch
	Go

------------------------------------------- Exams Table PS (Nada Mohamed Awad) -------------------------------------------------------------

--> Delete Exam
	CREATE PROC [dbo].[DeleteExam] @ExID int
	AS
	BEGIN TRY 
		DELETE FROM Exams WHERE ExID = @ExID
	END TRY 
	BEGIN CATCH
		SELECT 'Can''t Delete this Exam'
	END CATCH
	GO

--> Select Exam Questions
	CREATE PROC [dbo].[ExamQuestion] @ExID int 
	AS
	BEGIN TRY 
		SELECT QuesContent 
		FROM questions Q, Answers Ans
		WHERE Q.QuesID = Ans.QuesID
	END TRY 
	BEGIN CATCH
		PRINT ('Exam# ' +  CAST(@ExID AS varchar(20)) +' doesn''t exist')
	END CATCH
	GO

--> Calculate Exam Results 
	CREATE PROC [dbo].[ExamResult] @StID int, @ExID int
	AS
	BEGIN 
		UPDATE Exams
		SET TotalResult = (SELECT SUM(Score) FROM Answers WHERE SSN = @StID AND ExID = @ExID)
		WHERE ExID = @ExID

		Select TotalResult FROM Exams WHERE  ExID = @ExID
	END
	GO

--> Generate Exam 
	CREATE PROC [dbo].[GenerateExam] @CrsID int , @SSN int 
		AS
	DECLARE @ExID int
	SELECT @ExID = DATEDIFF(SECOND,'1970-01-01', GETUTCDATE())
	BEGIN TRY
	INSERT INTO Exams (ExID,DateAndTime,CrsID)
	Values
	(@ExID,GETDATE(),@CrsID)
	END TRY
	BEGIN CATCH
	PRINT ('Cant Generate')
	END CATCH
	-- Inserting the IDs of TFQ into ExamQuestion table
	BEGIN TRY
	INSERT INTO Answers (QuesID,SSN,ExID)
	SELECT TOP(2) QuesID,@SSN,@ExID
	FROM Questions
	WHERE QuesType = 'TF' AND CrsID = @CrsID 
	ORDER BY NEWID()
	END TRY
	BEGIN CATCH
	PRINT ('Cant insert')
	END CATCH
	-- inser the IDs of MCQ into ExamQuestion table
	BEGIN TRY
	INSERT INTO Answers (QuesID,SSN,ExID)
	SELECT TOP(8) QuesID,@SSN,@ExID
	FROM Questions
	WHERE QuesType = 'MCQ' AND CrsID = @CrsID 
	ORDER BY NEWID()
	END TRY
	BEGIN CATCH
	PRINT ('Cant insert')
	END CATCH
	GO

--> Select Course Exams
	CREATE PROC [dbo].[SelectCourseExams] @CrsID int
	AS
	BEGIN
		IF EXISTS (SELECT CrsID FROM Exams WHERE  CrsID = @CrsID)
			SELECT * 
			FROM Exams
			WHERE CrsID = @CrsID
		ELSE
			PRINT ('This Course Don''t have Exams')
	END
	GO

--> Select  Exams
	CREATE PROC [dbo].[SelectExams] 
	AS
	BEGIN TRY 
			SELECT * 
			FROM Exams
	END TRY
	BEGIN CATCH
		PRINT ('There is''nt any Exam')
	END CATCH
	GO

---> Report that takes exam number and the student ID then Returns the Questions in this exam with the student answers.
	CREATE PROC [dbo].[StuAnswers] @ExID int, @SNN int
	AS
	BEGIN TRY 
		SELECT QuesContent , StAns
		FROM questions Q, Answers Ans
		WHERE Ans.ExID = @ExID AND Ans.SSN = @SNN AND Q.QuesID = Ans.QuesID
	END TRY 
	BEGIN CATCH
		PRINT ('Student dosn''t take this Exam')
	END CATCH
	GO

--> Student results 
	CREATE PROC [dbo].[StudenResults] @StID int
	AS
	BEGIN TRY
		SELECT DISTINCT(CrsName) "Course Name" , TotalResult "Grades"
		FROM  Exams E , Courses C , Answers A
		WHERE E.CrsID = C.CrsID AND A.ExID = E.ExID AND A.SSN = @StID
	END TRY
	BEGIN CATCH
		PRINT ('Student didn''t take any Exam')
	END CATCH
	GO

--> Update Exam date
	CREATE PROC [dbo].[UpdateExam] @ExID INT, @dt datetime
	AS
	BEGIN
		IF EXISTS (SELECT ExID FROM Exams WHERE  ExID =@ExID)
			UPDATE Exams
			SET DateAndTime = @dt
			WHERE ExID = @ExID
	END
	GO
----------------------------------------------- Application PS (Nada Mohamed Awad) -------------------------------------------------------------

--> Select 1st Choise
	CREATE proc [dbo].[choise1] @quesid int 
	as 
	begin 
	WITH MyCte AS 
	(
	   select options,
	row_number() over (order by options desc) rank
	from quesoption 
	where quesid = @quesid
	)
	select * from mycte
	where rank = 1
	end
	GO

--> Select 2nd Choise
	CREATE proc [dbo].[choise2] @quesid int 
	as 
	begin 
	WITH MyCte AS 
	(
	   select options,
	row_number() over (order by options desc) rank
	from quesoption 
	where quesid = @quesid
	)
	select * from mycte
	where rank = 2
	end
	GO

--> Select 3rd Choise
	CREATE proc [dbo].[choise3] @quesid int 
	as 
	begin 
	WITH MyCte AS 
	(
	   select options,
	row_number() over (order by options desc) rank
	from quesoption 
	where quesid = @quesid
	)
	select * from mycte
	where rank = 3
	end
	GO

--> Select 4th Choise
	CREATE proc [dbo].[choise4] @quesid int 
	as 
	begin 
	WITH MyCte AS 
	(
	   select options,
	row_number() over (order by options desc) rank
	from quesoption 
	where quesid = @quesid
	)
	select * from mycte
	where rank = 4
	end
	GO

--> Calc Exam Results 
	CREATE PROC [dbo].[ExamResult] @StID int, @ExID int
		AS
		BEGIN 
			UPDATE Exams
			SET TotalResult = (SELECT SUM(Score) FROM Answers WHERE SSN = @StID AND ExID = @ExID)
			WHERE ExID = @ExID

			Select TotalResult FROM Exams WHERE  ExID = @ExID
		END
	GO

--> Show Students Grades
	create PROC [dbo].[Gradess] @StID int
		AS
		BEGIN TRY
			SELECT *
			FROM  Grades
			WHERE SSN = @StID
		END TRY
		BEGIN CATCH
			PRINT ('Student didn''t take any Exam')
		END CATCH
	GO

--> Show Instructor Courses
	create PROC [dbo].[inscourses] @insID int
		AS
		begin
			SELECT *
			FROM  instructorcourses
			WHERE insID = @insID
		END 
	
	GO

--> select question mcq
	CREATE PROC [dbo].[MCQues] @CrsID int
	AS
	BEGIN 
	SELECT TOP (1) QuesContent , quesid
	FROM Questions
	WHERE QuesType = 'MCQ' AND CrsID = @CrsID 
	ORDER BY NEWID()
	END 
	GO

--> select question TF
	CREATE PROC [dbo].[TFQues] @CrsID int
	AS
	BEGIN 
	SELECT TOP (1) QuesContent , quesid
	FROM Questions
	WHERE QuesType = 'TF' AND CrsID = @CrsID 
	ORDER BY NEWID()
	END 
	GO

--> question correction 
	CREATE PROC [dbo].[QuesCorrection] @StID int, @ExID int, @QuesID VarChar(50),
	@StAns varchar(700)
		AS
		BEGIN
			UPDATE Answers
				SET Score = 1
				WHERE StAns = @StAns AND StAns = (SELECT CorrectAnswer FROM Questions WHERE QuesID = @QuesID)
				AND SSN = @StID AND ExID = @ExID AND QuesID = @QuesID
			UPDATE Answers
				SET Score = 0
				WHERE StAns = @StAns AND SSN = @StID AND ExID = @ExID AND QuesID = @QuesID and Score != 1
		END 

	GO


--> save exam info 
	CREATE PROC [dbo].[SaveExamInfo] @CrsID int , @ExID INT
		AS
		BEGIN
			INSERT INTO Exams (ExID,DateAndTime,CrsID)
			Values
			(@ExID,GETDATE(),@CrsID)	
		END 
	GO


--> Save & correct answer
	CREATE PROC [dbo].[SaveOneAnswer] @StID int, @ExID int, @QuesID int ,@StAns varchar(700)
			AS
			BEGIN 
				INSERT INTO  Answers (SSN,ExID,QuesID,StAns)
				VALUES (@StID,@ExID,@QuesID,@StAns)

				UPDATE Answers
				SET Score = 1
				WHERE StAns = @StAns AND StAns = (SELECT CorrectAnswer FROM Questions WHERE QuesID = @QuesID)
				AND SSN = @StID AND ExID = @ExID AND QuesID = @QuesID
			UPDATE Answers
				SET Score = 0
				WHERE StAns = @StAns AND SSN = @StID AND ExID = @ExID AND QuesID = @QuesID And Score !=1
			END 
	GO
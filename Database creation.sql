USE [ExamSystem]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[SSN] [int] NOT NULL,
	[ExID] [int] NOT NULL,
	[QuesID] [int] NOT NULL,
	[StAns] [varchar](500) NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC,
	[ExID] ASC,
	[QuesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CrsID] [int] NOT NULL,
	[CrsName] [varchar](50) NOT NULL,
	[Hours] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CrsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DeptID] [int] NOT NULL,
	[DeptName] [varchar](100) NOT NULL,
	[MangID] [int] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeptCrs]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeptCrs](
	[CrsID] [int] NOT NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_DeptCrs] PRIMARY KEY CLUSTERED 
(
	[CrsID] ASC,
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ExID] [int] NOT NULL,
	[TotalResult] [int] NULL,
	[DateAndTime] [datetime] NULL,
	[CrsID] [int] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[ExID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsCrs]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsCrs](
	[InsID] [int] NOT NULL,
	[CrsID] [int] NOT NULL,
 CONSTRAINT [PK_InsCrs] PRIMARY KEY CLUSTERED 
(
	[InsID] ASC,
	[CrsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsDept]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsDept](
	[DeptID] [int] NOT NULL,
	[InsID] [int] NOT NULL,
 CONSTRAINT [PK_InsDept] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC,
	[InsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[InsID] [int] NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](200) NOT NULL,
	[DOB] [date] NULL,
	[Salary] [int] NOT NULL,
	[City] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
 CONSTRAINT [PK_Instructors] PRIMARY KEY CLUSTERED 
(
	[InsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuesOption]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuesOption](
	[QuesID] [int] NOT NULL,
	[Options] [varchar](500) NOT NULL,
 CONSTRAINT [PK_QuesOption_1] PRIMARY KEY CLUSTERED 
(
	[QuesID] ASC,
	[Options] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuesID] [int] NOT NULL,
	[QuesType] [varchar](50) NOT NULL,
	[QuesContent] [varchar](700) NOT NULL,
	[CorrectAnswer] [varchar](500) NOT NULL,
	[CrsID] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StCourse]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StCourse](
	[SSN] [int] NOT NULL,
	[CrsID] [int] NOT NULL,
 CONSTRAINT [PK_StCourse] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC,
	[CrsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[SSN] [int] NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](200) NOT NULL,
	[DOB] [date] NOT NULL,
	[Faculty] [varchar](50) NOT NULL,
	[GYear] [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[GradDate] [date] NOT NULL,
	[Status] [varchar](20) NULL,
	[Gender] [nchar](10) NOT NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 11/5/2022 12:25:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopName] [varchar](50) NOT NULL,
	[CrsID] [int] NOT NULL,
 CONSTRAINT [PK_Topics_1] PRIMARY KEY CLUSTERED 
(
	[TopName] ASC,
	[CrsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Exams] FOREIGN KEY([ExID])
REFERENCES [dbo].[Exams] ([ExID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Exams]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuesID])
REFERENCES [dbo].[Questions] ([QuesID])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Students] FOREIGN KEY([SSN])
REFERENCES [dbo].[Students] ([SSN])
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Students]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Instructors] FOREIGN KEY([MangID])
REFERENCES [dbo].[Instructors] ([InsID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Instructors]
GO
ALTER TABLE [dbo].[DeptCrs]  WITH CHECK ADD  CONSTRAINT [FK_DeptCrs_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[DeptCrs] CHECK CONSTRAINT [FK_DeptCrs_Courses]
GO
ALTER TABLE [dbo].[DeptCrs]  WITH CHECK ADD  CONSTRAINT [FK_DeptCrs_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
ALTER TABLE [dbo].[DeptCrs] CHECK CONSTRAINT [FK_DeptCrs_Departments]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Courses]
GO
ALTER TABLE [dbo].[InsCrs]  WITH CHECK ADD  CONSTRAINT [FK_InsCrs_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[InsCrs] CHECK CONSTRAINT [FK_InsCrs_Courses]
GO
ALTER TABLE [dbo].[InsCrs]  WITH CHECK ADD  CONSTRAINT [FK_InsCrs_Instructors] FOREIGN KEY([InsID])
REFERENCES [dbo].[Instructors] ([InsID])
GO
ALTER TABLE [dbo].[InsCrs] CHECK CONSTRAINT [FK_InsCrs_Instructors]
GO
ALTER TABLE [dbo].[InsDept]  WITH CHECK ADD  CONSTRAINT [FK_InsDept_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
ALTER TABLE [dbo].[InsDept] CHECK CONSTRAINT [FK_InsDept_Departments]
GO
ALTER TABLE [dbo].[InsDept]  WITH CHECK ADD  CONSTRAINT [FK_InsDept_Instructors] FOREIGN KEY([InsID])
REFERENCES [dbo].[Instructors] ([InsID])
GO
ALTER TABLE [dbo].[InsDept] CHECK CONSTRAINT [FK_InsDept_Instructors]
GO
ALTER TABLE [dbo].[QuesOption]  WITH CHECK ADD  CONSTRAINT [FK_QuesOption_Questions] FOREIGN KEY([QuesID])
REFERENCES [dbo].[Questions] ([QuesID])
GO
ALTER TABLE [dbo].[QuesOption] CHECK CONSTRAINT [FK_QuesOption_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Courses]
GO
ALTER TABLE [dbo].[StCourse]  WITH CHECK ADD  CONSTRAINT [FK_StCourse_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[StCourse] CHECK CONSTRAINT [FK_StCourse_Courses]
GO
ALTER TABLE [dbo].[StCourse]  WITH CHECK ADD  CONSTRAINT [FK_StCourse_Students] FOREIGN KEY([SSN])
REFERENCES [dbo].[Students] ([SSN])
GO
ALTER TABLE [dbo].[StCourse] CHECK CONSTRAINT [FK_StCourse_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Departments]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Courses] FOREIGN KEY([CrsID])
REFERENCES [dbo].[Courses] ([CrsID])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Courses]
GO

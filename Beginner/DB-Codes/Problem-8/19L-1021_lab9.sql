USE [master]
GO
/****** Object:  Database [19L-1021_lab_9]    Script Date: 5/19/2021 10:42:13 PM ******/
CREATE DATABASE [19L-1021_lab_9]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'19L-1021_lab_9', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\19L-1021_lab_9.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'19L-1021_lab_9_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\19L-1021_lab_9_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [19L-1021_lab_9] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [19L-1021_lab_9].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [19L-1021_lab_9] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET ARITHABORT OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [19L-1021_lab_9] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [19L-1021_lab_9] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET  DISABLE_BROKER 
GO
ALTER DATABASE [19L-1021_lab_9] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [19L-1021_lab_9] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [19L-1021_lab_9] SET  MULTI_USER 
GO
ALTER DATABASE [19L-1021_lab_9] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [19L-1021_lab_9] SET DB_CHAINING OFF 
GO
ALTER DATABASE [19L-1021_lab_9] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [19L-1021_lab_9] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [19L-1021_lab_9] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [19L-1021_lab_9] SET QUERY_STORE = OFF
GO
USE [19L-1021_lab_9]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_id
course_id
course_id]]]]]]]]]]]]]]] [int] NOT NULL,
	[name] [nchar](10) NULL,
	[credit_hrs] [int] NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_id
course_id
course_id]]]]]]]]]]]]]]] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[section_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[capacity] [int] NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[section_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Registeration]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Registeration] AS
SELECT Course.name, Sections.section_id, Course.credit_hrs,Course.dept_id,Sections.capacity
FROM Sections join Course
on Sections.course_id = Course.[Course_id
course_id
course_id]]]]]]]]]]]]]]]
GO
/****** Object:  Table [dbo].[Auditing]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditing](
	[Audit_id] [int] NOT NULL,
	[Last_change_on] [datetime] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Auditing] PRIMARY KEY CLUSTERED 
(
	[Audit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[dept_id] [int] NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrolled]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrolled](
	[student_roll_no] [int] NOT NULL,
	[section_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[faculty_id] [int] NOT NULL,
	[name] [nchar](10) NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[faculty_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[roll_no] [int] NOT NULL,
	[name] [nchar](10) NULL,
	[dept_id] [int] NOT NULL,
	[batch] [int] NOT NULL,
 CONSTRAINT [PK_Student_1] PRIMARY KEY CLUSTERED 
(
	[roll_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Enrolled]  WITH CHECK ADD  CONSTRAINT [FK_Enrolled_Sections] FOREIGN KEY([section_id])
REFERENCES [dbo].[Sections] ([section_id])
GO
ALTER TABLE [dbo].[Enrolled] CHECK CONSTRAINT [FK_Enrolled_Sections]
GO
ALTER TABLE [dbo].[Enrolled]  WITH CHECK ADD  CONSTRAINT [FK_Enrolled_Student] FOREIGN KEY([student_roll_no])
REFERENCES [dbo].[Student] ([roll_no])
GO
ALTER TABLE [dbo].[Enrolled] CHECK CONSTRAINT [FK_Enrolled_Student]
GO
ALTER TABLE [dbo].[Faculty]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[Faculty] CHECK CONSTRAINT [FK_Faculty_Department]
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([Course_id
course_id
course_id]]]]]]]]]]]]]]])
GO
ALTER TABLE [dbo].[Sections] CHECK CONSTRAINT [FK_Sections_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
/****** Object:  StoredProcedure [dbo].[Autiting_set]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Autiting_set]
@type int,
@work int
as begin
declare @id int = (select Max(Audit_id) from Auditing)
	
	if @id is null
	begin
		set @id = 1
	end
	else
	begin
		set @id = @id + 1
	end

	if @type = 1	
	begin
		if @work = 1
		begin
			insert into Auditing values (@id, getdate(), 'Data inserted in Student table')
		end

		if @work = 3
		begin
			insert into Auditing values (@id, getdate(), 'Data deleted in Student table')
		end
		
		if @work = 2
		begin
			insert into Auditing values (@id, getdate(), 'Data updated in Student table')
		end
	end
	
	if @type = 2	
	begin
		if @work = 1
		begin
			insert into Auditing values (@id, getdate(), 'Data inserted in Department table')
		end

		if @work = 3
		begin
			insert into Auditing values (@id, getdate(), 'Data deleted in Department table')
		end
		
		if @work = 2
		begin
			insert into Auditing values (@id, getdate(), 'Data updated in Department table')
		end
	end
	
	if @type = 3	
	begin
		if @work = 1
		begin
			insert into Auditing values (@id, getdate(), 'Data inserted in Faculty table')
		end

		if @work = 3
		begin
			insert into Auditing values (@id, getdate(), 'Data deleted in Faculty table')
		end
		
		if @work = 2
		begin
			insert into Auditing values (@id, getdate(), 'Data updated in Faculty table')
		end
	end

end
GO
/****** Object:  StoredProcedure [dbo].[Section_Reg_data]    Script Date: 5/19/2021 10:42:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Procedure [dbo].[Section_Reg_data]
as begin
select * from Registeration
end
GO
USE [master]
GO
ALTER DATABASE [19L-1021_lab_9] SET  READ_WRITE 
GO

--*************************************************************************************************************************************************
--*************************************************************************************************************************************************
--*************************************************************************************************************************************************
--*************************************************************************************************************************************************

--Question_1 and Question_2
--create Procedure Autiting_set
--@type int,
--@work int
--as begin
--declare @id int = (select Max(Audit_id) from Auditing)
	
--	if @id is null
--	begin
--		set @id = 1
--	end
--	else
--	begin
--		set @id = @id + 1
--	end

--	if @type = 1	
--	begin
--		if @work = 1
--		begin
--			insert into Auditing values (@id, getdate(), 'Data inserted in Student table')
--		end

--		if @work = 3
--		begin
--			insert into Auditing values (@id, getdate(), 'Data deleted in Student table')
--		end
		
--		if @work = 2
--		begin
--			insert into Auditing values (@id, getdate(), 'Data updated in Student table')
--		end
--	end
	
--	if @type = 2	
--	begin
--		if @work = 1
--		begin
--			insert into Auditing values (@id, getdate(), 'Data inserted in Department table')
--		end

--		if @work = 3
--		begin
--			insert into Auditing values (@id, getdate(), 'Data deleted in Department table')
--		end
		
--		if @work = 2
--		begin
--			insert into Auditing values (@id, getdate(), 'Data updated in Department table')
--		end
--	end
	
--	if @type = 3	
--	begin
--		if @work = 1
--		begin
--			insert into Auditing values (@id, getdate(), 'Data inserted in Faculty table')
--		end

--		if @work = 3
--		begin
--			insert into Auditing values (@id, getdate(), 'Data deleted in Faculty table')
--		end
		
--		if @work = 2
--		begin
--			insert into Auditing values (@id, getdate(), 'Data updated in Faculty table')
--		end
--	end

--end

--create TRIGGER Audit_log_1
--on [dbo].[Student]
--After INSERT,UPDATE,DELETE  
--AS    
--BEGIN
--declare @v1 int = (select count(roll_no) from inserted)
--	if (select count(roll_no) from inserted) = 1 AND (select count(roll_no) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 1,
--		@work = 2
--	end
--	else if (select count(roll_no) from inserted) = 1
--	begin
--		execute Autiting_set
--		@type = 1,
--		@work = 1
--	end
--	else if (select count(roll_no) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 1,
--		@work = 3
--	end
--End


--create TRIGGER Audit_log_2
--on [dbo].[Department]
--After INSERT,UPDATE,DELETE  
--AS    
--BEGIN
--	if (select count(dept_id) from inserted) = 1 AND (select count(dept_id) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 2,
--		@work = 2
--	end
--	else if (select count(dept_id) from inserted) = 1
--	begin
--		execute Autiting_set
--		@type = 2,
--		@work = 1
--	end
--	else if (select count(dept_id) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 2,
--		@work = 3
--	end
--End

--create TRIGGER Audit_log_3
--on [dbo].[Faculty]
--After INSERT,UPDATE,DELETE  
--AS    
--BEGIN
--	if (select count(faculty_id) from inserted) = 1 AND (select count(faculty_id) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 3,
--		@work = 2
--	end
--	else if (select count(faculty_id) from inserted) = 1
--	begin
--		execute Autiting_set
--		@type = 3,
--		@work = 1
--	end
--	else if (select count(faculty_id) from deleted) = 1
--	begin
--		execute Autiting_set
--		@type = 3,
--		@work = 3
--	end
--End

--insert into Faculty values (4, 'MV', 2)


--update Faculty
--set name = 'Marv' where faculty_id = 4

--delete from Faculty where faculty_id = 4

--select * from Faculty
--select * from Auditing

--delete from Auditing where Audit_id= 1
--delete from Auditing where Audit_id= 2
--delete from Auditing where Audit_id= 3

--Question_3 and Question_4
--CREATE VIEW Registeration AS
--SELECT Course.name, Sections.section_id, Course.credit_hrs,Course.dept_id,Sections.capacity
--FROM Sections join Course
--on Sections.course_id = Course.[Course_id
--course_id
--course_id]]]]]]]]]]]]]]]

--select * from Registeration

--create Procedure Section_Reg_data
--as begin
--select * from Registeration
--end
	
--execute Section_Reg_data

--select * from Course
--select * from Sections
--select * from Student


--Question_5
--create TRIGGER Dept_restrict
--on [dbo].[Department]
--Instead of INSERT,UPDATE,DELETE  AS    
--BEGIN
--	print 'Any action on Department is not allowed.'
--End


--insert into Department values (4, 'MV')

--select * from Department
--select * from Auditing

--Question_6
--create trigger database_restrictions
--on database
--for drop_table, Alter_table
--as begin
--	print 'You are not allowed to Alter or Drop table in Database.'
--	rollback
--End

--Alter table Auditing 
--Add amc int

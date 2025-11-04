
USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name
FROM master.dbo.sysdatabases
WHERE name = N'PE_DBI202_SP25B10_010325')
BEGIN
	ALTER DATABASE [PE_DBI202_SP25B10_010325] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [PE_DBI202_SP25B10_010325] SET ONLINE;
	DROP DATABASE [PE_DBI202_SP25B10_010325];
END

GO

CREATE DATABASE [PE_DBI202_SP25B10_010325]
GO

USE [PE_DBI202_SP25B10_010325]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX)
SET @sql = N''

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10)
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC

	INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1
	ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG
		AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA
		AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

/****** Object:  Table [dbo].[Departments]     ******/
CREATE TABLE Departments
(
	[DepartmentID] [int] NOT NULL primary key,
	[DepartmentName] [varchar](50) NULL,
)
GO
/****** Object:  Table [dbo].[Students]    ******/
CREATE TABLE Students
(
	[StudentID] [int] NOT NULL primary key,
	[StudentLastName] [varchar](50) NULL,
	[StudentFirstName] [varchar](50) NULL,
	[StudentSex] [varchar](50) NULL,
	[StudentBirthday] [date] NULl,
	[StudentEmail] [varchar](50) NULL,
	[StudentPhone] [varchar](20) NULL,
	[StudentAddress] [varchar](50) NULL,
	[DepartmentID] [int] NULL,
	[StudentScholarship] [float] NULL
)
GO
/****** Object:  Table [dbo].[Lectures]    ******/
CREATE TABLE Lectures
(
	[LectureID] [int] NOT NULL primary key,
	[LectureLastName] [varchar](50) NULL,
	[LectureFirstName] [varchar](50) NULL,
	[LectureSex] [varchar](50) NULL,
	[LectureBirthday] [date] NULl,
	[LectureEmail] [varchar](50) NULL,
	[LecturePhone] [varchar](20) NULL,
	[LectureAddress] [varchar](50) NULL,
	[DepartmentID] [int] NULL,
	[Certificate] [varchar] (50) NULL
)
GO
/****** Object:  Table [dbo].[Teaching]    ******/
CREATE TABLE Teaching
(
	[LectureID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	Primary key([LectureID],[SubjectID])
)
GO
/****** Object:  Table [dbo].[Subjects]     ******/
CREATE TABLE Subjects
(
	[SubjectID] [int] NOT NULL primary key,
	[SubjectName] [varchar](60) NULL,
	[SubjectNumberPeriods] [int] NULL,
	[DepartmentID] [int] NULL
) 
GO
/****** Object:  Table [dbo].[Results]     ******/
CREATE TABLE Results
(
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[NumberExams] [int] NOT NULL,
	[Score] [float] NULL
	primary key ([StudentID],[SubjectID],[NumberExams])
) 

GO
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (1, 'Mathematics')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (2, 'Computer Science')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (3, 'Software Engineering')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (4, 'Economics')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (5, 'Physics')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (6, 'Chemistry')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (7, 'Biology')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (8, 'History')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (9, 'Geography')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (10, 'English Language and Literature')

INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (11, 'Electrical Engineering')

INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (12, 'Business Administration')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (13, 'Marketing')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (14, 'Accounting and Finance')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (15, 'Software Engineering')
INSERT [dbo].[Departments]
    ([DepartmentID], [DepartmentName])
VALUES
    (16, 'Robotics and Automation')


GO
INSERT [dbo].[Students]
	([StudentID], [StudentLastName], [StudentFirstName],[StudentSex],[StudentBirthday],[StudentEmail],[StudentPhone],[StudentAddress],[DepartmentID],[StudentScholarship])
VALUES 
	(1, 'Nguyen', 'An', 'M', '2002-05-14', 'an.nguyen@example.com', '0912345678', '123 Le Loi, Hanoi', 1, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (2, 'Tran', 'Binh', 'M', '2003-07-21', 'binh.tran@example.com', '0923456789', '45 Hoang Hoa Tham, Hanoi', 2, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (3, 'Le', 'Chi', 'F', '2001-11-10', 'chi.le@example.com', '0934567890', '78 Nguyen Trai, Ho Chi Minh', 3, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (4, 'Pham', 'Dung', 'M', '2000-03-05', 'dung.pham@example.com', '0945678901', '89 Bach Mai, Hanoi', 1, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (5, 'Hoang', 'Em', 'F', '2002-12-25', 'em.hoang@example.com', '0956789012', '15 Tran Phu, Da Nang', 2, 800)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (6, 'Dang', 'Giap', 'M', '2001-06-18', 'giap.dang@example.com', '0967890123', '34 Le Thanh Tong, Hai Phong', 4, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (7, 'Vo', 'Hanh', 'F', '2003-09-09', 'hanh.vo@example.com', '0978901234', '56 Vo Thi Sau, Hue', 1, 400)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (8, 'Bui', 'Hung', 'M', '2000-02-14', 'hung.bui@example.com', '0989012345', '67 Phan Chau Trinh, Da Nang', 2, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (9, 'Ngo', 'Khanh', 'F', '2002-08-01', 'khanh.ngo@example.com', '0990123456', '78 Ba Trieu, Ho Chi Minh', 3, 750)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (10, 'Dinh', 'Lam', 'M', '2001-04-30', 'lam.dinh@example.com', '0901234567', '89 Hai Ba Trung, Hanoi', 4, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (11, 'Trinh', 'Minh', 'M', '2000-10-12', 'minh.trinh@example.com', '0912345678', '90 Tran Hung Dao, Ho Chi Minh', 5, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (12, 'Ly', 'Nam', 'M', '2003-03-20', 'nam.ly@example.com', '0923456789', '12 Le Duan, Hanoi', 4, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (13, 'Cao', 'Oanh', 'F', '2002-07-25', 'oanh.cao@example.com', '0934567890', '23 Nguyen Hue, Da Nang', 5, 800)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (14, 'Kieu', 'Phuong', 'F', '2001-05-09', 'phuong.kieu@example.com', '0945678901', '34 Tran Quoc Toan, Hue', 6, 550)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (15, 'Quach', 'Quang', 'M', '2000-01-18', 'quang.quach@example.com', '0956789012', '45 Dinh Tien Hoang, Hanoi', 4, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (16, 'Mac', 'Son', 'M', '2002-12-30', 'son.mac@example.com', '0967890123', '56 Pham Van Dong, Ho Chi Minh', 2, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (17, 'Luu', 'Tam', 'F', '2003-09-14', 'tam.luu@example.com', '0978901234', '67 Xuan Dieu, Da Nang', 1, 750)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (18, 'Hua', 'Uyen', 'F', '2001-06-22', 'uyen.hua@example.com', '0989012345', '78 Le Van Sy, Hanoi', 3, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (19, 'Han', 'Viet', 'M', '2000-03-27', 'viet.han@example.com', '0990123456', '89 Tran Nhat Duat, Hue', 4, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (20, 'Do', 'Xuan', 'M', '2002-08-15', 'xuan.do@example.com', '0901234567', '90 Nguyen Thai Hoc, Ho Chi Minh', 1, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (21, 'Tieu', 'Yen', 'F', '2001-11-05', 'yen.tieu@example.com', '0912345678', '12 Dong Khoi, Ho Chi Minh', 3, 800)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES   
    (22, 'Van', 'Zung', 'M', '2003-07-12', 'zung.van@example.com', '0923456789', '23 Hai Trieu, Da Nang', 6, 550)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (23, 'Trinh', 'Minh', 'M', '2002-10-15', 'minh.trinh@example.com', '0911122233', '101 Nguyen Hue, Da Nang', 5, 450)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (24, 'Ly', 'Nam', 'M', '2003-07-07', 'nam.ly@example.com', '0922233344', '202 Tran Hung Dao, Ho Chi Minh', 3, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (25, 'Mac', 'Oanh', 'F', '2001-09-19', 'oanh.mac@example.com', '0933344455', '303 Le Van Sy, Hanoi', 5, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (26, 'Tao', 'Phuc', 'M', '2000-12-12', 'phuc.tao@example.com', '0944455566', '404 Ton Duc Thang, Hai Phong', 2, 300)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (27, 'Vu', 'Quang', 'M', '2002-05-22', 'quang.vu@example.com', '0955566677', '505 Cach Mang Thang 8, Hue', 3, 800)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (28, 'La', 'Rang', 'F', '2001-11-25', 'rang.la@example.com', '0966677788', '606 Ly Thuong Kiet, Da Nang', 1, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (29, 'Kim', 'Son', 'M', '2003-02-18', 'son.kim@example.com', '0977788899', '707 Bach Dang, Ho Chi Minh', 4, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (30, 'To', 'Tam', 'F', '2000-08-31', 'tam.to@example.com', '0988899900', '808 Nguyen Dinh Chieu, Hanoi', 3, 400)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (31, 'Yen', 'Uyen', 'F', '2002-04-10', 'uyen.yen@example.com', '0999900111', '909 Vo Nguyen Giap, Da Nang', 1, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (32, 'Luu', 'Vinh', 'M', '2001-10-05', 'vinh.luu@example.com', '0900011223', '100 Le Duan, Hai Phong', 2, 750)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (33, 'Hong', 'Xuan', 'F', '2003-06-07', 'xuan.hong@example.com', '0911122334', '111 Phan Dinh Phung, Hue', 3, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (34, 'Duc', 'Yen', 'F', '2000-09-22', 'yen.duc@example.com', '0922233445', '222 Dien Bien Phu, Ho Chi Minh', 4, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (35, 'Thanh', 'An', 'M', '2002-01-11', 'an.thanh@example.com', '0933344556', '333 Tran Quoc Toan, Hanoi', 2, 450)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (36, 'Son', 'Bao', 'M', '2001-07-14', 'bao.son@example.com', '0944455667', '444 Pasteur, Da Nang', 3, 300)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (37, 'Mai', 'Cuc', 'F', '2003-11-18', 'cuc.mai@example.com', '0955566778', '555 Vo Van Kiet, Hue', 4, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (38, 'Chau', 'Diep', 'F', '2000-05-25', 'diep.chau@example.com', '0966677889', '666 Truong Chinh, Ho Chi Minh', 2, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (39, 'Truong', 'Hoang', 'M', '2002-09-13', 'hoang.truong@example.com', '0977788990', '777 Dong Khoi, Hanoi', 3, 400)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (40, 'Tuan', 'Kiet', 'M', '2001-12-29', 'kiet.tuan@example.com', '0988899001', '888 Le Loi, Da Nang', 2, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (41, 'Van', 'Lan', 'F', '2003-08-17', 'lan.van@example.com', '0999900123', '999 Hai Ba Trung, Hai Phong', 2, 750)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (42, 'Viet', 'Minh', 'M', '2000-07-09', 'minh.viet@example.com', '0900012345', '1000 Tran Nhan Tong, Hue', 5, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (43, 'Phong', 'Nam', 'M', '2002-03-26', 'nam.phong@example.com', '0911123456', '1100 Ly Thai To, Ho Chi Minh', 5, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (44, 'An', 'Oanh', 'F', '2001-06-21', 'oanh.an@example.com', '0922234567', '1200 Nguyen Duy, Hanoi', 6, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (45, 'Bao', 'Phuc', 'M', '2003-09-15', 'phuc.bao@example.com', '0933345678', '1300 Ton That Tung, Da Nang', 4, 300)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (46, 'Cao', 'Quang', 'M', '2000-02-05', 'quang.cao@example.com', '0944456789', '1400 Phan Van Tri, Hue', 1, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (47, 'Dao', 'Rang', 'F', '2002-10-30', 'rang.dao@example.com', '0955567890', '1500 To Hien Thanh, Ho Chi Minh', 2, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (48, 'Hao', 'Son', 'M', '2001-05-07', 'son.hao@example.com', '0966678901', '1600 Quang Trung, Hanoi', 3, 400)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (49, 'Long', 'Tam', 'F', '2003-12-11', 'tam.long@example.com', '0977789012', '1700 Hong Bang, Da Nang', 1, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (50, 'Minh', 'Uyen', 'F', '2000-04-22', 'uyen.minh@example.com', '0988890123', '1800 Le Hong Phong, Hai Phong', 6, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (51, 'Quoc', 'Vinh', 'M', '2002-08-08', 'vinh.quoc@example.com', '0999901234', '1900 Truong Sa, Hue', 4, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (52, 'Son', 'Xuan', 'F', '2001-11-14', 'xuan.son@example.com', '0900012346', '2000 Hoang Van Thu, Ho Chi Minh', 7, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (53, 'Tan', 'Yen', 'F', '2003-06-28', 'yen.tan@example.com', '0911123457', '2100 Truong Dinh, Hanoi', 2, 450)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (54, 'Tung', 'An', 'M', '2000-09-17', 'an.tung@example.com', '0922234568', '2200 Le Duan, Da Nang', 3, 300)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (55, 'Vinh', 'Bao', 'M', '2002-01-25', 'bao.vinh@example.com', '0933345679', '2300 Cach Mang Thang 8, Hue', 1, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (56, 'Xuan', 'Cuc', 'F', '2001-07-13', 'cuc.xuan@example.com', '0944456780', '2400 Bach Dang, Ho Chi Minh', 5, 600)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (57, 'Yen', 'Diep', 'F', '2003-11-08', 'diep.yen@example.com', '0955567891', '2500 Nguyen Tri Phuong, Hanoi', 3, 0)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (58, 'An', 'Hoang', 'M', '2000-05-02', 'hoang.an@example.com', '0966678902', '2600 Dien Bien Phu, Da Nang', 4, 350)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (59, 'Bao', 'Kiet', 'M', '2002-09-19', 'kiet.bao@example.com', '0977789013', '2700 Pham Van Dong, Hai Phong', 2, 750)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (60, 'Chi', 'Lan', 'F', '2001-12-26', 'lan.chi@example.com', '0988890124', '2800 Tran Hung Dao, Hue', 4, 500)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (61, 'Dung', 'Minh', 'M', '2003-08-15', 'minh.dung@example.com', '0999901235', '2900 Phan Chu Trinh, Ho Chi Minh', 1, 700)
INSERT [dbo].[Students]
    ([StudentID], [StudentLastName], [StudentFirstName], [StudentSex], [StudentBirthday], [StudentEmail], [StudentPhone], [StudentAddress], [DepartmentID], [StudentScholarship])
VALUES 
    (62, 'Em', 'Nam', 'M', '2000-07-10', 'nam.em@example.com', '0900012347', '3000 Ton Duc Thang, Hanoi', 3, 450)

GO
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (1, 'Nguyen Van', 'Linh', 'Male', '1980-05-12', 'vana.nguyen@example.com', '0123456789', '123 Main St, Hanoi', 1, 'PhD in Mathematics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (2, 'Tran Thi', 'Ha', 'Female', '1985-08-20', 'thib.tran@example.com', '0987654321', '456 Elm St, Ho Chi Minh', 1, 'PhD in Mathematics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (3, 'Le Minh', 'Chanh', 'Male', '1978-03-15', 'minhc.le@example.com', '0345678901', '789 Oak St, Da Nang', 2, 'PhD in Computer Science')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (4, 'Pham Thi', 'Hoa', 'Female', '1982-12-10', 'hoad.pham@example.com', '0567890123', '101 Pine St, Can Tho', 1, 'PhD in Mathematics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (5, 'Hoang', 'Tuan', 'Male', '1990-07-25', 'tuane.hoang@example.com', '0789012345', '202 Maple St, Hue', 4, 'Master in Economics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (6, 'Dang Hoang', 'Lan', 'Female', '1987-09-30', 'lanf.dang@example.com', '0901234567', '303 Birch St, Nha Trang', 1, 'PhD in Mathematics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (7, 'Bui Van', 'Thanh', 'Male', '1975-11-18', 'thanhg.bui@example.com', '0123987654', '404 Cedar St, Vung Tau', 3, 'PhD in Computer Science')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (8, 'Vo Thanh', 'Duy', 'Male', '1983-06-05', 'duyh.vo@example.com', '0321678905', '505 Walnut St, Hai Phong', 2, 'PhD in Computer Science')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (9, 'Do Thi', 'Mai', 'Female', '1989-04-22', 'maii.do@example.com', '0543216789', '606 Cherry St, Bac Ninh', 4, 'Master in Economics')
INSERT INTO [dbo].[Lectures]
    ([LectureID], [LectureLastName], [LectureFirstName], [LectureSex], [LectureBirthday], [LectureEmail], [LecturePhone], [LectureAddress], [DepartmentID], [Certificate])
VALUES
    (10, 'Trinh Hoang', 'Quoc', 'Male', '1992-01-10', 'quocj.trinh@example.com', '0765432109', '707 Redwood St, Da Lat', 4, 'PhD in Business Administration')



GO
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (1,1)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (1,2)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (1,3)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (1,4)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (2,6)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (2,7)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (2,3)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (3,8)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (3,14)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (3,11)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (3,15)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (4,1)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (4,2)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (4,3)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (4,4)

INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (5,16)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (5,17)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (5,19)
INSERT [dbo].[Teaching]
	([LectureID] , [SubjectID])
VALUES
    (5,20)


GO

INSERT [dbo].[Subjects]
	([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (1, 'Calculus', 60,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (2, 'Linear Algebra', 45,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (3, 'Abstract Algebra', 45,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (4, 'Analytic Geometry', 60,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (5, 'Discrete Mathematics', 45,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (6, 'Graph Theory', 60,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (7, 'Mathematical Modeling', 45,1)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (8, 'Introduction to Computer Science', 60,2)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (9, 'Programming Fundamentals', 45,2)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (10, 'Data Structures and Algorithms', 60,3)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (11, 'Computer Organization and Architecture', 45,2)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (12, 'Operating Systems', 60,3)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (13, 'Database Systems', 45,3)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (14, 'Computer Networks', 45,2)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (15, 'Software Engineering', 60,2)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (16, 'Principles of Microeconomics', 60,4)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (17, 'Principles of Macroeconomics', 60,4)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (18, 'Mathematics for Economics', 60,4)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (19, 'Statistics for Economics', 60,4)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (20, 'International Economics', 60,4)

INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (21, 'Electromagnetism', 60,5)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (22, 'Thermodynamics', 45,5)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (23, 'Statistical Mechanics', 45,5)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (24, 'Optics', 60,5)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (25, 'General Chemistry', 60,6)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (26, 'Inorganic Chemistry', 60,6)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (27, 'Organic Chemistry', 60,6)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (28, 'Physical Chemistry', 45,6)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (29, 'Analytical Chemistry', 45,6)
INSERT [dbo].[Subjects]
    ([SubjectID], [SubjectName], [SubjectNumberPeriods],[DepartmentID])
VALUES
    (30, 'Biology 1', 45,6)


GO

INSERT [dbo].[Results]
	([StudentID], [SubjectID], [NumberExams],[Score])
VALUES
    (1, 1, 1, 0.5)
INSERT [dbo].[Results]
	([StudentID], [SubjectID], [NumberExams],[Score])
VALUES
    (1, 1, 2, 8.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (1, 2, 1, 8.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (1, 3, 1, 9.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (2, 8, 1, 1.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (2, 8, 2, 8.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (2, 9, 1, 8.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (2, 11, 1, 2.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (2, 11, 2, 8.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (3, 10, 1, 2.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (3, 10, 2, 8.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (3, 12, 1, 5.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (3, 13, 1, 9.8)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 16, 1, 7.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 17, 1, 2.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 17, 2, 5.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 18, 1, 2.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 19, 1, 8.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (4, 20, 1, 6.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (5, 9, 1, 5.6)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (5, 8, 1, 9.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (5, 15, 1, 1.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (5, 15, 2, 5.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (6, 16, 1, 2.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (6, 16, 2, 2.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (6, 17, 1, 2.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (6, 18, 1, 5.6)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (7, 1, 1, 7.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (7, 2, 1, 2.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (7, 2, 2, 9.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (7, 3, 1, 7.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (8, 8, 1, 4.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (8, 8, 2, 5.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (8, 9, 1, 5.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (8, 11, 1, 2.8)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (8, 11, 2, 7.8)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (9, 12, 1, 9.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (9, 13, 1, 1.6)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (9, 13, 2, 9.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (10, 16, 1, 8.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (10, 17, 1, 5.9)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (10, 18, 1, 9.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (11, 21, 1, 5.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (11, 22, 1, 2.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (11, 23, 1, 2.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (11, 23, 2, 6.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (11, 24, 1, 8.6)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (12, 10, 1, 0.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (12, 12, 1, 8.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (12, 13, 1, 5.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (13, 21, 1, 6.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (13, 22, 1, 6.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (13, 23, 1, 8.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (13, 24, 1, 8.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (14, 14, 1, 2.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (14, 14, 2, 7.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (14, 11, 1, 5.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (14, 9, 1, 5.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (15, 10, 1, 9.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (15, 12, 1, 7.2)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (15, 13, 1, 9.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (16, 1, 1, 6.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (16, 2, 1, 4.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (16, 2, 2, 5.0)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (16, 3, 1, 3.7)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (17, 18, 1, 8.9)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (17, 19, 1, 8.8)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (17, 20, 1, 2.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (17, 20, 2, 8.4)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (18, 10, 1, 3.5)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (18, 12, 1, 9.1)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (18, 13, 1, 4.3)
INSERT [dbo].[Results]
    ([StudentID], [SubjectID], [NumberExams], [Score])
VALUES
    (18, 13, 2, 6.3)


GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lectures] ([LectureID])
GO
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([SubjectID])

GO
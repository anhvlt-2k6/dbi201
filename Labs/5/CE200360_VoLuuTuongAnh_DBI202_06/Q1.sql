/*
Note that
DO NOT USE CONSTRAINT
DO NOT USE NOT NULL, UNIQUE
[Employee] (1) ----- (m) [Department] means only one from [Employee] table can reference to [Department], but multiple [Department] can reference to [Employee]
*/

CREATE TABLE [Department] (
    [DeptID] CHAR(9) PRIMARY KEY,
    [DeptName] VARCHAR(50),
    [Region] VARCHAR(50),
    [ManagerID] CHAR(9),
    [DeptAddr] VARCHAR(50),
    [EmpID] CHAR(9)
);

CREATE TABLE [Employee] (
    [EmpID] CHAR(9) PRIMARY KEY,
    [FirstName] VARCHAR(35),
    [LastName] VARCHAR(35),
    [Phone] CHAR(15),
    [Salary] FLOAT,
    [Address] VARCHAR(50),
	[DeptID] CHAR(9),
	FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE [Project] (
    [ProjectID] CHAR(9) PRIMARY KEY,
    [ProName] VARCHAR(50),
    [Budget] INT
);

CREATE TABLE [WorkIn] (
    [EmpID] CHAR(9),
    [ProjectID] CHAR(9),
    [StartDate] DATE,
    [EndDate] DATE,
    PRIMARY KEY (EmpID, ProjectID),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

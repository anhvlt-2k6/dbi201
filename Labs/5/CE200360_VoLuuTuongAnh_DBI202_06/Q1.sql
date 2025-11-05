CREATE TABLE [Employee] (
    [EmpID] CHAR(9) PRIMARY KEY,
    [FirstName] VARCHAR(35),
    [LastName] VARCHAR(35),
    [Phone] CHAR(15),
    [Salary] FLOAT,
    [Address] VARCHAR(50)
);

CREATE TABLE [Department] (
    [DeptID] CHAR(9) PRIMARY KEY,
    [DeptName] VARCHAR(50),
    [Region] VARCHAR(50),
    [ManagerID] CHAR(9),
    [DeptAddr] VARCHAR(50),
    [EmpID] CHAR(9) NOT NULL,
    CONSTRAINT fk_department_employee FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);

CREATE TABLE [Project] (
    [ProjectID] CHAR(9) PRIMARY KEY,
    [ProName] VARCHAR(50),
    [Budget] INT
);

CREATE TABLE [WorkIn] (
    [EmpID] CHAR(9) NOT NULL,
    [ProjectID] CHAR(9) NOT NULL,
    [StartDate] DATE,
    [EndDate] DATE,
    CONSTRAINT pk_workin PRIMARY KEY (EmpID, ProjectID),
    CONSTRAINT fk_workin_employee FOREIGN KEY (EmpID) REFERENCES Employee(EmpID),
    CONSTRAINT fk_workin_project FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

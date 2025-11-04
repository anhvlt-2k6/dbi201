CREATE TABLE [Employee] (
    [empCode] VARCHAR(20) PRIMARY KEY,
    [jobTitle] TEXT,
    [FName] NVARCHAR(30),
    [LName] NVARCHAR(30)
);

CREATE TABLE [Project] (
    [projectCode] VARCHAR(30) PRIMARY KEY,
    [title] TEXT,
    [type] NVARCHAR(50)
);

CREATE TABLE [Tasks] (
    [taskNumber] INT PRIMARY KEY,
    [description] NVARCHAR(100),
    [empCode] VARCHAR(20) NOT NULL,
    [projectCode] VARCHAR(30) NOT NULL,
    CONSTRAINT fk_tasks_employee FOREIGN KEY (empCode) REFERENCES Employee(empCode),
    CONSTRAINT fk_tasks_project FOREIGN KEY (projectCode) REFERENCES Project(projectCode)
);
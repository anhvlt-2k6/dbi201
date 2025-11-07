CREATE TABLE [Employee] (
    [empCode] VARCHAR(20) PRIMARY KEY,
    [jobTitle] TEXT,
    [name] NVARCHAR(50),
);

CREATE TABLE [Project] (
    [code] VARCHAR(30) PRIMARY KEY,
    [title] TEXT,
    [empCode] VARCHAR(20) NOT NULL,
    CONSTRAINT fk_project_employee FOREIGN KEY (empCode) REFERENCES Employee(empCode)
);

CREATE TABLE [Tasks] (
    [taskNumber] INT PRIMARY KEY,
    [description] NVARCHAR(100),
    [code] VARCHAR(30) NOT NULL,
    CONSTRAINT fk_tasks_code FOREIGN KEY (code) REFERENCES Project(code)
);

CREATE TABLE [do] (
    [taskNumber] INT NOT NULL,
    [empCode] VARCHAR(20) NOT NULL,
    CONSTRAINT pk_do PRIMARY KEY (taskNumber, empCode),
    CONSTRAINT fk_do_employee FOREIGN KEY (empCode) REFERENCES Employee(empCode),
    CONSTRAINT fk_do_tasks FOREIGN KEY (taskNumber) REFERENCES Tasks(taskNumber)
);
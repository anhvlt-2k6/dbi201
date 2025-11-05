SELECT Id AS StudentId, [Name], Gender, Country, Department
    FROM Students
    WHERE Id >= 70 AND Department = 'AI';
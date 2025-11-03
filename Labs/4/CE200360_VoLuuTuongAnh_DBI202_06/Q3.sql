SELECT Id AS StudentID, [Name], Gender, Country, Department
    FROM Students
    WHERE Department = 'SE' AND Id <= 8;
SELECT s.StudentID, s.StudentLastName, s.StudentFirstName, d.DepartmentName
    FROM Students AS s, Departments AS d
    WHERE s.DepartmentID = d.DepartmentID
        AND d.DepartmentName = 'Computer Science'
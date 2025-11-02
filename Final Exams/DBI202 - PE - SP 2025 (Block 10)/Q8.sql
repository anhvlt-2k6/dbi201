SELECT s.StudentID, s.StudentLastName, s.StudentFirstName
    FROM Students AS s
    WHERE s.StudentScholarship = (
        SELECT MAX(s.StudentScholarship)
        FROM Students AS s, Departments AS d
        WHERE s.DepartmentID = d.DepartmentID
            AND d.DepartmentName = 'Mathematics'
    )
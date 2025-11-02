SELECT s.StudentID, s.StudentLastName, s.StudentFirstName
    FROM Students AS s
    WHERE s.StudentFirstName LIKE 'T%';
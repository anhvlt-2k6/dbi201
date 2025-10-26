SELECT s.StudentID, s.StudentLastName, s.StudentFirstName, a.Age
    FROM (
        SELECT s.StudentID, (YEAR(CURRENT_TIMESTAMP) - YEAR(s.StudentBirthday)) AS Age
            FROM Students AS s
    ) AS a, Students AS s
    WHERE a.StudentID = s.StudentID
        AND a.Age > 20

SELECT s.StudentID, s.StudentFirstName, s.StudentLastName, su.SubjectName, g.FinalGrade
    FROM (
        SELECT r.StudentID, r.SubjectID, MAX(Score) AS FinalGrade
            FROM Results AS r
            GROUP BY r.StudentID, r.SubjectID
    ) AS g, Students AS s, Subjects AS su
    WHERE g.StudentID = s.StudentID AND g.SubjectID = su.SubjectID
    ORDER BY s.StudentID, su.SubjectName

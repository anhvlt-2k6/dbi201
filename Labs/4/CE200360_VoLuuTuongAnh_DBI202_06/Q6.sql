SELECT a.Id AS AssessmentID, a.Type, c.Id AS CourseId, MAX(m.Mark) AS Mark
    FROM Assessments AS a
        JOIN Courses AS c ON a.CourseId = c.Id
        JOIN Marks AS m ON a.Id = m.AssessmentId AND m.Mark = (
                                                            SELECT MAX(m.Mark)
                                                                FROM Marks AS m)
    GROUP BY a.Id, a.Type, c.Id
    ORDER BY a.Id
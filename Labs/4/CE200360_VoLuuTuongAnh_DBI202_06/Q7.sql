SELECT a.Id AS AssessmentID, a.[Type], c.Id AS CourseId, ROUND(AVG(m.Mark), 0) AS Avg_Mark
    FROM Assessments AS a
        JOIN Courses AS c ON a.CourseId = c.Id
        JOIN Marks AS m ON a.Id = m.AssessmentId
    GROUP BY a.Id, a.[Type], c.Id
    HAVING AVG(m.Mark) <= 4.0
	ORDER BY AVG(m.Mark);
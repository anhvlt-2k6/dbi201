SELECT s.Id AS StudentId, s.Name AS StudentName, a.Id AS AssessmentID, a.[Type], c.Id AS CourseId, AVG(m.Mark) AS Avg_Mark
    FROM Students AS s
        JOIN Enroll AS e ON s.Id = e.StudentId
        JOIN Courses AS c ON e.CourseId = c.Id
        JOIN Assessments AS a ON a.CourseId = c.Id
        JOIN Marks AS m ON m.AssessmentId = a.Id
    GROUP BY s.Id, s.Name, a.Id, a.[Type], c.Id
    HAVING AVG(m.Mark) >= 9.8;
SELECT DISTINCT s.Id As StudentId, s.Name AS StudentName, se.Code, s.Department, COUNT(DISTINCT s.Id) AS NumberOfStudents
    FROM Students AS s
        JOIN Enroll AS e ON s.Id = e.StudentId
        JOIN Semesters AS se ON se.Id = e.SemesterId AND se.Code = 'Su2022'
    WHERE s.Department = 'SE'
    GROUP BY s.Id, s.Name, se.Code, s.Department;
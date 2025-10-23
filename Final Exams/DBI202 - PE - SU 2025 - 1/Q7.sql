SELECT TOP(1) Ssn, Fname, Lname, COUNT(Pno) AS DoneProjects
    FROM EMPLOYEE, WORKS_ON
    WHERE EMPLOYEE.Ssn = WORKS_ON.Essn
    GROUP BY Ssn, Fname, Lname
    ORDER BY DoneProjects DESC
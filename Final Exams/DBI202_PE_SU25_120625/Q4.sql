SELECT Lname, Fname
    FROM EMPLOYEE
    WHERE Salary > (
        SELECT MAX(Salary) AS AVG
            FROM EMPLOYEE
            WHERE Dno = 5
);

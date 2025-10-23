SELECT Fname, Lname, Salary
    FROM EMPLOYEE
    WHERE Dno = (
        SELECT TOP(1) Dno
            FROM EMPLOYEE
            ORDER BY Salary DESC
    )
    ORDER BY Salary;

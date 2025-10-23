-- Questionable
SELECT DISTINCT Dname, Lname, Fname, Pname
    FROM EMPLOYEE AS e
    JOIN DEPARTMENT AS d ON e.Dno = d.Dnumber
    JOIN PROJECT AS p ON e.Dno = p.Dnum
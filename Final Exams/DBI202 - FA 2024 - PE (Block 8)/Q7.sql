WITH DeptList AS (
    SELECT DepartmentID, Name
        FROM Departments
        WHERE Name IN ('Cardiology', 'Neurology', 'Pediatrics', 'Dermatology', 'Oncology')
), YearList AS (
    SELECT DISTINCT YEAR(AppointmentDate) AS Year
        FROM Appointments
)

SELECT de.DepartmentID, de.Name, y.Year, SUM(t.Cost) AS TotalCost
    FROM DeptList AS de
        CROSS JOIN YearList AS y
        LEFT JOIN Doctors AS d ON de.DepartmentID = d.DepartmentID
        LEFT JOIN Appointments AS a ON d.DoctorID = a.DoctorID AND YEAR(a.AppointmentDate) = y.Year
        LEFT JOIN AppointmentTests AS at ON a.AppointmentID = at.AppointmentID
        LEFT JOIN Tests AS t ON at.TestID = t.TestID
    GROUP BY de.DepartmentID, de.Name, y.Year
    ORDER BY y.Year, de.Name;
